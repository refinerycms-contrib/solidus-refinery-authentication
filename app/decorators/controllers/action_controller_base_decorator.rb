require "spree_refinery_authentication/authorisation_manager"

ActionController::Base.class_eval do
  prepend_before_action :detect_spreefinery_single_sign_on!

  private
  # This relies on a method added to lib/spree_refinery_authentication/authorisation_adapter
  def detect_spreefinery_single_sign_on!
    if current_spree_user
      refinery_authorisation_manager.set_user!(current_spree_user)
    end
  end

  def refinery_authorisation_manager
    @refinery_authorisation_manager ||= SpreeRefineryAuthentication::AuthorisationManager.new
  end
end
