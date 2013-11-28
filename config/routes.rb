StarterApp::Application.routes.draw do
  get "comments/create"
  root 'welcome#index'
  get "/unauthorized" => "welcome#unauthorized"

  resources :projects do
    member do
      post "sortorder"
      post "resetsortorder"
      get "manage"
      get "stories_per_iteration"
    end
    resources :stories do
      collection do
        get "current"
        get "icebox"
      end
      member do
        post "addtoiteration"
        post "removefromiteration"
        post "adduser"
        delete "removeuser"
      end
    end
    resources :iterations do
      member do
        put :set_current
      end
    end
  end
  resources :statuses
  resources :comments
  resources :criteria
  resources :criteria_comments

  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]
  match "/signout" => "sessions#destroy", :as => :signout, via: [:get, :post]
  get "/auth/failure" => "sessions#failure"
  get "/ldap/welcome" => "ldap#welcome"
  get "/welcome/options" => "welcome#options"
  post "/ldap/login" => "sessions#ldap_login"
  
  # post "projects/:project_id/sortorder" =>  "projects#sortorder"
  # get "projects/:project_id/sortorder" =>  "projects#sortorder"

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
