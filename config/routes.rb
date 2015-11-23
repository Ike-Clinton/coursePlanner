Rails.application.routes.draw do

  resources :comments
  get 'sessions/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root :to => redirect('/index')
   # resources :users
   
   get 'index' => 'courses#index'
   
   get 'register_user' => 'courses#register_user'
   post 'register_user' => 'courses#submit_register_user'
   
   get 'register_classes' => 'courses#register_classes'
   post 'register_classes' => 'courses#submit_register_classes'
   
   get 'login' => 'sessions#new'
   post 'login' => 'sessions#create'
   delete 'logout' => 'sessions#destroy'
   
   get 'student' => 'courses#student'
   get 'advisor' => 'courses#advisor'
   
   get 'logout' => 'sessions#destroy'
   
   get 'view_student' => 'courses#view_student'
   
   get 'advisor_add_classes' => 'courses#advisor_add_classes'
   post 'advisor_add_classes' => 'courses#submit_advisor_add_classes'
   
   

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
  #     #     resources :sales do
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
