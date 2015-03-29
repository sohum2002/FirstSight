class ConversationsController < ApplicationController
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def reply
    #mailbox method reply_to_conversation helps a lot. it will take a conversation to reply to
    #and message body
    current_user.reply_to_conversation(@conversation, params[:body])
    # {body: {content: "" }}
    # {body: {content: "", user_id: 3 }}
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

#have to permit