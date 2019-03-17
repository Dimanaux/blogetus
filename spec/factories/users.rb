FactoryBot.define do
  factory :user do
    email { generate(:email) }
    password { "123456" }
    password_confirmation { "123456" }

    confirmed_at { Time.zone.now }
  end

  trait :not_confirmed do
    # confirmed_at nil
  end
end
