require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  it 'Create a Customer' do
    customer = customers(:italo)

    expect(customer.full_name).to eq('Sr(a). Italo Fasanelli')
  end
end
