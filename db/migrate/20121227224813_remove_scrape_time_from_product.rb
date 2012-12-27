class RemoveScrapeTimeFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :scrape_time
  end

  def down
    add_column :products, :scrape_time, :string
  end
end
