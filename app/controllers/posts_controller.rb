class PostsController < ApplicationController
  enable_sync only: [:create, :update, :destroy]

  before_action :set_post, only: [:index, :show, :edit, :update, :destroy, :right_container]

  # before_action :set_posts, only: [:index, :show, :edit]

  # before_action :redirect_to_index_if_reloaded, only: [:edit]

  # GET /posts
  # GET /posts.json
  def index
    # render :index
    @post = Post.find(params[:post_id]) if params[:post_id]
    @right_container_action = params[:right_container_action] || params[:right_container_action]

    if request.wiselinks_partial?
      render partial: 'posts/right_container', locals: {post: @post, action: @right_container_action}
    else
      @posts = Post.all
      @new_post = Post.new
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  # def show
  #   if request.wiselinks_partial?
  #     render partial: 'posts/show', locals: {post: @post}
  #   else
  #     render :index
  #   end
  # end

  # GET /posts/1/edit
  # def edit
  #   if request.wiselinks_partial?
  #     render partial: 'posts/edit', locals: {post: @post}
  #   else
  #     render :index
  #   end
  # end

  # POST /posts
  # POST /posts.json
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

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      flash.now.notice = 'Post has been updated.'
    end

    respond_to do |format|
      format.js
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.destroy
      flash.now.notice = 'Post has been destroyed.'
    end

    respond_to do |format|
      format.js
    end
  end

  private

  # def set_posts
  #   referrer = Rails.application.routes.recognize_path(request.referrer)
  #   # if referrer.blank? || (controller_name == 'posts' && action_name == 'index')
  #   if !request.wiselinks_partial?
  #     # if new page / refreshed
  #     @posts = Post.all
  #     @is_fresh_page = true
  #   end
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
