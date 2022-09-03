class AddFieldsToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :name, :string
    add_column :lists, :symbols, :string, array: true, default: []
  end
end
