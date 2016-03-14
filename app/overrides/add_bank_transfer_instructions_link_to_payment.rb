Deface::Override.new(
  virtual_path: 'spree/checkout/_payment',
  name: 'add_bank_transfer_instructions_link_to_payment',
  insert_after: "#payment-method-fields",
  text: %q{
    <% if @order.available_payment_methods.any? { |pm| pm.type == 'Spree::PaymentMethod::BankTransfer' } %>
      <p><%= link_to t(:how_bank_transfer_works), bank_transfer_instructions_path, id: 'banktransfer_instructions', target: "_blank" %></p>
    <% end %>
  }
)
