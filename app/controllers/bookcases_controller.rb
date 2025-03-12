class BookcasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookcase, only: %i[ show update destroy ]

  # GET /bookcases
  def index
    puts current_user.to_json
    @bookcases = current_user.bookcases

    render json: @bookcases
  end

  # GET /bookcases/1
  def show
    render json: @bookcase
  end

  # POST /bookcases
  def create
    @bookcase = current_user.bookcases.new(bookcase_params)

    if @bookcase.save
      render json: @bookcase, status: :created, location: @bookcase
    else
      render json: @bookcase.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookcases/1
  def update
    if @bookcase.update(bookcase_params)
      render json: @bookcase
    else
      render json: @bookcase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookcases/1
  def destroy
    @bookcase.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookcase
      @bookcase = current_user.bookcases.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def bookcase_params
      params.expect(bookcase: [ :limit ])
    end
end
