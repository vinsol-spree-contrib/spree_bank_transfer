Deface::Override.new(
  virtual_path: 'spree/admin/orders/index',
  name: 'filter_results_by_transaction_reference_no',
  insert_before: ".form-actions",
  text: %q{
    <div class="row">
      <div class="col-md-4">
        <div class="form-group">
          <%= label_tag nil, Spree.t(:payment_state) %>
          <%= f.select :payments_state_eq, Spree::Payment.state_machines[:state].states.collect {|s| [s.name, s.value]},
                {include_blank: true},
                {class: 'select2 form-control'} %>
        </div>
      </div>
    </div>
  }
)
