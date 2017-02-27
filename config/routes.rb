Rails.application.routes.draw do

  get   'repositories', to: "repositories#index"

  get   'repositories/new'

  get   'orders', to: "orders#index"

  get   'orders/index'

  post  'orders/create'

  get   'orders/:id', to: 'orders#show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # root to: admin_root_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
