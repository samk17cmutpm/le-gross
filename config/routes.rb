Rails.application.routes.draw do

  get   'deliveries/new'

  get   'deliveries', to: 'deliveries#index'

  get   'deliveries/show'

  get   'deliveries/create'

  get   'fakes', to: 'fakes#index'

  get   'fakes/new'

  post  'fakes/create'

  get   'customers', to: 'customers#index'

  get   'customers/new'

  get   'customers/show'

  get   'customers/edit'

  post  'customers/create'

  post  'customers/update'

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

  root :to => "orders#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
