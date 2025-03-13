class BooksreportsController < ApplicationController
  before_action :set_booksreport, only: %i[ show update destroy ]

  # GET /booksreports
  # GET /booksreports.json
  def index
    @booksreports = Booksreport.all
  end

  # GET /booksreports/1
  # GET /booksreports/1.json
  def show
  end

  # POST /booksreports
  # POST /booksreports.json
  def create
    @booksreport = Booksreport.new(booksreport_params)

    if @booksreport.save
      render :show, status: :created, location: @booksreport
    else
      render json: @booksreport.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /booksreports/1
  # PATCH/PUT /booksreports/1.json
  def update
    if @booksreport.update(booksreport_params)
      render :show, status: :ok, location: @booksreport
    else
      render json: @booksreport.errors, status: :unprocessable_entity
    end
  end

  # DELETE /booksreports/1
  # DELETE /booksreports/1.json
  def destroy
    @booksreport.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booksreport
      @booksreport = Booksreport.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booksreport_params
      params.expect(booksreport: [ :data, :user_id ])
    end
end
