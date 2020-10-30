require 'rails_helper'

RSpec.describe Product, type: :model do 
  it 'is valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to belong_to(:category) }
  end

  context 'Association' do
    it { should validate_presence_of(:price) }
  end

  context 'Instance Methods' do
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end
end
