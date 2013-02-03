class Product < ActiveRecord::Base
  attr_accessible :imageLink, :link, :name, :price, :scrape_time, :sku, :store

  def self.all_stores
    %w(Sephora Forever\ 21 AE\ Women's)
  end
end


