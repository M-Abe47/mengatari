class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
