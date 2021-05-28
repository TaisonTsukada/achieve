class User < ApplicationRecord
  has_one_attached :icon
  has_many :blogs,dependent: :destroy
  has_many :comments,dependent: :destroy
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
