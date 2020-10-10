require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :all

  it 'Create a customer' do
    customer = customers(:paul)

    expect(customer.name).to eq('Paul Lenoir')
  end
end
