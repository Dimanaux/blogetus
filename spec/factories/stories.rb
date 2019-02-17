FactoryBot.define do
  factory :story do
    title { FFaker::Lorem.phrase }

    brief { FFaker::Lorem.phrase }

    content do
      FFaker::HTMLIpsum.p +
        FFaker::HTMLIpsum.ol_short +
        FFaker::HTMLIpsum.fancy_string +
        FFaker::HTMLIpsum.p
    end

    published true

    user
  end
end
