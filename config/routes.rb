Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'static_pages#index'

  namespace :api do
    namespace :v1 do
      resources :words
      resources :sentences

      get '/three_new_words' => 'words#three_new_words'
    end
  end
end
