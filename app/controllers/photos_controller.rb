# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :set_user, only: %i[create detect_faces]
  skip_before_action :require_signup, only: %i[capture create detect_faces]

  def capture; end

  def create
    @photo = @user.photos.new
    if @photo.save
      @photo.image.attach(photo_params[:image])
      redirect_to photos_detect_faces_path
    else
      render :capture
    end
  end

  def detect_faces
    @photo = @user.photos.last
    @image = @photo.image

    face_detail = @photo.s3_image
    @analyse_face_detail = AnalyseFaceDetail.create!({
                                                       photo_id: @photo.id,
                                                       smile: face_detail[:smile][:confidence],
                                                       sunglass: face_detail[:sunglasses][:value],
                                                       eye_open: face_detail[:eyes_open][:value],
                                                       mouth_open: face_detail[:mouth_open][:value],
                                                       eye_direction_yaw: face_detail[:eye_direction][:yaw],
                                                       eye_direction_pitch: face_detail[:eye_direction][:pitch],
                                                       agerange_high: face_detail[:age_range][:high],
                                                       agerange_low: face_detail[:age_range][:low]
                                                     })

    @emotion = face_detail.emotions

    @analyse_face_emotion = AnalyseFaceEmotion.create!({
                                                         photo_id: @photo.id,
                                                         happy: (@emotion.find do |e|
                                                                   e[:type] == 'HAPPY'
                                                                 end&.dig(:confidence)&.* 100).round,
                                                         sad: (@emotion.find do |e|
                                                                 e[:type] == 'SAD'
                                                               end&.dig(:confidence)&.* 100).round,
                                                         angry: (@emotion.find do |e|
                                                                   e[:type] == 'ANGRY'
                                                                 end&.dig(:confidence)&.* 100).round,
                                                         surprised: (@emotion.find do |e|
                                                                       e[:type] == 'SURPRISED'
                                                                     end&.dig(:confidence)&.* 100).round,
                                                         calm: (@emotion.find do |e|
                                                                  e[:type] == 'CALM'
                                                                end&.dig(:confidence)&.* 100).round,
                                                         fear: (@emotion.find do |e|
                                                                  e[:type] == 'FEAR'
                                                                end&.dig(:confidence)&.* 100).round,
                                                         confused: (@emotion.find do |e|
                                                                      e[:type] == 'CONFUSED'
                                                                    end&.dig(:confidence)&.* 100).round,
                                                         disgusted: (@emotion.find do |e|
                                                                       e[:type] == 'DISGUSTED'
                                                                     end&.dig(:confidence)&.* 100).round
                                                       })
    @data = @analyse_face_emotion.emotion_data

    @analyse_face_emotion.emotion_comment = view_context.extra_comment(@analyse_face_emotion)
    @analyse_face_emotion.save!
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
