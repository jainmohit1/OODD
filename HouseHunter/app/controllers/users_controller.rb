class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    if User.find(session[:id]).role_type == "admin"
      @users = User.all

    else
      @users = User.where("id = ?", session[:id])
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
  end
  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|

      if @user.save
        format.html {redirect_to @user, notice: 'User was successfully created.'}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end

      end

  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if  @user.update(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    
    respond_to do |format|
      if @user.role_type == "admin"
        format.html {redirect_to users_url, notice: 'Admin account cannot be deleted'}
        format.json {head :no_content}
      else
        @user.destroy
        format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
        format.json {head :no_content}
      end
    end
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:user_name, :password, :email_address, :first_name, :last_name, :middle_name, :phone_number, :preferred_contact_method, :role_type)
  end
end
