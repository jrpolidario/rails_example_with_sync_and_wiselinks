class PostsController < ApplicationController
  enable_sync only: [:create, :update, :destroy]

  before_action :set_post, only: [:index, :show, :edit, :update, :destroy, :right_container]
  before_action :set_target, only: [:create, :update]

  def index
    @post = Post.find(params[:post_id]) if params[:post_id]
    @right_container_action = params[:right_container_action]

    if request.wiselinks_partial?
      render partial: 'posts/right_container', locals: {post: @post, action: @right_container_action}
    else
      @posts = Post.all
      @new_post = Post.new
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash.now.notice = 'Post has been created.'
      @post = Post.new
    end

    respond_to do |format|
      format.js
    end
  end

  def update
    if @post.update(post_params)
      flash.now.notice = 'Post has been updated.'
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @post.destroy
      flash.now.notice = 'Post has been destroyed.'
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_post
    @post = Post.find_by_id(params[:id])
  end

  def set_target
    @target = params[:target]
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
