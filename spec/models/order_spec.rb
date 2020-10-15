require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Il y a une commande' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it '3 commandes' do
    orders = create_list(:order, 3, description: 'Tested')
    p orders
    expect(orders.count).to eq(3)
  end
end
