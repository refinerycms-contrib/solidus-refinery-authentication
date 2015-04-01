require "refinery/core/authorisation_adapter"

module SpreeRefineryAuthentication
  class AuthorisationAdapter < Refinery::Core::AuthorisationAdapter

    def current_user
      @current_user ||= Spree::User.new
    end

  end
end
