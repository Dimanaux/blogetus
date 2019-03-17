FactoryBot.define do
  factory :user do
    email { generate(:email) }
    password { generate(:password) }
    password_confirmation { password }

    confirmed_at { Time.zone.now }
  end

  trait :not_confirmed do
    # confirmed_at nil
  end
end
