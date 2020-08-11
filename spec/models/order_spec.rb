require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Sobrecrevendo atributos' do
    customer = create(:customer, name: 'João Gilberto')
    order = create(:order, customer: customer)
    expect(order.customer.name).to eq('João Gilberto')
  end

  it 'Tem 3 pedidos - create_list' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'Has_many' do
    customer = create(:customer, :with_orders)
    expect(customer.orders.count).to eq(3)

    #Sobrescrevendo a quantidade de orders, definimos 3 na factory
    customer = create(:customer, :with_orders, qt_orders: 5)
    expect(customer.orders.count).to eq(5)

    customer = create(:customer_with_orders)
    expect(customer.orders.count).to eq(3)
  end
end
