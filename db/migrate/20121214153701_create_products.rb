class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.datetime :scrape_time
      t.string :link
      t.string :imageLink
      t.string :sku

      t.timestamps
    end
  end
end
