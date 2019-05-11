class AddUniqueIndexToBlogStoriesUrls < ActiveRecord::Migration[5.1]
  def change
  	add_index :stories, [:blog_id, :url], unique: true
  end
end
