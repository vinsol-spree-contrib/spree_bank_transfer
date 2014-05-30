Deface::Override.new(
  :virtual_path => 'spree/shared/_order_details',
  :name => 'add_bank_details_form_to_order_show',
  :insert_bottom => ".payment-info",
  :text => %q{
    <% if bank_transfer_payment = @order.payments.from_bank_transfer.first %>
      <% unless bank_transfer_payment.details_submitted? %>
        <br>
        <%= link_to Spree.t(:add_details), "javascript:void(0);", :class => 'button add_bt_details' %>
      <% end %>
      <%= form_for bank_transfer_payment, :html => { :class => "bt_payment_form #{bank_transfer_payment.details_submitted? ? '' : 'hidden'}" } do |f| %>
        <table>
          <tr>
            <td><%= Spree.t(:deposited_on) %></td><td><%= f.date_field :deposited_on, :disabled => bank_transfer_payment.details_submitted? %></td>
          </tr>
          <tr>
            <td><%= Spree.t(:bank_name) %></td><td><%= f.text_field :bank_name, :disabled => bank_transfer_payment.details_submitted? %></td>
          </tr>
          <tr>
            <td><%= Spree.t(:account_no) %></td><td><%= f.text_field :account_no, :disabled => bank_transfer_payment.details_submitted? %></td>
          </tr>
          <tr>
            <td><%= Spree.t(:transaction_reference_no) %></td><td><%= f.text_field :transaction_reference_no, :disabled => bank_transfer_payment.details_submitted? %></td>
          </tr>
        </table>
        <br>
        <% unless bank_transfer_payment.details_submitted? %>
          <%= f.submit "Submit", :confirm => "Are you sure you want to Submit these details? You will not be able to Edit these details once Submitted. Press 'OK' to confirm."  %>
        <% end %>
      <% end %>  
    <% end %>  
  }
)