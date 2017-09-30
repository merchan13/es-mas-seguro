Rails.application.routes.draw do

  get '', to: 'dashboard#login', constraints: { subdomain: 'dashboard' }

  root 'pages#home'

  # Sobre nosotros
  get 'nosotros',       to: 'pages#about'
  get 'faq',                      to: 'pages#faq'
  get 'terminos_y_condiciones',   to: 'pages#terms'

  # Tu experiencia
  get   'tu_experiencia/:token',    to: 'pages#rating'
  post  'tu_experiencia/',    to: 'pages#save_rating'
  get   'tu_experiencia',           to: 'pages#home'

  # Bot
  get 'solicitud-bot',  to: 'bot_pages#bot_request'
  get 'reclamo-bot',    to: 'bot_pages#bot_complaint'

  # Solicitudes
  resource :insurance_requests
  resource :complaints

  #get 'test',     to: 'pages#test'
  #resource :test
end
