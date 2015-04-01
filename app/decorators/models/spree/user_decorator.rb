Spree::User.class_eval do
  # The default NilUser has all roles and can access all plugins.
  # Should be overridden in authentication solutions.
  def has_role?(role)
    admin?
  end

  # Returns all registered plugins.
  # Should be overridden in authentication solutions.
  def plugins
    admin? ? Refinery::Plugins.registered : Refinery::Plugins.new
  end

  # Returns true.
  # Should be overridden in authentication solutions.
  # A real solution might be: `Refinery::Plugins.active.names.include?(name)`
  def has_plugin?(name)
    plugins.names.include?(name)
  end

  # Returns a URL to the first plugin with a URL in the menu. Used for
  # admin users' root admin url.
  # Should be overridden in authentication solutions.
  def landing_url
    plugins.first_url_in_menu
  end
end
