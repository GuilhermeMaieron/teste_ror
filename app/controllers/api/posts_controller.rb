class Api::PostsController < Api::ApplicationController
  def show
    @post = Post.includes(:post_users, :users).find(params[:id])
    @post_users = @post.post_users
    render :show
  end

  def index
    @total_pages = Lista.numero_paginas()
    @page = Lista.pg_n(params[:page])
    @posts = Lista.page_posts(@page)
    render :index
  end
end
