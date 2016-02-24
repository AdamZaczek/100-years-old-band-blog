class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: 'x', password: 'x', except: [:index, :show]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(allowed_params)
      
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def index
    @posts = Post.all
  end
  
  def edit
   # @post = Post.find(params[:id])
  end
  
  def admin
    @posts = Post.all
  end
  
  def update
    if @post.update_attributes(allowed_params)
      redirect_to posts_path
    else
      render 'new'
    end
  end
  
  def destroy
    @post.destroy
      redirect_to posts_path
  end

private

  def find_post
    @post = Post.find(params[:id])
  end

  def allowed_params
    params.require(:post).permit(:title, :body)
  end
end