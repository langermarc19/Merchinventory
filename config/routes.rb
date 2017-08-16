Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get '/inventory' , to: 'pages#inventory'
  post '/inventory' , to: 'pages#post_add_item'


  get '/price_list', to: 'pages#price_list'

  get '/items/:id/update_stock', to: 'pages#update_stock'
  post '/items/:id/update_stock' , to: 'pages#post_update_stock'




 

end
