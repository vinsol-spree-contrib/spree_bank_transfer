module Spree
  module Admin
    class BanksController < ResourceController
      def index
        @banks = Spree::Bank.page(params[:page])
      end

      def toggle_activation
        @success = @bank.toggle!(:active)
      end
    end
  end
end
