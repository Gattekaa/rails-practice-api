json.extract! bookcase, :id, :created_at, :updated_at
json.books bookcase.books do |book|
  json.partial! "books/book", book: book
end
json.url bookcase_url(bookcase, format: :json)
