Refinery::AdminController.class_eval do

  protected
  # this is an override of an existing method in Refinery::AdminController
  def authenticate_refinery_user!
    begin
      super
    rescue Zilch::Authorisation::NotAuthorisedException
      redirect_to spree.admin_login_path and return
    end
  end

  # defined in app/decorators/controllers/action_controller_base_decorator.rb
  def authorisation_manager
    refinery_authorisation_manager
  end

end
