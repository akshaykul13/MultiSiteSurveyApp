Rails.application.routes.draw do
  devise_for :users
  resources :surveys
  post '/surveys/search_surveys'
  resources :questions
  root :to => redirect('/surveys')
end
