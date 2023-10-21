class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :posts
  has_many :photos
  # has_many :active_friendships, class_name :'Friendship', foreign_key: :follower_id, dependent: :destroy, inverse_of: :follower
  # has_many :passive_friendships, class_name :'Friendship', foreign_key: :followed_id, dependent: :destroy, inverse_of: :followed

  has_many :followers,
           class_name: 'Relationship',
           foreign_key: 'follower_id',
           dependent: :destroy,
           inverse_of: :follower

  has_many :followings,
           class_name: 'Relationship',
           foreign_key: 'following_id',
           dependent: :destroy,
           inverse_of: :following
  has_many :following_users, through: :followers, source: :following # フォローしているユーザー
  has_many :follower_users, through: :followings, source: :follower # フォローされているユーザー

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def follow(user_id)
    followers.create(following_id: user_id)
  end

  def unfollow(user_id)
    followers.find_by(following_id: user_id).destroy
  end

  def following?(user)
    following_users.include?(user)
  end
end
