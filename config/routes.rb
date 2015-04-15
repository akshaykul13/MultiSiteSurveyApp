Rails.application.routes.draw do
  devise_for :users, :skip => :registrations
  resources :surveys
  post '/surveys/search_surveys'
  resources :questions
  root :to => redirect('/surveys')
end
