class Post < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  attachment :image

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
