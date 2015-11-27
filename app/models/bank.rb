class Bank < ActiveRecord::Base
	has_many :accounts
	has_many :customers, class_name: 'Citizen', through: :accounts

	validates :name, presence: true, uniqueness: true
	#validates :bank_type, presence: true
	validates :reg_no, presence: true, uniqueness: true
	validates :founded, presence: true
	validates :headquarters, presence: true
	validates :ceo, presence: true
	validates :services, presence: true
	validates :email, presence: true
	validates :website, presence: true
	

end
