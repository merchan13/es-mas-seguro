Rails.application.routes.draw do

  root 'pages#home'

  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'faq',      to: 'pages#faq'

  resource :insurance_requests
  resource :complaints

end
