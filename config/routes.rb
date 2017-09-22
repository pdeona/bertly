Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get root to: 'url_shortener#new'

  post '/', to: 'url_shortener#create'

  resources :url_shortener, only: [:new, :create]

  get '/:shortened_uri', to: 'url_shortener#show'

end
