FactoryBot.define do
  factory :story do
    title { FFaker::Lorem.phrase }

    # brief { FFaker::Lorem.phrase }

    url { FFaker::Lorem.phrase }

    content do
      FFaker::HTMLIpsum.p +
        FFaker::HTMLIpsum.ol_short +
        FFaker::HTMLIpsum.fancy_string +
        FFaker::HTMLIpsum.p
    end

    published { generate(:published) }

    blog { create :blog }

    user { blog.user }
  end
end
