Rails.application.routes.draw do
  # get 'homes/top'

  resources :my_schedules, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # resources :members, only: [:show]
  resources :groups, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  get "join" => "groups#join"
  post "join" => "groups#create"


  devise_for :members,skip: [:passwords], controller: {
    registrations: "registrations",
    sessions: 'sessions'
  }
  get 'members/success' => 'members#success'
  get 'members/show' => 'members#show'


  root to: 'homes#top'
  get 'members/schedules', to: 'homes#schedules'
  get 'members/schedule_details', to: 'homes#schedule_details'
  # resources :members, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
