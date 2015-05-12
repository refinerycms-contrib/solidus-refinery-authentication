require "spree_refinery_authentication/authorisation_manager"

module SpreeAuthenticationActionControllerBaseDecoration
  def self.prepended(base)
    base.prepend_before_action :detect_spreefinery_single_sign_on!
  end

  protected
  def refinery_users_exist?
    raise not_yet_implemented
  end

  private
  def refinery_authorisation_manager
    @refinery_authorisation_manager ||= SpreeRefineryAuthentication::AuthorisationManager.new
  end

  def detect_spreefinery_single_sign_on!
    if current_spree_user
      refinery_authorisation_manager.set_user!(current_spree_user)
    end
  end
end

ActionController::Base.send :prepend, SpreeAuthenticationActionControllerBaseDecoration