require 'rails_helper'

RSpec.describe CustomersController, type: :request do
  it 'responds successfully' do
    get customers_path
    expect(response).to have_http_status "200"
  end
end
