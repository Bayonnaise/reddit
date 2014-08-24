class Post < ActiveRecord::Base
	validates :title, presence: true

	belongs_to :user
	has_many :votes, dependent: :destroy
	has_many :comments, dependent: :destroy

	before_save :format_url

	def was_created_by?(user)
		self.user == user
	end

	def count_upvotes
		self.votes.select { |vote| vote.direction == 'up' }.count
	end

	def count_downvotes
		self.votes.select { |vote| vote.direction == 'down' }.count
	end

	def count_netvotes
		self.count_upvotes - self.count_downvotes
	end

	def get_domain
		URI.parse(self.url).host.sub(/^www\./, '') if self.url.present?
	end

	def format_url
		if self.url.present?
			self.url = "http://#{self.url}" unless self.url[/^https?/] 
		end
	end
end
