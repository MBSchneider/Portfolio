class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # rescue_from ActiveRecord::RecordNotFound, with: :page_not_found
  private

  # def raise_not_found
  #   raise ActionController::RoutingError.new
  # end

  # def page_not_found
  #   flash[:error] = "This page was not found."
  #   redirect_to request.headers["Referer"] || root_path
  # end

  # def user_not_authorized
  #   flash[:error] = "You are not authorized to perform this action."
  #   redirect_to request.headers["Referer"] || root_path
  # end
end
