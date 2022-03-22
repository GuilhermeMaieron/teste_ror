json.data do
  json.post do
    json.call(
      @post,
      :titulo,
      :id,
      :user_ids,
      :likes,
      :foto
    )
  end
end
