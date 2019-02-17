class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :url
      t.integer :user_id

      t.timestamps
    end

    add_index :blogs, :url, unique: true
    add_index :blogs, :user_id
  end
end
