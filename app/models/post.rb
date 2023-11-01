class Post < ApplicationRecord
  belongs_to :user
  belongs_to :analyse_face_emotion
  belongs_to :analyse_face_detail
  has_one :photo, through: :analyse_face_detail
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
