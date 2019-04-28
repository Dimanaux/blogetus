FactoryBot.define do
  factory :blog do
    title { generate(:title) }
    url { generate(:url) }
    user { create :user }
  end
end
