Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_configuration',
  name: 'add_banks_to_admin_configuration_sidebar',
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu']",
  text: %q{
    <%= configurations_sidebar_menu_item(Spree.t(:banks), admin_banks_path) %>
    }
)
