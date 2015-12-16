Deface::Override.new(
  virtual_path: 'spree/admin/shared/_menu',
  name: 'refinerycms_admin_link',
  original: '8d05a6b687057aa2a8c08b3feb480d58a14fe4aa',
  insert_top: "[data-hook='admin_tabs']",
  partial: 'spree/admin/shared/refinerycms_sidebar_menu'
)