Rails.application.routes.draw do

  root to: 'home#index'

  get 'home/index'
  get 'styles/atoms'
  get 'styles/molecules'
  get 'styles/organisms'

  resources :ideas do
    resources :comments
  end



  get 'account/ideas'

end
