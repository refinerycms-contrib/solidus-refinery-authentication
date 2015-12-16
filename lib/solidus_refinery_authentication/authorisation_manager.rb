require "refinery/core/authorisation_manager"
require "solidus_refinery_authentication/authorisation_adapter"

module SolidusRefineryAuthentication
  class AuthorisationManager < Refinery::Core::AuthorisationManager

    # The Solidus user needs to be an admin to access Refinery's backend.
    def authenticate!
      unless adapter.current_user.admin?
        raise Zilch::Authorisation::NotAuthorisedException
      end

      adapter.current_user
    end

    # Override the default adapter specified in the superclass.
    def default_adapter
      @default_adapter ||= SolidusRefineryAuthentication::AuthorisationAdapter.new
    end

    # This allows a user to be supplied, bypassing the usual detection.
    def set_user!(user)
      adapter.current_user = user
    end
  end
end
