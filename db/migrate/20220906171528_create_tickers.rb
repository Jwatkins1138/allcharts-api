class CreateTickers < ActiveRecord::Migration[7.0]
  def change
    create_table :tickers do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
