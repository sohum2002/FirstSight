class Message < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :conversation
  belongs_to :user

  #make sure these exist before creating a message
  validates_presence_of :body, :conversation_id, :user_id
end
