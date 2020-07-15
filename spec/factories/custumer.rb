FactoryBot.define do
  factory :customer, aliases: [:user, :buyer] do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    vip { false }
    days_to_pay { 15 }

    factory :custumer_vip do
      vip { true }
      days_to_pay { 30 }
    end
  end
end