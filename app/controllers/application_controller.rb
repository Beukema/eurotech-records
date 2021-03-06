class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :setup_search
  
  def setup_search
    @q = RepairOrder.ransack(params[:q])
  end
end
