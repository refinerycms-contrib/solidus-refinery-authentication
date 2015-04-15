module Refinery
  module AuthenticationHelper

    def refinery_user?
      current_spree_user ? current_spree_user.admin? : false
    end

  end
end