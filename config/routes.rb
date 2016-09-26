Rails.application.routes.draw do
  devise_for :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#   new_player_session       GET    /players/sign_in(.:format)       devise/sessions#new
#       player_session       POST   /players/sign_in(.:format)       devise/sessions#create
# destroy_player_session     DELETE /players/sign_out(.:format)      devise/sessions#destroy
#      player_password       POST   /players/password(.:format)      devise/passwords#create
#  new_player_password       GET    /players/password/new(.:format)  devise/passwords#new
# edit_player_password       GET    /players/password/edit(.:format) devise/passwords#edit
#                            PATCH  /players/password(.:format)      devise/passwords#update
#                            PUT    /players/password(.:format)      devise/passwords#update
# cancel_player_registration GET    /players/cancel(.:format)        devise/registrations#cancel
#  player_registration       POST   /players(.:format)               devise/registrations#create
# new_player_registration    GET    /players/sign_up(.:format)       devise/registrations#new
# edit_player_registration   GET    /players/edit(.:format)          devise/registrations#edit
#  la misma que arriba       PATCH  /players(.:format)               devise/registrations#update
#  pero con diferente        PUT    /players(.:format)               devise/registrations#update
#  metodo                    DELETE /players(.:format)               devise/registrations#destroy


namespace :api do
  namespace :v1 do
    get "/matches/filter", to: "matches#index"
    post "/matches/filter", to: "games#index"

  end
end




resources :chat_rooms, only: [:new, :create, :show, :index]
get "/chat_rooms",to: 'chat_rooms#index', as:'chat_rooms_index'

mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  get "/players/:id", to:"players#show",as: 'player'

  post "/matches", to:"matches#create",as: "matches"
  get "/matches/new", to:"matches#new",as: "new_match"
  get "/matches/:id/edit", to:"matches#edit",as: "edit_match"
  get "/matches/:id", to:"matches#show",as: "match"
  delete "/matches/:id", to:"matches#destroy"
  patch "/matches/:id", to:"matches#update"
  post "/matches/:id",to:"matches#join_match", as:"join_match"
  get "/matches/:id/valquiria",to:"matches#valquiria", as:"valquiria"


get "/1", to:"matches#index", as: 'index1'

end
