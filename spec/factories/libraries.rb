FactoryGirl.define do
  factory :library do
    name Faker::Name.name
    address Faker::Address.city
    phone Faker::PhoneNumber.phone_number
  end
end