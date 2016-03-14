Deface::Override.new(
  virtual_path: 'spree/admin/payments/_list',
  name: 'add_payment_reference_details',
  insert_after: "#payments",
  text: %q{
    <% if bank_transfer_payment = @order.payments.from_bank_transfer.first %>
      <fieldset class="no-border-bottom" >
        <legend align="center"><%= Spree.t(:payment_reference_details) %></legend>
        <table class="index">
          <thead>
            <tr data-hook="payments_header">
              <th><%= Spree.t(:deposited_on) %></th>
              <th><%= Spree.t(:bank_name) %></th>
              <th><%= Spree.t(:account_no) %></th>
              <th><%= Spree.t(:transaction_reference_no) %></th>
              <th class="actions"></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class='align-center'><%= bank_transfer_payment.deposited_on %></td>
              <td class='align-center'><%= bank_transfer_payment.bank_name %></td>
              <td class='align-center'><%= bank_transfer_payment.account_no %></td>
              <td class='align-center'><%= bank_transfer_payment.transaction_reference_no %></td>
            </tr>
          </tbody>
        </table>
      </fieldset>
    <% end %>
  }
)
