class BorrowersController < ApplicationController
  def show
  	@borrower = Borrower.find(session[:borrower_id])

  	@my_lenders = @borrower.histories
  end
end
