module Spree
  module Admin
    module BanksHelper

      def bank_status(bank)
        bank.active? ? 'Active' : 'Inactive'
      end

      def action_to_toggle_bank_status(bank) 
        bank.active? ? 'Deactivate' : 'Activate'
      end

    end
  end
end