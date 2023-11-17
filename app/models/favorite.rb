class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one :photo, through: :post
  has_one :analyse_face_detail, through: :post
  has_one :analyse_face_emotion, through: :post
  
  validates :post_id, uniqueness: { scope: :user_id }
end
