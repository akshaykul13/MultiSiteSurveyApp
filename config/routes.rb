Rails.application.routes.draw do
  resources :surveys
  resources :questions
  root :to => redirect('/surveys')
end
