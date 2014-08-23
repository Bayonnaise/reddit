class CommentsController < ApplicationController
	

	def create
		@post = Post.find(params[:post_id])
		comment_text = params[:comment][:text]
		@post.comments << Comment.new(text: comment_text, user_id: current_user.id)

		redirect_to post_path(@post)
	end
end
