class HouseInterestListsController < ApplicationController
  before_action :set_house_interest_list, only: [:show, :edit, :update, :destroy]
  
  # GET /house_interest_lists
  # GET /house_interest_lists.json
  def index
    
    if User.find(session[:id]).role_type == "admin"
      @house_interest_lists = HouseInterestList.all
    elsif User.find(session[:id]).role_type == "buyer"
      @house_interest_lists = HouseInterestList.where("user_id = ?", session[:id])
    else
      # TODO Filter all houses which are added by realtor and his companies houses
      @house_interest_lists = HouseInterestList.where("house_id in ?", House.where("user_id", session[:id]))
      @house_interest_lists = HouseInterestList.where("user_id = ?", session[:id])
    end
  end
  
  # GET /house_interest_lists/1
  # GET /house_interest_lists/1.json
  def show
  end
  
  # GET /house_interest_lists/new
  def new
    @house_interest_list = HouseInterestList.new
  end
  
  # GET /house_interest_lists/1/edit
  def edit
  end
  
  # POST /house_interest_lists
  # POST /house_interest_lists.json
  def create
    @house_interest_list = HouseInterestList.new(house_interest_list_params)
    @house_interest_list.user_id = session[:id]
    @house_interest_list.company_id = House.find(@house_interest_list.house_id).company_id
    
    respond_to do |format|
      if @house_interest_list.save
        format.html {redirect_to @house_interest_list, notice: 'House interest list was successfully created.'}
        format.json {render :show, status: :created, location: @house_interest_list}
      else
        format.html {render :new}
        format.json {render json: @house_interest_list.errors, status: :unprocessable_entity}
      end
    end
  end
  
  # PATCH/PUT /house_interest_lists/1
  # PATCH/PUT /house_interest_lists/1.json
  def update
    respond_to do |format|
      if @house_interest_list.update(house_interest_list_params)
        format.html {redirect_to @house_interest_list, notice: 'House interest list was successfully updated.'}
        format.json {render :show, status: :ok, location: @house_interest_list}
      else
        format.html {render :edit}
        format.json {render json: @house_interest_list.errors, status: :unprocessable_entity}
      end
    end
  end
  
  # DELETE /house_interest_lists/1
  # DELETE /house_interest_lists/1.json
  def destroy
    @house_interest_list.destroy
    respond_to do |format|
      format.html {redirect_to house_interest_lists_url, notice: 'House interest list was successfully destroyed.'}
      format.json {head :no_content}
    end
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_house_interest_list
    @house_interest_list = HouseInterestList.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def house_interest_list_params
    params.require(:house_interest_list).permit(:user_id, :house_id, :company_id)
  end
end
