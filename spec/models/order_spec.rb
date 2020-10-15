require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it '3 commandes - Create_list' do
    orders = create_pair(:order)
    expect(orders.count).to eq(2)
  end

  it 'has_many' do
    customer = create(:customer_with_orders)
    expect(customer.orders.count).to eq(3)
  end
end
