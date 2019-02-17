class AddStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end

    add_index :stories, :blog_id
  end
end
