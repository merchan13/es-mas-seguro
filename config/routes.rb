Rails.application.routes.draw do

  root 'pages#home'

  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'car',      to: 'pages#car_insurance'
  get 'fire',     to: 'pages#fire_insurance'
  get 'life',     to: 'pages#life_insurance'

  resources :insurance_requests

  resource :wizard do
    get :step1
    get :step2
    get :step3
    get :step4

    post :validate_step
  end

end
