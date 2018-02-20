class User < ApplicationRecord
  has_many :beer_likes, dependent: :destroy
  has_many :likes, foreign_key: "user_id", class_name: "BeerLike", dependent: :destroy
  has_many :beers, through: :beer_likes, dependent: :destroy
  has_attached_file :profile_img, styles: {:thumb => "200x200", small: "64x64", med: "300x300", large: "400x400" }, :convert_options => {
        :thumb => "-gravity center -background white -extent 200x200", :large => "-gravity center -background white -extent 400x400" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :profile_img, content_type: /\Aimage\/.*\Z/
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :name, presence: :true
end
