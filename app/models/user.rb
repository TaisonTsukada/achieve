class User < ApplicationRecord
  has_one_attached :icon
  has_many :blogs,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :all_favorites, through: :favorites, source: :blog

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  paginates_per 10

  scope :user_all, -> {
    select(:id, :name)
    .order(created_at: :asc)
  }
end
