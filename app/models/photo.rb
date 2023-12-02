# frozen_string_literal: true

class Photo < ApplicationRecord
  has_one_attached :image
  has_one :analyse_face_detail, dependent: :destroy
  has_one :analyse_face_emotion, dependent: :destroy
  belongs_to :user

  def s3_image
    # 環境変数からAWSの認証情報を取得
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
  
    # Rekognition クライアントの初期化
    client = Aws::Rekognition::Client.new(
      region: 'ap-northeast-1', 
      credentials: credentials
    )
  
    response = client.detect_faces({
      image: {
        s3_object: {
          bucket: 'smile-images',
          name: image.key
        }
      },
      attributes: ['ALL']
    })
  
    response.face_details.first
  end

  def analysed?
    analyse_face_detail.present? && analyse_face_emotion.present?
  end
end
