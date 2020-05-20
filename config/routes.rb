Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "signup", to: "users#new"
  resources :users , only: [:index,:show,:new,:create] do
  # 中間テーブルから先にある、フォロー中のユーザとフォローされているユーザ一覧を表示するページ
    member do
      get :followings
      get :followers
      get :favorites
    end
    # collection do
    #   get :search
    # end
    # URLにidを含まないrouteを作成
  end

  resources :microposts , only: [:create, :destroy]
  resources :relationships , only: [:create ,:destroy]
  resources :favorites , only: [:create, :destroy]
  # ログインユーザがユーザをフォロー／アンフォローできるようにするルーティング
end
