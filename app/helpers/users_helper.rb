module UsersHelper
	def get_username(item)
		User.find_by(id: item.user_id).username
	end

	def get_user(item)
		User.find_by(id: item.user_id)
	end
end
