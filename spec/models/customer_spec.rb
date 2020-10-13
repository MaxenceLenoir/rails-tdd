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

  it 'usando attribute_for' do
    attrs = attributes_for(:customer)
    attrs_vip = attributes_for(:customer_vip)
    customer = Customer.create(attrs)
    customer_vip = Customer.create(attrs_vip)

    expect(customer.full_name).to start_with('M.')
    expect(customer_vip.vip).to be_truthy
  end
end
