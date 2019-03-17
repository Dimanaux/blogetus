require "rails_helper"

describe "Share buttons" do
  let!(:story) { create :story }

  it "facebook btn present" do
    visit story_path(story)

    expect(page).to have_content("Facebook")
  end

  it "Twitter btn present" do
    visit story_path(story)

    expect(page).to have_content("Twitter")
  end

  it "Vkontakte btn present" do
    visit story_path(story)

    expect(page).to have_content("VK")
  end
end
