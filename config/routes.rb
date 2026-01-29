Rails.application.routes.draw do
  
  # Rotas de autores (mais específicas primeiro)
  get '/autores', to: 'autor#index'
  get '/autores/:id', to: 'autor#show'
  post '/autores', to: 'autor#create'
  
  # Autorias
  get '/autorias', to: 'autoria#index'
  get '/autorias/:id', to: 'autoria#show'
  post '/autorias', to: 'autoria#create'
  
  # Rotas de títulos com prefixos específicos
  get '/title/:palavra', to: 'titulo#buscar_por_titulo'
  get '/date/:data', to: 'titulo#buscar_por_data'
  
  # Rotas de títulos (genéricas por último - SEMPRE NO FINAL!)
  get '/', to: 'titulo#index'
  post '/', to: 'titulo#create'
  get '/:id', to: 'titulo#show'
end
