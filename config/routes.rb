Rails.application.routes.draw do
  root to: 'welcome#index'
  ActiveAdmin.routes(self)
  resources :surveys do
    resource :game_session, as: 'play', path: 'play'
  end
end
