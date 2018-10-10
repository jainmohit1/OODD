class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  
  # def initialize
  #   @editable = true
  # end
  # GET /houses
  # GET /houses.json
  
  def index
    if params[:location || :style || :start_price || :end_price]
      @start_price = params[:start_price]
      @end_price = params[:end_price]
      if @start_price == ''
        @start_price = 0
      end
      if @end_price == ''
        @end_price = 999999999999999999
      end
      # Filtering
      # TODO check if user has not provide values for range dont include that in the query
      @houses = House.where('location LIKE ? and style LIKE ? and price_list BETWEEN ? AND ?',
                            "%#{params[:location]}%", "%#{params[:style]}%", @start_price, @end_price)
    else
      @houses = House.all
    end
  end
  
  # GET /houses/1
  # GET /houses/1.json
  def show
  end
  
  # GET /houses/new
  def new
    @house = House.new
  end
  
  # GET /houses/1/edit
  def edit
  
  end
  
  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    @house.user_id = session[:id]

    respond_to do |format|
      if @house.save
        format.html {redirect_to @house, notice: 'House was successfully created.'}
        format.json {render :show, status: :created, location: @house}
      else
        format.html {render :new}
        format.json {render json: @house.errors, status: :unprocessable_entity}
      end
    end
  end
  
  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html {redirect_to @house, notice: 'House was successfully updated.'}
        format.json {render :show, status: :ok, location: @house}
      else
        format.html {render :edit}
        format.json {render json: @house.errors, status: :unprocessable_entity}
      end
    end
  end
  
  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    if @house.user_id == session[:id] || User.find(session[:id]).role_type == "admin"
      @house.destroy
      respond_to do |format|
        format.html {redirect_to houses_url, notice: 'House was successfully destroyed.'}
        format.json {head :no_content}
      end
    else
      respond_to do |format|
        format.html {redirect_to houses_url, notice: 'Permission denied to remove the house.'}
        format.json {head :no_content}
      end
    
    end
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_house
    @house = House.find(params[:id])
  
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def house_params
    params.require(:house).permit(:company_id, :location, :square_footage, :year_built, :style, :price_list, :number_of_floors, :basement, :current_owner, :contact_info_realtor, :user_id, :image)
  end
end
