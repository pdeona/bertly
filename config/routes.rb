Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'url_shortener#new'

  post '/', to: 'url_shortener#create'

  get '/:shortened_uri', to: 'url_shortener#show'

  get '/:uri_string', { controller: 'url_shortener', action: :create, constraints: { url_shortener: {uri_string: :string} } }

end
