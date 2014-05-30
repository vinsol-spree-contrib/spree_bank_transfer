Deface::Override.new(
  :virtual_path => 'spree/checkout/_payment',
  :name => 'add_bank_transfer_instructions_link_to_payment',
  :insert_after => "#payment-method-fields",
  :text => %q{
    <p><%= link_to "How Bank Transfer works?", bank_transfer_instructions_path, :id => 'banktransfer_instructions', :target => "_blank" %></p>
  }
)

