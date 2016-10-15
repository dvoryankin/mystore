Rails.application.routes.draw do

  resources :items

  get ':controller(/:action(/:id))'
  # match ':controller(/:action(/:id))(.:format)'

end
