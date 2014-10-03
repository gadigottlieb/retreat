Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create, :destroy]

  resources :users, except: [:index] do
    get '/feed' => 'users#feed', as: 'feed'
    get '/friends' => 'users#friends', as: 'friends'
    get '/confirm_deletion' => 'users#confirm_deletion', as: 'confirm_deletion'
  end


  get '/search_friends' => 'users#search', as: 'search_friends'

  resources :friendships, only: [:create, :destroy]

  resources :friend_requests, only: [:index, :create, :destroy] do
    post 'accept', on: :member
    post 'reject', on: :member
  end

  resources :getaways do
    get '/new_activity/:category' => 'activities#new', as: 'new_activity'
    get '/choose_date' => 'getaways#choose_date', as: 'choose_date'
    post '/copy' => 'getaways#copy', as: 'copy'
    get '/add_comment' => 'getaways#add_comment', as: 'add_comment'
    put '/update_comment' => 'getaways#update_comment', as: 'update_comment'
    resources :getaway_photos, only: [:new, :index]
  end

  resources :getaway_photos, except: [:new, :index] do
  end

  resources :activities, only: [:index, :create, :destroy] do
    get '/change_photo' => 'activities#change_photo', as: 'change_photo'
    put '/update_photo' => 'activities#update_photo', as: 'update_photo'
  end

end
