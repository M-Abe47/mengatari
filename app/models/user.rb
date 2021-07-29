class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
	has_many :memos, dependent: :destroy
  has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_posts, through: :favorites, source: :post
  has_many :post_comments, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction , length: { maximum: 200 }

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
