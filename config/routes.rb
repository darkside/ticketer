Ticketer::Application.routes.draw do
  devise_for :users
  resources :tickets
  root :to => "tickets#index"
end

