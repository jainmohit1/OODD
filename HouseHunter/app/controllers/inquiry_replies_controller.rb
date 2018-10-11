class InquiryRepliesController < ApplicationController
  before_action :set_inquiry_reply, only: [:show, :edit, :update, :destroy]
  
  # GET /inquiry_replies
  # GET /inquiry_replies.json
  def index
    if User.find(session[:id]).role_type == "admin"
      @inquiry_replies = InquiryReply.all
    elsif User.find(session[:id]).role_type == "buyer"
      @inquiry_replies = InquiryReply.where("user_id = ?", session[:id])
    else
      @inquiry_replies = InquiryReply.where("company_id = ?", UserCompanyMapping.find_by("user_id = ?", session[:id]))
    end
  end
  
  # GET /inquiry_replies/1
  # GET /inquiry_replies/1.json
  def show
  
  end
  
  # GET /inquiry_replies/new
  def new
    @inquiry_reply = InquiryReply.new
    @inquiry = Inquiry.find(params[:inquiry])
    flash[:user_id] = @inquiry.user_id
    flash[:house_id] = @inquiry.house_id
    flash[:company_id] = @inquiry.company_id
    flash[:inquiry_id] = @inquiry.id
  end
  
  # GET /inquiry_replies/1/edit
  def edit
  end
  
  # POST /inquiry_replies
  # POST /inquiry_replies.json
  def create
    @inquiry_reply = InquiryReply.new(inquiry_reply_params)
    @inquiry_reply.user_id = flash[:user_id]
    @inquiry_reply.house_id = flash[:house_id]
    @inquiry_reply.inquiry_id = flash[:inquiry_id]
    @inquiry_reply.company_id = flash[:company_id]
    respond_to do |format|
      if @inquiry_reply.save
        UserMailer.with(user: User.find(@inquiry_reply.user_id), inquiry_reply: @inquiry_reply,
                        inquiry: Inquiry.find(@inquiry_reply.inquiry_id), house: House.find(@inquiry_reply.house_id)).inquiry_reply_email.deliver_now
        format.html {redirect_to @inquiry_reply, notice: 'Inquiry reply was successfully created. We have notified the user via email'}
        format.json {render :show, status: :created, location: @inquiry_reply}
      else
        format.html {render :new}
        format.json {render json: @inquiry_reply.errors, status: :unprocessable_entity}
      end
    end
  end
  
  # PATCH/PUT /inquiry_replies/1
  # PATCH/PUT /inquiry_replies/1.json
  def update
    respond_to do |format|
      if @inquiry_reply.update(inquiry_reply_params)
        UserMailer.with(user: User.find(@inquiry_reply.user_id), inquiry_reply: @inquiry_reply,
                        inquiry: Inquiry.find(@inquiry_reply.inquiry_id), house: House.find(@inquiry_reply.house_id)).inquiry_reply_email.deliver_now
        format.html {redirect_to @inquiry_reply, notice: 'Inquiry reply was successfully updated. We have notified the user via email'}
        format.json {render :show, status: :ok, location: @inquiry_reply}
      else
        format.html {render :edit}
        format.json {render json: @inquiry_reply.errors, status: :unprocessable_entity}
      end
    end
  end
  
  # DELETE /inquiry_replies/1
  # DELETE /inquiry_replies/1.json
  def destroy
    @inquiry_reply.destroy
    respond_to do |format|
      format.html {redirect_to inquiry_replies_url, notice: 'Inquiry reply was successfully destroyed.'}
      format.json {head :no_content}
    end
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_inquiry_reply
    @inquiry_reply = InquiryReply.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def inquiry_reply_params
    params.require(:inquiry_reply).permit(:user_id, :house_id, :inquiry_id, :message, :company_id)
  end
end
