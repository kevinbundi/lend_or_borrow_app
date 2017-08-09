class SessionsController < ApplicationController
  def new
  end

  def create
  	lender = Lender.find_by_email(params[:email])
    borrower = Borrower.find_by_email(params[:email])

    if lender && lender.authenticate(params[:password])
    	session[:lender_id] = lender.id
    	session[:lender_name] = lender.first_name
    	flash[:message] = "lender successfully logged in"
    	redirect_to "/online_lending/lender/#{lender.id}"
    elsif borrower && borrower.authenticate(params[:password])
    	session[:borrower_id] = borrower.id
    	session[:borrower_name] = borrower.first_name
    	flash[:message] = "borrower successfully logged in"
    	redirect_to "/online_lending/borrower/#{borrower.id}"
    else
    	flash[:error] = "Invalid!"
    	redirect_to "/online_lending/login"
    end
  end

   	def destroy_lender
	  	session[:lender_id] = nil
	  	session[:lender_name] = nil
	    flash[:message]  ="You have been logged out - lender"
	    redirect_to "/online_lending/login"
	end

  	def destroy_borrower
		session[:borrower_id] = nil
	 	session[:borrower_name] = nil
	 	flash[:message]  ="You have been logged out - borrower"
	    redirect_to "/online_lending/login"
  	end
end

