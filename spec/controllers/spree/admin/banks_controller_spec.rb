require 'spec_helper'

describe Spree::Admin::BanksController, type: :controller do

  let(:role) { Spree::Role.create!(name: 'user') }
  let(:roles) { [role] }

  before(:each) do
    @user = mock_model(Spree::User, :generate_spree_api_key! => false)
    allow(@user).to receive_message_chain(:roles, :includes).and_return([])
    allow(@user).to receive(:has_spree_role?).with('admin').and_return(true)
    allow(controller).to receive(:spree_user_signed_in?).and_return(true)
    allow(controller).to receive(:spree_current_user).and_return(@user)
    allow(@user).to receive(:roles).and_return(roles)
    allow(roles).to receive(:includes).with(:permissions).and_return(roles)
    allow(controller).to receive(:authorize_admin).and_return(true)
    allow(controller).to receive(:authorize!).and_return(true)
  end

  describe "GET index" do
    before(:each) do
      @bank1 = mock_model(Spree::Bank)
      allow(Spree::Bank).to receive(:page).and_return([@bank1])
    end

    def send_request
      get :index
    end

    it "assigns @banks" do
      send_request
      expect(assigns(:banks)).to eq([@bank1])
    end

    it "paginates banks" do
      expect(Spree::Bank).to receive(:page)
      send_request
    end

    it "renders index template" do
      send_request
      expect(response).to render_template(:index)
    end
  end

  describe "PUT toggle_activation" do
    before(:each) do
      @bank = mock_model(Spree::Bank, :toggle! => true)
      allow(Spree::Bank).to receive(:find).with("1").and_return(@bank)
    end

    def send_request
      put :toggle_activation, params: { id: "1" }, as: :js
    end

    it "toggles activation status of bank" do
      expect(@bank).to receive(:toggle!).with(:active)
      send_request
    end

    context "when activation status toggled successfully" do
      it "sets @success to true" do
        send_request
        expect(assigns(:success)).to be true
      end
    end

    context "when activation status not toggled successfully" do
      before(:each) do
        allow(@bank).to receive(:toggle!).and_return(false)
      end

      it "sets @success to false" do
        send_request
        expect(assigns(:success)).to be false
      end
    end
  end
end
