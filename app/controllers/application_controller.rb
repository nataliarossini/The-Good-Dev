class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_unread_messages
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :user_type, :description, :address, :github, :linkedin, :photo])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :user_type, :description, :address, :github, :linkedin, :photo])
  end

  def set_unread_messages
    if user_signed_in?
      @unread_messages = current_user.all_messages.select{|m| !m.read && m.user != current_user}.length
      @chatrooms = current_user.all_chatrooms
    else
      @unread_messages = 0
    end
  end

  # app/controllers/application_controller.rb

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end

end
