ApplicationController.class_eval do

  def refinery_user?
    current_spree_user && current_spree_user.admin?
  end

end
