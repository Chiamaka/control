class Admin < ActiveRecord::Base
	has_secure_password
	
	validates :username, presence: true
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :security_question, presence: true
	validates :security_answer, presence: true
	validates :phone, presence: true
	validates :level, presence: true
end
