require 'spec_helper'

describe Spree::Bank, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :account_no }
  it { is_expected.to validate_uniqueness_of(:account_no).scoped_to(:name) }

  describe ".active" do
    before(:each) do
      @active_bank1 = Spree::Bank.create! name: 'bank1', :account_no => '98765'
      @active_bank2 = Spree::Bank.create! name: 'bank2', :account_no => '98765'
      @bank3 = Spree::Bank.create! name: 'bank3', :account_no => '98765', active: false
    end

    it "returns active banks" do
      expect(Spree::Bank.active).to match([@active_bank1, @active_bank2])
    end
  end
end
