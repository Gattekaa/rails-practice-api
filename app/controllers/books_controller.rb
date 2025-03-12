class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index
    @books = current_user.books

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = current_user.books.new(book_params)
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = current_user.books.find_by(id: params[:id])

      if @book.nil?
        render json: { error: "Couldn't find a book with id: #{params[:id]}" }, status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.expect(book: [ :title, :rating, :comment, :bookcase_id ])
    end
end
