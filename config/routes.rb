Rails.application.routes.draw do
  get 'page', to: 'hashpages#index'
  root 'fetchers#new'
  get '/dave', to: 'themes#lewis'
  get ':id', to: 'fetchers#index'
  get ':id/about', to: 'fetchers#about'
  get ':id/:hashtag', to: 'fetchers#show', as: :hashtag # _dw TOM how can I call hashtag_path(h)
  get 'themes/lewis', to: 'themes#lewis'
  get 'themes/lewis/boats', to: 'themes#lewis_show'
  get 'themes/lewis/about', to: 'themes#lewis_about'
  get 'themes/lewis/contact', to: 'themes#lewis_contact'
  get 'themes/lewis/shop', to: 'themes#lewis_shop'
  resource :fetchers, except: [:show]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
