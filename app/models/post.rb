class Post < ApplicationRecord
  belongs_to :user
	has_one :memo, dependent: :destroy
	has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :post_comments, dependent: :destroy
  attachment :image

  # def start_time
  #   self.memo.start_time
  # end

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
