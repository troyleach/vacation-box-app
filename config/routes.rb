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

end
