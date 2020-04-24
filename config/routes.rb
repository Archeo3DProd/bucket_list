Rails.application.routes.draw do

  root to: 'home#index'

  get 'home/index'
  get 'styles/atoms'
  get 'styles/molecules'
  get 'styles/organisms'

  get 'ideas/index'
  get 'ideas/new'
  post 'ideas/create'

  get 'ideas/:id/edit', to: 'ideas#edit', as: 'edit_idea'

  patch 'ideas/:id', to: 'ideas#update', as: 'idea'

  get 'account/ideas'

end
