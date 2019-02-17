class AddPublishedToStory < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :published, :boolean, default: false
  end
end
