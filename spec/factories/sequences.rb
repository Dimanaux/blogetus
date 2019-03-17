FactoryBot.define do
  sequence :email do |n|
    "user_#{n}@example.com"
  end

  sequence :password do |n|
    "qwerty#{n}"
  end

  sequence :published do
    true
  end

  sequence :title do |n|
    "Story no. #{n}"
  end

  sequence :url do |n|
    "story-#{n}"
  end
end
