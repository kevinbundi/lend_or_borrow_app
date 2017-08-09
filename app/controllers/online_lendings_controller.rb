class OnlineLendingsController < ApplicationController
  def new
    
  end

  def create_lender
  	lender = Lender.new(lender_params)
  	if lender.save
  		flash[:message] = "lender registration successful"
  		redirect_to "/online_lending/login"
  	else
  		flash[:lender_errors] = lender.errors.full_messages
  		redirect_to "/online_lending/register"
  	end
  end

  def create_borrower
  	borrower = Borrower.new(borrower_params)
  	if borrower.save
  		flash[:message] = "borrower registration successful"
  		redirect_to "/online_lending/login"
  	else
  		flash[:borrower_errors] = borrower.errors.full_messages
  		redirect_to "/online_lending/register"
  	end
  end

  private
  def lender_params
  	params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
  end

  def borrower_params
  	params.require(:borrower).permit(:first_name, :last_name, :email, :password, :purpose, :description, :money)
  end
end
