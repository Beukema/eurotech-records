Rails.application.routes.draw do
  get 'uploads/new'

  get 'uploads/create'

  root 'repair_orders#index'

  get 'search/index'
  get 'keyword_search' => 'search#list_results'
  get 'ro_search' => 'search#open_first_result'

  post 'repair_orders/uploads/upload_text' => 'uploads#upload_text'

  resources :repair_orders

  resources :uploads
end
