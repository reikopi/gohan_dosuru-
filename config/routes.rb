Rails.application.routes.draw do
  # get 'homes/top'
  get 'groups/new'
  get 'groups/show'
  get 'groups/edit'
  resources :members, only: [:show]
  get 'members/success' => 'members#success'

  devise_for :members,skip: [:passwords], controller: {
    registrations: "registrations",
    sessions: 'sessions'
  }

  root to: 'homes#top'

  # resources :members, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
