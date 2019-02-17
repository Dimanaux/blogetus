class AddBlogsCounterCacheToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :blogs_count, :integer, default: 0
  end
end
