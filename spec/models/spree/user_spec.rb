require 'spec_helper'

describe Spree.user_class, type: :model do
  it { is_expected.to have_many(:payments).through(:orders) }
end
