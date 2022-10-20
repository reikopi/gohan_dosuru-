Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/show'
  get 'groups/edit'
  get 'new/show'
  get 'new/edit'
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
