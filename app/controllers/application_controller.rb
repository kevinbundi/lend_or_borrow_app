class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_lender
  	Lender.find(session[:lender_id]) if session[:lender_id]
  end
  helper_method :current_lender

  def current_borrower
  	Borrower.find(session[:borrower_id]) if session[:borrower_id]
  end
  helper_method :current_borrower

  # def full_name
  #   self.first_name + " " + self.last_name
  # end
  # helper_method :full_name
end
