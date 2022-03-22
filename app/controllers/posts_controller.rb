class PostsController < ApplicationController

  skip_before_action :authenticate_user!, only:[:index]

  def new
    @post = Post.new()
    @post.tags.build
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
    @total_pages = Lista.numero_paginas()
    @page = Lista.pg_n(params[:page])
    @posts = Lista.page_posts(@page).includes(:post_users, :users)
  end

  def show
    @post = Post.includes(:post_users, :users).find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(likes: @post.likes + post_params["likes"].to_i)
    render 'show'
  end

  def likes
    @post = Post.includes(:post_users, :users).find(params[:post_id])
    @likes = @post.likes
    render json: @likes.to_json
  end


  private
    def post_params
      params.require(:post).permit(:titulo, :foto,:likes, tags_attributes:[:id, :nome] ,user_ids:[])
    end

end
