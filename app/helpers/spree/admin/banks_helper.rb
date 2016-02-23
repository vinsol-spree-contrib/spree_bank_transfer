module Spree
  module Admin
    module BanksHelper

      def bank_status(bank)
        bank.active? ? Spree.t(:active) : Spree.t(:inactive)
      end

      def action_to_toggle_bank_status(bank)
        bank.active? ? Spree.t(:deactivate) : Spree.t(:activate)
      end

      def action_text_to_toggle_bank_status(bank)
        bank.active? ? 'remove-sign' : 'ok-sign'
      end

    end
  end
end