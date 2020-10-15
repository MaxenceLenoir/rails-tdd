require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it '3 commandes - Create_list' do
    orders = create_list(:order, 3, description: 'Tested')
    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders, qtt_orders: 5)
    p customer.orders
    expect(customer.orders.count).to eq(5)
  end
end
