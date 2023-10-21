class Photo < ApplicationRecord
  has_one_attached :image
  has_one :analyse_face_detail
  has_one :analyse_face_emotion
  belongs_to :user
end
