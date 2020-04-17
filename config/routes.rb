Rails.application.routes.draw do
  get 'home/index'
  get 'styles/atoms'
  get 'styles/molecules'
  get 'styles/organisms'

  get '/ideas/index'
end
