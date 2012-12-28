# We are doing this to set the cookies before each cucumber test
# I was unable to set the cookies using any other method.
Before do
  visit('/products/new') 
end