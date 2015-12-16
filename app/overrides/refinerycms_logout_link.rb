Deface::Override.new(
  virtual_path: 'refinery/_site_bar',
  name: 'refinerycms_logout_link',
  original: 'bec20f7641ef24054a38147aeb37f08d31bdd79f',
  insert_bottom: '#site_bar_branding',
  text: "<%= link_to Spree.t(:logout), spree.logout_path, :id => 'logout' if spree.logout_path.present? %>"
)