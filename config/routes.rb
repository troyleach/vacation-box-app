Rails.application.routes.draw do
  resources :place_beens
  resources :vacations
  resources :profiles
  resources :vacation_spots
  resources :messages
  resources :replies
  devise_for :users
  
  devise_scope :user do
     authenticated :user do
       root 'vacations#index', as: :authenticated_root
     end

     unauthenticated do
       root 'devise/sessions#new', as: :unauthenticated_root
     end
   end

   namespace :api do
     namespace :v1 do
       get '/spots' => 'spots#index'
       get '/spots/:id' => 'spots#show', :as => :spot
       post '/spots' => 'spots#create'
     end
   end


   # get 'vacation_spots/:id' => 'vacation_spots#show', :as => :vacation_spot

end
