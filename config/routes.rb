Rails.application.routes.draw do


  root 'front/challenges#index'
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  namespace :front do
    resources :mentor_challenges, only: [ :show ]
    resources :challenge_types, only: [ :new ]
    resources :challenges, only: [ :index, :show, :new, :create ] do
      resources :milestones, only: [ :create ]
      resources :challenge_settings, only: [ :new, :create, :update ]
      resources :invites, only: [ :new, :create ]
    end
    resources :conversations, only: [ :create, :show, :update ] do    
      resources :messages, only: [ :create, :new ]
    end
    namespace :learning do
      resources :challenges, only: [ :new, :create, :update ] do
        resources :milestones, only: [ :new, :create, :destroy ] do
          resources :sub_milestones, only: [ :new, :create, :destroy, :update ], shallow: true
        end
      end
    end
  end


  get 'front/mentor/:token', to: 'front/mentors#create', as: 'mentor_create'
  
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
