Rails.application.routes.draw do
  get '/books/:id' => 'books#show'
  delete '/books/:id' => 'books#destroy'
  resources :publishers
  # 単数リソースを設定する　=>　コントローラが扱うリソースが一つの場合（ログインユーザーのプロフィールなど）
  # routesを設定するactionを限定する　only:オプション
  resource :profile, only: %i{show edit update}
end
