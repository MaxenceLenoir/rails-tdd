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
    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    it 'Content-Type' do
      login_as @member
      customer_params = attributes_for(:customer)
      post customers_path, params: { customer: customer_params, format: :json }
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'Flash Notice' do
      login_as @member
      customer_params = attributes_for(:customer)
      post customers_path, params: { customer: customer_params }
      expect(flash[:notice]).to match(/successfully created/)
    end

    it 'with valid attributes' do
      login_as @member
      customer_params = attributes_for(:customer)
      expect { post customers_path, params: { customer: customer_params } }.to change(Customer, :count).by(1)
    end

    it 'with invalid attributes' do
      login_as @member
      customer_params = attributes_for(:customer, address: nil)
      expect { post customers_path, params: { customer: customer_params } }.not_to change(Customer, :count)
    end

    it '#show' do
      login_as @member
      get customer_path(@customer.id)
    end

    it '#render a :show template' do
      login_as @member
      get customer_path(@customer.id)
      expect(response).to render_template(:show)
    end
  end
end

RSpec.describe CustomersController, type: :controller do
  it 'Route' do
    should route(:get, '/customers').to(action: :index)
  end
end
