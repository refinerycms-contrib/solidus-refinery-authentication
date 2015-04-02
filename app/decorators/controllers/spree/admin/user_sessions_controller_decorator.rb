Spree::Admin::UserSessionsController.class_eval do
  skip_before_action :detect_spreefinery_single_sign_on!

  private
  # This overrides what Spree defines, so that we can get back to Refinery.
  def after_sign_in_path_for(resource)
    session["spree_user_return_to"] || super
  end
end