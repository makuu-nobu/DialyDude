class AddNameAndPositionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :position, :string
  end
end
