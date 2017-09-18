Rails.application.routes.draw do

  root 'pages#home'

  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'faq',      to: 'pages#faq'

  #get 'test',     to: 'pages#test'

  resource :insurance_requests
  resource :complaints

  #resource :test

end
