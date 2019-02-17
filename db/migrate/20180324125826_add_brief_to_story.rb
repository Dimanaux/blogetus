class AddBriefToStory < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :brief, :string, default: ""
  end
end
