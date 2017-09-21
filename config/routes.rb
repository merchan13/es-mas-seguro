Rails.application.routes.draw do
  root 'pages#home'

  get 'acerca-de-nosotros',       to: 'pages#about'
  get 'faq',                      to: 'pages#faq'
  get 'tu-experiencia',           to: 'pages#rating'
  get 'terminos_y_condiciones',   to: 'pages#terms'

  get 'solicitud-bot',  to: 'bot_pages#bot_request'
  get 'reclamo-bot',    to: 'bot_pages#bot_complaint'

  resource :insurance_requests
  resource :complaints

  #get 'test',     to: 'pages#test'
  #resource :test
end
