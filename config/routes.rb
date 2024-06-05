Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  get "up" => "rails/health#show", as: :rails_health_check

  root 'pages#home'

  resources :positions, only: [:create] do
    resources :position_criteriums, only: [:new, :create, :destroy]
  end

  resources :job_applications, only: [:new, :create, :show, :update]

  patch '/job_applications/:id/validate_cv', to: 'job_applications#validate_cv', as: :validate_cv
  get '/job_applications/:id/view_cv', to: 'job_applications#view_cv', as: :view_cv
end
