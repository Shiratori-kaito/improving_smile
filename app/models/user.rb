# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  
  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

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

  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  enum role: { general_user: 0, guest_user: 1 }

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
