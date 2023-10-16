class PhotosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_user, only: [:create, :detect_faces]

  def capture;end

  def create
    @photo = @user.photos.new(photo_params)
    if @photo.save
      @photo.image.attach(params[:photo][:image])
      redirect_to photos_detect_faces_path
    else
      render :capture
    end
  end


  def detect_faces


    @photo = @user.photos.last
    @image = @photo.image

    image_url = rails_blob_url(@photo.image)

    client = Aws::Rekognition::Client.new(region: 'ap-northeast-1')

    response = client.detect_faces({
      image: {
        s3_object: {
          bucket: "smile-images", # 画像の保存先のバケット名
          name: image_url.split('/')[-1] # 画像のファイル名
        }
      },
      attributes: ['ALL']
    })
    
    face_detail = response.face_details.first
    @analyse_face_dateil = AnalyseFaceDetail.create({
      photo_id: @photo.id,
      smile: face_detail[:smile][:confidence],
      sunglass: face_detail[:sunglasses][:value],
      eye_open: face_detail[:eyes_open][:confidence],
      mouth_open: face_detail[:mouth_open][:confidence],
      eye_direction: face_detail[:eye_direction][:confidence]
    })

    emotions = face_detail.emotions
    @analyse_face_emotion = AnalyseFaceEmotion.create({
      photo_id: @photo.id,
      happy: (emotions.find { |e| e[:type] == 'HAPPY' }&.dig(:confidence) * 100).round,
      sad: (emotions.find { |e| e[:type] == 'SAD' }&.dig(:confidence) * 100).round,
      angry: (emotions.find { |e| e[:type] == 'ANGRY' }&.dig(:confidence) * 100).round,
      surprised: (emotions.find { |e| e[:type] == 'SURPRISED' }&.dig(:confidence) * 100).round,
      calm: (emotions.find { |e| e[:type] == 'CALM' }&.dig(:confidence) * 100).round,
      fear: (emotions.find { |e| e[:type] == 'FEAR' }&.dig(:confidence) * 100).round,
      confused: (emotions.find { |e| e[:type] == 'CONFUSED' }&.dig(:confidence) * 100).round,
      disgusted: (emotions.find { |e| e[:type] == 'DISGUSTED' }&.dig(:confidence) * 100).round
    })
    




  end

  private

  def photo_params
    params.require(:photo).permit(:file)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
