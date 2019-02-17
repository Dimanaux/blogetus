class Story < ApplicationRecord
  validates :title,
    :url,
    :content,
    :user_id,
    :blog_id, presence: true

  validates :url, uniqueness: { scope: :blog_id }

  belongs_to :user, counter_cache: true
  belongs_to :blog, counter_cache: true

  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }
  scope :recent, -> { published.order(created_at: :desc).limit(10) }
end
