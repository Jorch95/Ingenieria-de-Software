Rails.application.routes.draw do
resource :purchases
get 'requests/solicitar'
resources :favours
resources :achievements
resources :comments
resources :requests
get 'home/index'
get 'about/contact'
get 'about/FAQ'
get 'legal/terms'
get 'legal/privacy'
get "/" => "favours#index", :as => "root"
devise_for :users

 end
