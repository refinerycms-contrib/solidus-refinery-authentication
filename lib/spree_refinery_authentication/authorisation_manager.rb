require "refinery/core/authorisation_manager"
require "spree_refinery_authentication/authorisation_adapter"

module SpreeRefineryAuthentication
  class AuthorisationManager < Refinery::Core::AuthorisationManager

    def authenticate!
      raise Zilch::Authorisation::NotAuthorisedException unless adapter.current_user.admin?

      adapter.current_user
    end

    def default_adapter
      @default_adapter ||= SpreeRefineryAuthentication::AuthorisationAdapter.new
    end

  end
end
