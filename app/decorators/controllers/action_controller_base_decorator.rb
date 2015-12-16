require "solidus_refinery_authentication/authorisation_manager"

module SolidusAuthenticationActionControllerBaseDecoration
  def self.prepended(base)
    base.prepend_before_action :detect_solidusfinery_single_sign_on!
  end

  protected
  def refinery_users_exist?
    raise not_yet_implemented
  end

  private
  def refinery_authorisation_manager
    @refinery_authorisation_manager ||= SolidusRefineryAuthentication::AuthorisationManager.new
  end

  def detect_solidusfinery_single_sign_on!
    if current_spree_user
      refinery_authorisation_manager.set_user!(current_spree_user)
    end
  end
end

ActionController::Base.send :prepend, SolidusAuthenticationActionControllerBaseDecoration