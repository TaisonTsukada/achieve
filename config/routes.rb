Rails.application.routes.draw do
  devise_for :users

  get 'inquiry'=> 'inquiry#index'
  post  'inquiry/confirm' => 'inquiry#confirm'
  post  'inquiry/thanks'  => 'inquiry#thanks'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: 'blogs#home'
  resources :blogs do
    resources :comments, only: [:create,:destroy,:edit]
    resources :favorites, only: [:create, :destroy, :index]
  end
  resources :user, only: [:index]

  get "user/all_favorites" => 'user#all_favorites'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
