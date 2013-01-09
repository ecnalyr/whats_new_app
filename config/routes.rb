WhatsNewApp::Application.routes.draw do
  resources :products
  resources :latest_products

  root :to => "home#index"
end
