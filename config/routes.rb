Rails.application.routes.draw do
  
  
  resources :posts
  
  
  get 'landing' => 'band#landing', :as => :landing
  get 'admin' => 'posts#admin', :as => :admin
  get 'gallery' => 'band#gallery',:as => :gallery
  get 'members' => 'band#members', :as => :members
  get 'join' => 'band#join', :as => :join
  get 'contact' => 'band#contact', :as => :contact
  
end
