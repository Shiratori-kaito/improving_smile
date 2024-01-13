FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    role { :general_user }
    after(:build) do |user|
      user.avatar = Rack::Test::UploadedFile.new(Rails.root.join('public','images',  'default_avatar.png'), 'image/png')
    end
    trait :genaral_user do
      role { :genaral_user }
    end

    trait :guest_user do
      role { :guest_user }
      sequence(:name) { |n| "guest#{n}" }
    end
  end
end
