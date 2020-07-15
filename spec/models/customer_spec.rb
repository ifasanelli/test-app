require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:customer, name: 'Italo Fasanelli')
    expect(customer.full_name).to eq('Sr(a). Italo Fasanelli')
  end

  it '#full_name' do
    customer = create(:buyer)
    expect(customer.full_name).to start_with('Sr(a). ')
  end

  it { expect{ create(:user) }.to change{Customer.all.size}.by(1) }

  it 'Herança' do
    customer = create(:customer_vip)
    expect(customer.vip).to be true
  end

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    attrs1 = attributes_for(:customer_vip)
    # puts attrs
    # puts attrs1
  end

  it 'Usando o attributes_for 2' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)

    expect(customer.full_name).to start_with('Sr(a). ')
  end

  it 'Atributo Transitório' do
    customer = create(:customer, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to be false
  end

  it 'Cliente Masculino VIP' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to be true
  end

  it 'Sequence' do
    customer1 = create(:customer)
    customer2 = create(:customer)
    puts customer1.email
    puts customer2.email
  end
end
