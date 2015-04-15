module Refinery
  module AuthenticationHelper

    def refinery_user?
      if current_spree_user && current_spree_user.admin?
        true
      end
    end

  end
end