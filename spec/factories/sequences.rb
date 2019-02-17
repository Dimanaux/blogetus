FactoryBot.define do
  sequence :email do |n|
    "user_#{n}@example.com"
  end
end
