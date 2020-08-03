require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem 1 pedido' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Sobrecrevendo atributos' do
    customer = create(:customer, name: 'João Gilberto')
    order = create(:order, customer: customer)
    expect(order.customer.name).to eq('João Gilberto')
  end

  it 'Tem 3 pedidos' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end
end
