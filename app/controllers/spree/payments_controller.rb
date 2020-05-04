module Spree
  class PaymentsController < Spree::StoreController
    ### Uncomment for not allow continue as Guest ###
    # before_action :authenticate_spree_user!
    before_action :find_payment

    def update
      payment_details = PaymentDetails.new(@payment, payment_params)
      if payment_details.save
        flash[:notice] = Spree.t(:payment_successfully_updated)
      else
        flash[:error] = payment_details.errors.to_sentence
      end
      redirect_back(fallback_location: root_path)
    end

    def find_payment
      @payment = if spree_current_user
        spree_current_user.payments.find_by(number: params[:id])
      else
        Payment.joins(:order).find_by(number: params[:id], spree_orders: {user_id: nil})
      end

      unless @payment
        flash[:error] = Spree.t(:payment_not_found)
        redirect_back(fallback_location: root_path)
      end
    end

    private
      def payment_params
        params.require(:payment).permit(:deposited_on, :bank_name, :account_no, :transaction_reference_no, :receipt)
      end
  end
end
