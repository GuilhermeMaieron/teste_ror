class PostsController < ApplicationController

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only:[:index]
  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)
    @post.user_ids = @post.user_ids << current_user.id
    @post.likes = 0
    if @post.save
      redirect_to root_path
    end
  end

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @per_page = 4
    @count = Post.count()
    if @count % @per_page == 0
      @total_pages = @count/@per_page
    else
      @total_pages = @count/@per_page+1
    end
    @page = 1 if @page - 1 <= 0
    @posts = Post.order(created_at: :desc).limit(@per_page).offset((@page - 1) * @per_page)
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render 'show'
  end

  def likes
    @post = Post.find(params[:post_id])
    @likes = @post.likes
    render json: @likes.to_json
  end

  private

    def post_params
      params.require(:post).permit(:titulo, :foto,:likes,  user_ids:[])
    end

end
