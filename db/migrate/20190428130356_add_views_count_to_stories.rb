class AddViewsCountToStories < ActiveRecord::Migration[5.1]
  def change
  	add_column :stories, :views_count, :integer, null: false, default: 0
  end
end
