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

  it 'Attibute transitoire' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name).to eq(customer.name.upcase)
  end

  it 'Cliente VIP Masculino' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to be_truthy
  end

  it 'Travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 0o1, 0o4, 44) do
      @customer = create(:customer_vip)
    end
    puts @customer.created_at
    puts Time.now
    expect(@customer.created_at).to eq(Time.zone.local(2004, 11, 24, 0o1, 0o4, 44))
  end
end
