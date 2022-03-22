json.array! @posts do |post|
   json.extract! post, :id, :titulo, :likes, :foto_file_name, :created_at
end
