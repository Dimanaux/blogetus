class AddStoriesCounterCacheToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stories_count, :integer, default: 0
    add_column :blogs, :stories_count, :integer, default: 0
  end
end
