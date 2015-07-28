class PostsController < ApplicationController
  enable_sync only: [:create, :update, :destroy]

  before_action :set_post, only: [:index, :show, :edit, :update, :destroy, :right_container]

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

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
