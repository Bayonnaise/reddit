class Post < ActiveRecord::Base
	validates :title, presence: true

	belongs_to :user

	def was_created_by?(user)
		self.user == user
	end
end
