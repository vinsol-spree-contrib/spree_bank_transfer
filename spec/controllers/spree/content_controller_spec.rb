require 'spec_helper' 

describe Spree::ContentController do
  before do
    controller.stub(:authenticate_spree_user!).and_return(true)
    @user = mock_model(Spree::User, :generate_spree_api_key! => false, :last_incomplete_spree_order => nil)
    controller.stub(:spree_current_user).and_return(@user)
  end

  describe "GET bank_transfer" do
    it "renders bank_transfer" do
      get :bank_transfer, :use_route => 'spree'
      response.should render_template("bank_transfer")
    end
  end
end