Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#inventory'

  get '/inventory' , to: 'pages#inventory'
  post '/inventory' , to: 'pages#post_add_item'


  get '/price_list', to: 'pages#price_list'

  get '/items/:id/update_stock', to: 'pages#update_stock'
  post '/items/:id/update_stock' , to: 'pages#post_update_stock'

  get '/items/:id/show_edit', to: 'pages#show_edit'
  post '/items/:id/edit', to: 'pages#edit'
  post 'items/:id/show_edit', to: 'pages#edit'

  get '/deactivated', to: 'pages#deactivated'

  post 'items/:id/reactivate', to: 'pages#reactivate'
  get 'items/:id/reactivate', to: 'pages#reactivate'


  get 'items/:id/view_updates', to: 'pages#view_updates'
  post 'items/:id/view_updates', to: 'pages#view_updates'





 

end
