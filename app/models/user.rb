class User < ActiveRecord::Base
	# attr_accessible :image
	has_attached_file :image, :styles => { :small => "250x250>", :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	# validates :first_name, presence: true
	# validates :last_name, presence: true
	# validates :birthday, presence: true
	# validates :latitude, presence: true
	# validates :longitude, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #tell rails which foreign key to use
  has_many :conversations, :foreign_key => :sender_id
end
