class BeersController < ApplicationController
  before_action :set_beer, only: [:update, :edit, :destroy, :like, :unlike, :liked?]
  before_action :set_beer_show, only: [:show]
  before_action :must_be_admin, only: [:edit, :new]

  # GET /beers
  # GET /beers.json
  def index
    @beers = Beer.all.order("is_vegan DESC, is_vegetarian DESC, RANDOM()").page params[:page]
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
    @similar_beers = Beer.where(style: @beer.style, is_vegan: true).where.not(id: @beer.id).order("RANDOM()").limit(4)
  end

  # GET /beers/new
  def new
    @beer = Beer.new
  end

  # GET /beers/1/edit
  def edit
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(beer_params)

    respond_to do |format|
      if @beer.save
        format.html { redirect_to main_beer_path(@beer.brewery.slug, @beer.slug), notice: 'Beer was successfully created.' }
        format.json { render :show, status: :created, location: @beer }
      else
        format.html { render :new }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
  def update
    respond_to do |format|
      if @beer.update(beer_params)
        if params[:commit] === "Update Details"
          format.html { redirect_to brewery_admin_path(session[:brewery], session[:token]), notice: 'Beer was successfully updated.' }
        end
        format.html { redirect_to main_beer_path(@beer.brewery.slug, @beer.slug), notice: 'Beer was successfully updated.' }
        format.json { render :show, status: :ok, location: @beer }
      else
        format.html { render :edit }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to beers_url, notice: 'Beer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    current_user.likes.build(beer_id: @beer.id).save
    redirect_to main_beer_path(@beer.brewery.slug, @beer.slug)
  end

  def unlike
    @like = current_user.likes.where(user_id: current_user.id, beer_id: @beer.id)
    current_user.likes.delete(@like)
    redirect_to main_beer_path(@beer.brewery.slug, @beer.slug)
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_beer
      @beer = Beer.find_by(id: params[:id])
    end

    def set_beer_show
      @brewery = Brewery.find_by(slug: params[:brewery])
      @beer = Beer.find_by(slug: params[:id], brewery_id: @brewery.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:name, :style, :abv, :description, :beer_image, :is_vegan, :is_vegetarian, :filtered, :bootle_conditioned, :can_conditioned, :organic, :gluten_free, :alcohol_free, :serving_temp, :brewery_id, :brewery_confirmed, :brewery_confirmed_at)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to new_user_session_path
      end
    end
end
