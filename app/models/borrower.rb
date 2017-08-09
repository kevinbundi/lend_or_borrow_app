class Borrower < ActiveRecord::Base
  	has_secure_password

  	has_many :histories
  	has_many :lenders, through: :histories

  	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  	validates :first_name, :last_name, :purpose, presence: true, length: {minimum: 1}
  	validates :description, presence: true, length: {maximum: 140}
 	validates :password, length: { minimum: 4 }, on: :create
 	validates_numericality_of :money, :greater_than => 25 
 	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
 	before_save do
   		self.email.downcase!
	end

	def full_name
	    self.first_name + " " + self.last_name  
	end

	# def total_amount_raised
	#   	self.raised + self.lent
	# end


end
