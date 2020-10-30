require 'rails_helper'

RSpec.describe CustomersController, type: :request do
  describe 'As a guest' do
    context '#index' do
      it 'responds successfully' do
        get customers_path
        expect(response).to have_http_status '200'
      end
    end

    context '#show' do
      it 'responds 302 (not authorized)' do
        customer = create(:customer)
        get customer_path(customer.id)
        expect(response).to have_http_status '302'
      end
    end
  end

  describe 'As Logged Member' do
    it '#show' do
      member = create(:member)
      customer = create(:customer)

      login_as member

      get customer_path(customer.id)
      expect(response).to have_http_status(200)
    end

    it '#render a :show template' do
    member = create(:member)
    customer = create(:customer)

    login_as member

    get customer_path(customer.id)
    expect(response).to render_template(:show)
  end
  end 
end
