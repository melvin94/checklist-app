# frozen_string_literal: true

class OverriddenDevise::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @alert_message = ""
    if params[:user][:email].include? "saskia"
      @alert_message = "Saskia, please..."
      destroy
    elsif current_user && current_user.role.admin
      super
    else
      if current_user && current_user.role.admin == false
        @alert_message = "You do not have access to the platform #{current_user.first_name} #{current_user.last_name}."
      else
        if params[:user][:email].blank? == false
          @alert_message = "Incorrect password or the user '#{params[:user][:email]}' does not exist."
        else
          @alert_message = "An email address is required to log into the platform."
        end
      end
      destroy
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
    flash.alert = @alert_message
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
