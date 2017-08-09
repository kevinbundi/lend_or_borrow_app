class Lender < ActiveRecord::Base
  	has_secure_password

	has_many :histories
	has_many :borrowers, through: :histories

  	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	
  	validates :first_name, :last_name, presence: true, length: {minimum: 1}
 	validates :password, length: { minimum: 4 }, on: :create
 	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	before_save do
   		self.email.downcase!
	end
	# validates :money, presence: true, :numericality =>{:greater_than => 0}
	validates_numericality_of :money, :greater_than => 25
	# validates_presence_of :money, :message => "^Amount must be more than 0"

	# validate :amount
	# private
	# def amount
	# 	errors.add(:_, "amount must be more than 0")
	# end


  def full_name
    self.first_name + " " + self.last_name
  end
end

