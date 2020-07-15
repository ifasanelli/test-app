require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:customer, name: 'Italo Fasanelli')
    expect(customer.full_name).to eq('Sr(a). Italo Fasanelli')
  end

  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with('Sr(a). ')
  end

  it { expect{ create(:user) }.to change{Customer.all.size}.by(1) }

  it 'Herança' do
    customer = create(:custumer_vip)
    expect(customer.vip).to be true
  end
end
