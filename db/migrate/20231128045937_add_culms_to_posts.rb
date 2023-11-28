class AddCulmsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :category_id, :integer, null: false
    add_column :posts, :month_id, :integer, null: false
  end
end
