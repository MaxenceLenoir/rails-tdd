require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'Create a customer' do
    customer = create(:customer)

    expect(customer.name).to start_with('M.')
  end
end
