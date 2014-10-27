Triton::Application.routes.draw do
  
  devise_for :users, :skip => [:registrations]                                         

  devise_scope :user do
      root :to => 'devise/sessions#new'
  end
  #get "static_pages/index"  
  #get "static_pages/profile"  
  #get "static_pages/edit_profile"
  #post "static_pages/update_profile"
  #get "static_pages/chat"
  #get "static_pages/help"

  match '/index',    to: 'static_pages#index',    via: 'get'
  match '/profile',    to: 'static_pages#profile',    via: 'get'
  match '/edit_profile',    to: 'static_pages#edit_profile',    via: 'get'
  match '/update_profile',    to: 'static_pages#update_profile',    via: 'post'
  match '/chat',    to: 'static_pages#chat',    via: 'get'
  


  resources :projects do
      resources :sites do
          resources :reports do
            resources :tasks do
              collection do
                post :update_task
              end
              end

          collection do
            post :update_report            
            put :delete_task
          end
          put :delete_image 
          put :delete_material_image
          end
      collection do
        put :delete_site
        put :delete_report
        post :update_site
      end
      end
  collection do
  put :delete_project
  end
  end
  
  resources :dashboards do
    collection do
      get :new_user
      post :create_new_user
      get :show_user
      put :delete_user
      get :edit_user
      post :update_user
      get :list_users
      post :assign_users
      get :chat
      post :chat
      post :post_chat
    end
  end
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
