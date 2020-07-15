FactoryBot.define do
  factory :customer, aliases: [:user, :buyer] do

    transient do
      upcased { false }
    end

    name { Faker::Name.name }
    vip { false }
    days_to_pay { 15 }
    #email { Faker::Internet.email }
    sequence(:email) { |n| "email-num-#{n}@email.com" }
    #sequence(:email, 35) { |n| "email-num-#{n}@email.com" }
    #sequence(:email, 'a') { |n| "email-num-#{n}@email.com" } 

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_male_vip, traits: [:vip, :male]
    factory :customer_female_vip, traits: [:vip, :female]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end