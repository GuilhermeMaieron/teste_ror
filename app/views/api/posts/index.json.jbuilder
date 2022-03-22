json.numero_paginas @total_pages

json.posts @posts do |post|
   json.extract! post, :id, :titulo, :likes, :foto_file_name, :created_at , :foto
end
