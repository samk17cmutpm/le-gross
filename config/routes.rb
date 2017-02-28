Rails.application.routes.draw do

  get   'packs', to: 'packs#index'

  get   'packs/new'

  get   'packs/update'

  get   'packs/show'

  post  'packs/create'

  get   'packs/finished'

  get   'packs/received'

  get   'products', to: 'products#index'

  get   'products/new'

  post  'products/update'

  get   'products/show'

  post  'products/create'

  get   'repositories', to: "repositories#index"

  get   'repositories/new'

  get   'orders', to: "orders#index"

  get   'orders/new'

  post  'orders/create'

  get   'orders/:id', to: 'orders#show'

  get   'imports', to: 'imports#index'

  get   'imports/new'

  post  'imports/create'

  get   'imports/update_status'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # root to: admin_root_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
