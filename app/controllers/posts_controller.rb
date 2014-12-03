class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource

  def index
    @posts = Post.all

    if user_signed_in?
      @otherposts = Post.where.not(user_id: current_user.id)
    else
      @otherposts = Post.all
    end
  end

  def show
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    render action: :show
  end

  def update
    @post.update(post_params)
    render action: :show
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :read_time, :user_id)
    end
end
