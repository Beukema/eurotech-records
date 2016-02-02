Rails.application.routes.draw do
  root 'repair_orders#index'
  
  get 'search/index'
  get 'keyword_search' => 'search#list_results'
  get 'ro_search' => 'search#open_first_result'
  
  resources :repair_orders
end
