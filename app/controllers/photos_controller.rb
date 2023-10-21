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

    client = Aws::Rekognition::Client.new(region: 'ap-northeast-1')
    response = client.detect_faces({
      image: {
        s3_object: {
          bucket: "smile-images", # 画像の保存先のバケット名
          name: @image.key # 画像のファイル名
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

    @emotion = face_detail.emotions

    @analyse_face_emotion = AnalyseFaceEmotion.create({
    photo_id: @photo.id,
    happy: (@emotion.find { |e| e[:type] == 'HAPPY' }&.dig(:confidence) * 100).round,
    sad: (@emotion.find { |e| e[:type] == 'SAD' }&.dig(:confidence) * 100).round,
    angry: (@emotion.find { |e| e[:type] == 'ANGRY' }&.dig(:confidence) * 100).round,
    surprised: (@emotion.find { |e| e[:type] == 'SURPRISED' }&.dig(:confidence) * 100).round,
    calm: (@emotion.find { |e| e[:type] == 'CALM' }&.dig(:confidence) * 100).round,
    fear: (@emotion.find { |e| e[:type] == 'FEAR' }&.dig(:confidence) * 100).round,
    confused: (@emotion.find { |e| e[:type] == 'CONFUSED' }&.dig(:confidence) * 100).round,
    disgusted: (@emotion.find { |e| e[:type] == 'DISGUSTED' }&.dig(:confidence) * 100).round
    })
    @data = {
      "喜び" => @analyse_face_emotion.happy,
      "悲しむ" => @analyse_face_emotion.sad,
      "怒り" => @analyse_face_emotion.angry,
      "驚き" => @analyse_face_emotion.surprised,
      "落ち着き" => @analyse_face_emotion.calm,
      "恐れ" => @analyse_face_emotion.fear,
      "混乱" => @analyse_face_emotion.confused,
      "嫌悪" => @analyse_face_emotion.disgusted
    }






  end

  private

  def photo_params
    params.require(:photo).permit(:file)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end