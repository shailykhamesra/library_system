FactoryGirl.define do
  factory :book do
    name Faker::Name.name
    association :category, factory: :category, strategy: :build
    association :library, factory: :library, strategy: :build
  end
end
