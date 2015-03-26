  class MessagesController < ApplicationController
    #before_action :authenticate_user!
 
  def new
  end
 
  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Your message has been sent!"
    #pass the recipients, body of message and subject of message
    redirect_to conversation_path(conversation)
  end
end