require "refinery/core/authorisation_adapter"

module SpreeRefineryAuthentication
  class AuthorisationAdapter < Refinery::Core::AuthorisationAdapter

    # If no user exists, we should use a blank Spree::User (non-admin).
    def current_user
      @current_user ||= Spree::User.new
    end

    # This method has been added, it does not exist in the superclass.
    def current_user=(set_to_this_user)
      @current_user = set_to_this_user
    end

  end
end
