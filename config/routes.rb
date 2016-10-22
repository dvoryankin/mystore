Rails.application.routes.draw do

  resources :items do
    get :upvote, on: :member

  end

  # get ':controller(/:action(/:id))'
  # match ':controller(/:action(/:id))(.:format)'

end
