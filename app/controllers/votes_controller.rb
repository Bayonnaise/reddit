class VotesController < ApplicationController

	def create
		if user_signed_in?
			@post = Post.find(params[:post_id])
			direction = params[:direction]
			@post.votes << Vote.new(direction: direction)

			redirect_to '/posts'
		else
			redirect_to new_user_session_path
		end
	end
end
