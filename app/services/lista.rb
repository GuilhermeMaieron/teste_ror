class Lista
  @per_page = 4

  def initialize
  end

  def self.numero_paginas()
    @count = Post.count()
    if @count % @per_page == 0
      @total_pages = @count/@per_page
    else
      @total_pages = @count/@per_page+1
    end
  end

  def self.pg_n(pg_number)
    page = pg_number ? pg_number.to_i : 1
    page = 1 if page - 1 <= 0
    return page
  end

  def self.page_posts(page)
    Post.order(created_at: :desc).limit(@per_page).offset((page - 1) * @per_page).includes(:users, :post_users)
  end
end
