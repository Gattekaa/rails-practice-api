json.extract! book, :id, :created_at, :updated_at, :rating, :comment, :bookcase_id, :user_id
json.url book_url(book, format: :json)
