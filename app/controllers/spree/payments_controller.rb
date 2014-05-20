module Spree
  class PaymentsController < Spree::StoreController
    before_filter :authenticate_spree_user!
    before_filter :find_payment

    def update
      @payment.validate_bank_details = true
      if @payment.update_attributes(payment_params)
        flash[:notice] = Spree.t(:payment_successfully_updated)
      else
        flash[:error] = @payment.errors.full_messages.to_sentence
      end
      redirect_to :back
    end

    def find_payment
      @payment = spree_current_user.payments.where(:id => params[:id]).first
      unless @payment
        flash[:error] = Spree.t(:payment_not_found)
        redirect_to :back
      end
    end
    
    private
      def payment_params
        params.require(:payment).permit(:bank_name, :account_no, :transaction_reference_no)
      end
  end
end