Rails.application.routes.draw do
  require 'sidekiq/web'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope :path => '/api/v1/', :defaults => { :format => :json }, :module => "api_v1", :as => 'v1' do
    resources :companies # ApiV1::CompaniesController
    resources :articles # ApiV1::ArticleController
    resources :jobs # ApiV1::JobController
    resources :users # ApiV1::UserController

    post "/login" => "auth#login"
    post "/logout" => "auth#logout"

  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :articles, only: [:index, :show] do
    member do
      post :follow
    end
  end

  resources :company_forms, only: [:new, :create]

  resources :companies, only: [:index, :show] do
    member do
      post :follow
    end

    resources :jobs, only: [:show] do
      member do
        post :follow
        get  :check_resume
        post :apply
      end
    end
  end

  get "/about" => "companies#about"
  get "/privacy" => "companies#privacy"
  get "/success" => "jobs#success"
  get "/jobs" => "jobs#index"

  get "/resume/:token" => "users#view_resume", :as => "view_resume"
  get "/resume" => "users#resume"
  get "/follows" => "users#follows"
  get "/information" => "users#show"
  get "/preview" => "users#preview"

  resources :users, only: [:show, :edit, :update]

  # You can have the root of your site routed with "root"
  root 'companies#home'

  namespace :admin do
    resources :companies do
      resources :jobs
      resources :members
    end

    resources :adverts

    resources :articles
    resources :article_categories

    resources :company_categories, only: [:index, :create, :update, :destroy]
    resources :job_categories, only: [:create, :update, :destroy]
    resources :areas, only: [:create, :update, :destroy]
    resources :users

    get "all_job" => "jobs#all_job"
    get "company_form" => "companies#company_form"
  end

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
