class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def new
		@user = User.find_by(remember_digest: User.digest(cookies.permanent[:remember_token]))
	end

	def create
		@post = Post.new(post_params)
		@post.author_id = @current_user.id

		if @post.save
			flash[:success] = "Post successfully made!"
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def index
		@posts = Post.all
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :author_id)
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end
end
