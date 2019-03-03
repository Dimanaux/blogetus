class AddNameFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: true, default: nil
  end
end
