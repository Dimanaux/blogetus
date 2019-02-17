require "rails_helper"

describe Story do
  # 'presence' validations
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :blog_id }

  # 'uniqueness' validations
  it { is_expected.to validate_uniqueness_of(:url).scoped_to(:blog_id) }

  # AR associations
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :blog }
end
