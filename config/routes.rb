Rails.application.routes.draw do

  root 'pages#home'

  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'fire',     to: 'pages#fire_insurance'
  get 'life',     to: 'pages#life_insurance'

  resource :wizard do
    get :step1
    get :step2
    get :step3

    post :validate_step
  end

  resource :fire_wizard do
    get :step1
    get :step2
    get :step3

    post :validate_step
  end

  resource :life_wizard do
    get :step1
    get :step2
    get :step3

    post :validate_step
  end

end
