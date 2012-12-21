class Product < ActiveRecord::Base
  attr_accessible :imageLink, :link, :name, :price, :scrape_time, :sku, :store
end
