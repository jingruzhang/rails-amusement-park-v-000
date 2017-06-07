Rails.application.routes.draw do
    root 'welcome#hello'
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
    resources :users
    resources :attractions
    resources :rides
end
