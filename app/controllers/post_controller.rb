class PostController < ApplicationController

 skip_before_filter :verify_authenticity_token  

  def new
  	@post = Post.new()
  end 

  def create
  	@post = Post.new(user_params)
  	@post.save
  	respond_to do |format|
  		format.html # index.html.erb
   		format.json { render json: @post }
	end

  end

  private
	  def user_params
	    params.require(:post).permit(:title)
	  end
end