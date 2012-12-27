# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "Product#{n}"
  end

  factory :product do
    name
    price "9.99"
    link "MyString"
    imageLink "MyString"
    sku "MyString"
  end
end
