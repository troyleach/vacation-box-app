class ApplicationController < ActionController::Base
  #require 'ostruct'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  @vacation  = Vacation.new
  

  # helper_method :current_profile

  # def current_profile
  #   @current_profile ||= Profile.find_by(:user_id => current_user.id)
  #   if @current_profile
  #     @current_profile
  #   else
  #     OpenStruct.new(first_name: 'Guest')
  #   end
  # end


    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
    end
end
