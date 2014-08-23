class PostsController < ApplicationController

	before_action :authenticate_user!, except: :index

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@type = params[:type]
	end

	def create
		@post = Post.new(params[:post].permit(:title, :text, :url))
		@post.user_id = current_user.id

		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
		@type = params[:type]
	end

	def update
		@post = Post.new(params[:post].permit(:title, :text, :url))
		@post.user_id = current_user.id

		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to '/posts'
	end
end
