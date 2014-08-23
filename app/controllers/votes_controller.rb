class VotesController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		direction = params[:direction]
		post.votes << Vote.new(direction: direction)
		
		render json: { new_count: post.count_netvotes }
	end
end
