class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, except: [:index, :new, :create]

  layout "application", except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post       = Post.new
    @categories = Category.all
  end

  def create
    @post            = current_user.posts.new(post_params)
    @post.categories = params[:categories]
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :cover, :categories)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
