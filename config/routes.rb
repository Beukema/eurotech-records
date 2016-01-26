Rails.application.routes.draw do
  root 'repair_orders#index'
  
  get 'search/index'
  get "search" => "search#index"
  
  resources :repair_orders
end
