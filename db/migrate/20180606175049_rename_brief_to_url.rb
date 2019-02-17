class RenameBriefToUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :stories, :brief, :url
  end
end
