class Post < ApplicationRecord
  belongs_to :user
  belongs_to :analyse_face_emotion, dependent: :destroy
  belongs_to :analyse_face_detail, dependent: :destroy
  has_one :photo, through: :analyse_face_detail
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy



  attr_accessor :width, :height

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  private


end
