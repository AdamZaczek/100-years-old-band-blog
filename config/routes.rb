Rails.application.routes.draw do
  
  
  resources :posts
  
  
  get 'landing' => 'band#landing', :as => :landing
end
