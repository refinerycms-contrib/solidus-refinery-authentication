Spree::Admin::UserSessionsController.class_eval do
  skip_before_action :detect_spreefinery_single_sign_on!
end
