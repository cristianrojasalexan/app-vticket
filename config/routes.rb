Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get "home/index", to: "home#index"

  #Rutas para controller TICKET
  get "tickets/list", to: "tickets#list"
  get 'tickets/new', to: 'tickets#new'
  post 'tickets', to: 'tickets#create'
  get 'ticket/:id', to: 'tickets#show', as: 'ticket'
  get 'tickets/:id/edit', to: 'tickets#edit', as: 'edit_ticket'
  patch '/ticket/:id', to: 'tickets#update'
  put '/ticket/:id', to: 'tickets#update'
  delete 'ticket/:id', to: 'tickets#destroy'

  get "tickets/mytickets", to: "tickets#mytickets"

end
