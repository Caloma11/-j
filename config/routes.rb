Rails.application.routes.draw do
  root to: "pages#home"

  resources :links, only: [:create, :show]

  get '/:slug', to: 'links#go', as: :go
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
