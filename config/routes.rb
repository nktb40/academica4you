Academica4you::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'companies#index'
   
   #resources :schools , only: [:index, :new, :autocomplete, :show, :create, :edit, :update, :destroy]
   #get 'search' => 'schools#search'
   resources :schools do
    collection do
      get :autocomplete
      get :get_addr_by_pos
     end
   end
   
   resources :companies, only: [:index, :new, :create, :edit, :update, :destroy]
   
   resources :courses, only: [:index, :new, :show, :create, :edit, :update, :destroy]
   
   resources :others, only: [:index]
   
   resources :languages, only: [:index, :new, :create, :edit, :update, :destroy]
   
   get 'courses/update_level_select/:id', :controller=>'courses', :action => 'update_level_select'
   
   resources :residences, only: [:index, :new, :create, :edit, :update, :destroy]
   
   resources :carts, only: [:index]
   
   resources :orders, only: [:new]

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
