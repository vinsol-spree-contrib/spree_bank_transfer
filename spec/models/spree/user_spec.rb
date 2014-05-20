require 'spec_helper'

describe Spree::User do
  it { should have_many(:payments).through(:orders) }
end