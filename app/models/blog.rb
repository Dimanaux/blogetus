class Blog < ApplicationRecord
  belongs_to :user, counter_cache: true

  validates :title, :url, presence: true
  validates :url, uniqueness: true

  has_many :stories, dependent: :destroy

  def drafts
    stories.not_published
  end

  def published_stories
    stories.published
  end

  def published_stories?
    stories.published.any?
  end

  def drafts?
    stories.not_published.any?
  end
end
