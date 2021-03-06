Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#items'

  get '/items' , to: 'pages#items'
  post '/items' , to: 'pages#post_add_item'

  get '/price_list', to: 'pages#price_list'

  get '/update_stock', to: 'pages#update_stock'
  post '/update_stock', to: 'pages#post_update_stock'

  get '/items/:id/update_stock', to: 'pages#update_stock'
  post '/items/:id/update_stock' , to: 'pages#update_stock'

  get '/items/:id/edit', to: 'pages#edit'
  post 'items/:id/edit', to: 'pages#post_edit'

  get '/deactivated', to: 'pages#deactivated'

  post 'items/:id/reactivate', to: 'pages#reactivate'
  get 'items/:id/reactivate', to: 'pages#reactivate'


  get 'items/:id/view_updates', to: 'pages#view_updates'
  post 'items/:id/view_updates', to: 'pages#view_updates'

  get 'items/:id/details', to: 'pages#details'
  post 'items/:id/details', to: 'pages#details'

  get '/items/new_item', to: 'pages#new_item'
  post '/items/new_item', to: 'pages#post_new_item'

 

end
