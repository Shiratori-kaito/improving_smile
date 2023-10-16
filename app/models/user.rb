class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :posts
  has_many :photos
  # has_many :active_friendships, class_name :'Friendship', foreign_key: :follower_id, dependent: :destroy, inverse_of: :follower
  # has_many :passive_friendships, class_name :'Friendship', foreign_key: :followed_id, dependent: :destroy, inverse_of: :followed


  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
