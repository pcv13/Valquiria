Rails.application.routes.draw do
  devise_for :players
<<<<<<< HEAD
  resources :matches
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

  get "/", to:"players#index",as: 'players'
  get "/players/:id", to:"players#show",as: 'player'


=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/", to:"games#index"
>>>>>>> bf6136f1f4a987b88bf68a673029293171318f94

end
