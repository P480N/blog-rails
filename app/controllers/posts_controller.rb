class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, except: [:index, :new, :create]
  before_action :authenticate_editor!, only: [:new, :create, :update]
  before_action :authenticate_admin!, only: [:destroy, :publish]

  layout "application", except: [:index, :show]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 6).publicados.ultimos
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

  def publish
    @post.publish!
    redirect_to @post
  end

  def unpublish
    @post.unpublish!
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :cover, :categories, :markup_body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
