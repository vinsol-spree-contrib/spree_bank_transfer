Deface::Override.new(
  :virtual_path => 'spree/orders/show',
  :name => 'add_bank_details_form_to_order_show',
  :insert_before => "[data-hook='links']",
  :text => %q{
    <% if bank_transfer_payment = @order.payments.from_bank_transfer.first %>
      <%= form_for bank_transfer_payment, :html => { :class => "bt_payment_form" } do |f| %>
        <table>
          <tr>
            <td><%= Spree.t(:bank_name) %></td><td><%= f.text_field :bank_name %></td>
          </tr>
          <tr>
            <td><%= Spree.t(:account_no) %></td><td><%= f.text_field :account_no %></td>
          </tr>
          <tr>
            <td><%= Spree.t(:transaction_reference_no) %></td><td><%= f.text_field :transaction_reference_no %></td>
          </tr>
        </table>
        <br>
        <%= f.submit "Submit" %>
      <% end %>  
    <% end %>  
  }
)