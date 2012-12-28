Given /^(\d+) products exist$/ do |products|
  for number_of_products in 1..Integer(products)
    FactoryGirl.create(:product)
  end
end

When /^user visits the Catalog page$/ do
  visit('/products')
end

Then /^user should see (\d+) products$/ do |products|
  page.should have_css("table tr.product_row", :count => 5)
end

Then /^user should see "(.*?)" before "(.*?)"$/ do |first_product, second_product|
  first_position = page.body.index(first_product)
  second_position = page.body.index(second_product)
  first_position.should < second_position
end

Then /^user clicks "(.*?)"$/ do |link|
  click_link(link)
end