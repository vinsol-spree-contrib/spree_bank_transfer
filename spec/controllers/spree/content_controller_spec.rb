require 'spec_helper'

describe Spree::ContentController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_spree_user!).and_return(true)
    @user = mock_model(Spree::User, :generate_spree_api_key! => false, last_incomplete_spree_order: nil)
    allow(controller).to receive(:spree_current_user).and_return(@user)
  end

  describe "GET bank_transfer" do
    it "renders bank_transfer" do
      get :bank_transfer
      expect(response).to render_template("bank_transfer")
    end
  end
end
