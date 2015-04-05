Rails.application.routes.draw do
  resources :surveys
  post '/surveys/search_surveys'
  resources :questions
  root :to => redirect('/surveys')
end
