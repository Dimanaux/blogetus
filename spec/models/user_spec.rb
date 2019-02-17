require "rails_helper"

describe User do
  it { is_expected.to have_many :stories }
  it { is_expected.to have_many :blogs }
end
