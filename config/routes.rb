Rails.application.routes.draw do
  
  root 'band#landing'
  resources :posts do
    resources :comments
  end
  resources :photos, :chronicles
  
  
  get 'landing' => 'band#landing', :as => :landing
  get 'admin' => 'posts#admin', :as => :admin
  get 'gallery' => 'band#gallery',:as => :gallery
  get 'members' => 'band#members', :as => :members
  get 'join' => 'band#join', :as => :join
  get 'contact' => 'band#contact', :as => :contact
  
end
