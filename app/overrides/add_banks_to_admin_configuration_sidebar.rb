Deface::Override.new(
  :virtual_path => 'spree/admin/shared/_configuration_menu',
  :name => 'add_banks_to_admin_configuration_sidebar',
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => %q{
    <%= configurations_sidebar_menu_item Spree.t(:banks), admin_banks_path %>
    }
)