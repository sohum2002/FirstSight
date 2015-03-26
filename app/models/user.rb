# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :text
#  last_name              :text
#  about                  :text
#  birthday               :date
#  latitude               :integer
#  longitude              :integer
#  occupation             :text
#  field                  :text
#  orientation            :text
#  interest               :text
#  physical               :text
#  free_time              :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#  gender                 :string
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_attached_file :image, :styles => { :small => "250x250>", :medium => "400x400>", :thumb => "50x50>" }, :default_url => "/images/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true
	validates :email, presence: true

	acts_as_messageable
	
  has_many :conversations, :foreign_key => :sender_id

  def mailboxer_email(object)
	  email
	end
	
end
