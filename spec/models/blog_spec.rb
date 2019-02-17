require "rails_helper"

describe Blog do
  # 'presence' validations
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :url }

  # 'uniqueness' validations
  it { is_expected.to validate_uniqueness_of :url }

  # AR associations
  it { is_expected.to have_many :stories }
  it { is_expected.to belong_to :user }
end
