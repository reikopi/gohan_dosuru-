Rails.application.routes.draw do
  # get 'homes/top'

  resources :my_schedules, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # resources :members, only: [:show]
  resources :shares, only: [:index, :show]
  resources :groups, only: [:new, :create, :show, :edit, :update, :destroy]

  devise_for :members,skip: [:passwords], controller: {
    registrations: "registrations",
    sessions: 'sessions'
  }
  get 'members/success' => 'members#success'
  get 'members/show' => 'members#show'


  root to: 'homes#top'

  # resources :members, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
