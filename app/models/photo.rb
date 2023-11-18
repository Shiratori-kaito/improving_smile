class Photo < ApplicationRecord
  has_one_attached :image
  has_one :analyse_face_detail
  has_one :analyse_face_emotion
  belongs_to :user

  validates :user_id, presence: true

  def s3_image
    client = Aws::Rekognition::Client.new(region: 'ap-northeast-1')
    response = client.detect_faces({
      image: {
        s3_object: {
          bucket: "smile-images",
          name: self.image.key
        }
      },
      attributes: ['ALL']
    })

    face_detail = response.face_details.first
  end

  def analysed?
    self.analyse_face_detail.present? && self.analyse_face_emotion.present?
  end

end
