class Conversation < ActiveRecord::Base
  
  #conversation belongs to sender
  belongs_to :sender, :foreign_key => :sender_id

  #conversation also belongs to recipient
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  #conversation has many messages. if the conversation is destroyed, all the messages along with it are also destroyed
  has_many :messages, dependent: :destroy

  #sender_id and recipient_id must be unique. 
  validates_uniqueness_of :sender_id, :scope => :recipient_id

  #retrieve conversations for the logged-in user
  scope :involving, -> (user) do
    where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
  end

  #check if a conversation exists before creating a new one
  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
