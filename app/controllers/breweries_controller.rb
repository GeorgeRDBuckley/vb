class BreweriesController < ApplicationController
  before_action :set_brewery, only: [:show]
  before_action :set_brewery_id, only: [:edit, :update, :destroy]
  before_action :must_be_admin, only: [:edit, :new]

  # GET /breweries
  # GET /breweries.json
  def index
    @breweries = Brewery.all
  end

  # GET /breweries/1
  # GET /breweries/1.json
  def show
  end

  # GET /breweries/new
  def new
    @brewery = Brewery.new
  end

  # GET /breweries/1/edit
  def edit
  end

  # POST /breweries
  # POST /breweries.json
  def create
    @brewery = Brewery.new(brewery_params)

    respond_to do |format|
      if @brewery.save
        format.html { redirect_to main_brewery_path(@brewery.slug), notice: 'Brewery was successfully created.' }
        format.json { render :show, status: :created, location: @brewery }
      else
        format.html { render :new }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breweries/1
  # PATCH/PUT /breweries/1.json
  def update
    respond_to do |format|
      if @brewery.update(brewery_params)
        format.html { redirect_to main_brewery_path(@brewery.slug), notice: 'Brewery was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /breweries/1
  # DELETE /breweries/1.json
  def destroy
    @brewery.destroy
    respond_to do |format|
      format.html { redirect_to breweries_url, notice: 'Brewery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brewery
      @brewery = Brewery.find_by(slug: params[:id])
    end

    def set_brewery_id
      @brewery = Brewery.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewery_params
      params.require(:brewery).permit(:name, :address1, :address2, :city, :county, :postcode, :country, :email, :telephone, :website, :description, :brewery_logo, :slug, :latitude, :longitude, :twitter, :facebook, :instagram)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to new_user_session_path
      end
    end
end
