Deface::Override.new(
  virtual_path: 'spree/admin/payments/_list',
  name: 'add_payment_reference_details',
  insert_after: "#payments",
  text: %q{
    <% if bank_transfer_payment = @order.payments.from_bank_transfer.first %>
      <fieldset class="no-border-bottom" >
        <legend align="center"><%= Spree.t(:payment_reference_details) %></legend>
        <table class="index table">
          <thead>
            <tr data-hook="payments_header" class="table-active">
              <th><%= Spree.t(:deposited_on) %></th>
              <th><%= Spree.t(:bank_name) %></th>
              <th><%= Spree.t(:receipt) %></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class='align-center'><%= bank_transfer_payment.deposited_on %></td>
              <td class='align-center'><%= bank_transfer_payment.bank_name %></td>
              <td class='align-center' width="450px">
                <% if bank_transfer_payment.receipt.attached? %>
                  <%= image_tag main_app.url_for(bank_transfer_payment.receipt), class: "w-100" %>
                <% end %>
              </td>
            </tr>
          </tbody>
        </table>
      </fieldset>
    <% end %>
  }
)
