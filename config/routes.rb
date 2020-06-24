Rails.application.routes.draw do

  root to: 'home#index'

  get 'home/index'
  get 'styles/atoms'
  get 'styles/molecules'
  get 'styles/organisms'

  resources :ideas

  

  get 'account/ideas'

end
