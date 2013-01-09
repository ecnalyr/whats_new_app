Given /^(\d+) products exist for each of (\d+) stores$/ do |products, stores|
  for number_of_stores in 1..Integer(stores)
    for number_of_products in 1..Integer(products)
      FactoryGirl.create(:product, store: number_of_stores)
    end
  end
end

When /^user visits the Home page$/ do
  visit('/')
end

Then /^user should see (\d+) store summaries$/ do |number_of_stores|
  page.should have_css("ul.store_summary", :count => 2)
end

Then /^each summary should contain (\d+) product summaries$/ do |number_of_products|
  page.should have_css('ul#1 li', :count => number_of_products.to_i)
  page.should have_css('ul#2 li', :count => number_of_products.to_i)
end