module Refinery
  module Core
    class AuthorisationAdapter < Zilch::Authorisation::Adapters::Default

      def current_user
        @current_user ||= Spree::User.new
      end

    end
  end
end