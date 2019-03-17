FactoryBot.define do
  factory :blog do
    title { "Ruby on Rails" }
    url { "ror" }
    user { create :user }
  end
end
