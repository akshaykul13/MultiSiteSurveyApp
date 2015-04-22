Rails.application.routes.draw do
  devise_for :users, :skip => :registrations
  resources :surveys do
    resources :questions
    resources :response_groups, only: [:new, :create]
    get 'results'
  end
  post '/surveys/search_surveys'
  root :to => redirect('/surveys')
end
