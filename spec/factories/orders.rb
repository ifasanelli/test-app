FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número #{n}" }
    customer

    # Sobrescrevendo factories
    # association :customer, factory: :customer
  end
end
