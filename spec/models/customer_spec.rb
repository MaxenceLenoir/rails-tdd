require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'Create a customer' do
    customer = create(:customer)

    expect(customer.full_name).to start_with('M.')
  end

  it '#vip' do
    customer = create(:customer_vip)

    expect(customer.vip).to be_truthy
  end
end
