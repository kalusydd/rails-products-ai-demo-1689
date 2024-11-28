class AddColumnsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :category, :string
    add_column :products, :material, :string
    add_column :products, :available_quantity, :integer
    add_column :products, :size, :string
  end
end
