class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      admin_profile_path
    else
      profile_path
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  protected

  def configure_permitted_parameters
    update_attrs = [:first_name, :last_name, :profession, :signature, :avatar, :email, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :sign_up, keys: update_attrs
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    devise_parameter_sanitizer.permit :accept_invitation, keys: update_attrs
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
