Deface::Override.new(
  virtual_path: 'refinery/admin/_menu',
  name: 'spree_admin_link',
  original: '71468c0788f57fd03c9c6c2ebe3c6c026be5aeb5',
  insert_top: '#menu',
  text: "<%= link_to 'Spree', spree.admin_path %>"
)