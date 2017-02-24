Rails.application.routes.draw do

  get   'orders/new'

  get   'orders/index'

  post  'orders/create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # root to: admin_root_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
