class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  # before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
    #@conversations = Conversation.all
  end

  def show
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
  
  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

end


  # # GET /conversations/1
  # # GET /conversations/1.json
  # def show
  # end

  # # GET /conversations/new
  # def new
  #   @conversation = Conversation.new
  # end

  # # GET /conversations/1/edit
  # def edit
  # end

  # # POST /conversations
  # # POST /conversations.json
  # def create
  #   @conversation = Conversation.new(conversation_params)

  #   respond_to do |format|
  #     if @conversation.save
  #       format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
  #       format.json { render :show, status: :created, location: @conversation }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @conversation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /conversations/1
  # # PATCH/PUT /conversations/1.json
  # def update
  #   respond_to do |format|
  #     if @conversation.update(conversation_params)
  #       format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @conversation }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @conversation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /conversations/1
  # # DELETE /conversations/1.json
  # def destroy
  #   @conversation.destroy
  #   respond_to do |format|
  #     format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_conversation
  #     @conversation = Conversation.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def conversation_params
  #     params.require(:conversation).permit(:sender_id, :recipient_id)
  #   end
