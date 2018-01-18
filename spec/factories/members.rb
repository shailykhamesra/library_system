FactoryGirl.define do
  factory :member do
    name Faker::Name.name
    address Faker::Address.city
    phone Faker::PhoneNumber.phone_number
    association :library, factory: :library, strategy: :build
  end
end