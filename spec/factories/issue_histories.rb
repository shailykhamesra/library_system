FactoryGirl.define do
  factory :issue_history do
    name Faker::Name.name
    association :book, factory: :book, strategy: :build
    association :member, factory: :member, strategy: :build
  end
end
