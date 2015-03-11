Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
     authenticated :user do
       root 'vacations#index', as: :authenticated_root
     end

     unauthenticated do
       root 'devise/registrations#new', as: :unauthenticated_root
     end
   end

   resources :vacations
   resources :profiles
   resources :vacation_spots

   # get 'vacation_spots/:id' => 'vacation_spots#show', :as => :vacation_spot

end
