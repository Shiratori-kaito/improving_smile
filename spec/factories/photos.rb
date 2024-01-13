FactoryBot.define do
  factory :photo do
    association :user, factory: :user
  end
end