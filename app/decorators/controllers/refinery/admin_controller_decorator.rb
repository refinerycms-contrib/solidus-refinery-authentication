require "spree_refinery_authentication/authorisation_manager"

Refinery::AdminController.class_eval do

  protected
  def authenticate_refinery_user!
    begin
      super
    rescue Zilch::Authorisation::NotAuthorisedException
      redirect_to spree.admin_login_path and return
    end
  end

  private
  def authorisation_manager
    @authorisation_manager ||= SpreeRefineryAuthentication::AuthorisationManager.new
  end

end
