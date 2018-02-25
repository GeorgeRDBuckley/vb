class User < ApplicationRecord
  has_many :likes, foreign_key: "user_id", class_name: "BeerLike", dependent: :destroy
  mount_uploader :profile_img, ProfileImageUploader, mount_on: :profile_img_file_name
  
    has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :name, presence: :true
end
