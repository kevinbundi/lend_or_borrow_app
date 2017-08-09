class LendersController < ApplicationController
  	def show
	  	@lender = Lender.find(session[:lender_id])
	  	@borrowers = Borrower.all
	  	@lendees = @lender.borrowers
	  	@history = History.all

	  	lendings = Lender.find(params[:id]).borrowers
	  	total_lent = 0.0
	  	lendings.each do |lending|
	  		total_lent += lending.lent
		@total_lender_money = @lender.money - total_lent 
	end
  	end

    def create
	    Borrower.find(params[:id]).update(lent: params[:lent])
	    
	    borrower_raised = Borrower.find(params[:id]).raised 
	    if borrower_raised == nil
	    	Borrower.find(params[:id]).update(raised: params[:lent])
	    else
	    	current_lent = Borrower.find(params[:id]).lent
	    	current_raised = Borrower.find(params[:id]).raised
	    	total_raised = current_raised + current_lent
	   		Borrower.find(params[:id]).update(raised: total_raised)
	    end


	    lender = Lender.find(session[:lender_id])
		borrower = Borrower.find(params[:id])
		lender_lending = History.create(lender: lender, borrower: borrower, amount: params[:lent])

		if lender_lending.save
		 	flash[:messsage] = "successfully lent"
		 	redirect_to "/online_lending/lender/#{session[:lender_id]}"
		else
		 	flash[:error] = lent.errors.full_messages
		 	redirect_to "/online_lending/lender/#{session[:lender_id]}"
		end
	end
end
