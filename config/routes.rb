Rails.application.routes.draw do
resource :purchases
devise_for :users
#resources :users,:only=>[:show]
get 'users/:id', to:'users#show', :as => "users"
get 'requests/solicitar'
resources :favours
resources :achievements
resources :comments
resources :requests
resources :notifications
get 'contact/'=>"contact#contact"
get 'home/index'
get 'about/contact'
get 'about/FAQ'
get 'legal/terms'
get 'legal/privacy'
get "/" => "favours#index", :as => "root"


 end
