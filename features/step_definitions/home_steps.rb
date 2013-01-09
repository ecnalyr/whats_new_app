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

Then /^user should see (\d+) store summaries$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^each summary should contain (\d+) product summaries$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end