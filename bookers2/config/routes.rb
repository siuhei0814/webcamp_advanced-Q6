Rails.application.routes.draw do

  # get 'users/edit'

  root to:'homes#top'
  get '/home/about' => 'users#about'

  devise_for :users
  resources :users, only:[:edit,:update]
  post 'users/:user_id/relationships' => 'relationships#create', as: 'user_relationships'
  delete 'users/:user_id/relationships/:id' => 'relationships#destroy', as: 'user_relationship'
  get 'users/:user_id/followings' => 'relationships#followings', as: 'followings'
  get 'users/:user_id/followers' => 'relationships#followers', as: 'followers'

  # ユーザー一覧(Users)
  get 'users' => 'users#userindex'
  #1ユーザーの投稿一覧(Home)
  get 'users/:id' => 'users#usershow', as: 'usershow'

  resources :books, only:[:create,:update,:destroy]

  # 投稿一覧(Books)
  get 'books' => 'users#bookindex', as: 'bookindex'

  # 現在のユーザーの投稿詳細(User=>show)
  get 'books/:id' => 'books#show', as: 'bookshow'
  post 'books/:id/favorites/' => 'favorites#create'
  delete 'books/:id/favorites/' => 'favorites#destroy', as: 'book_favorites'
  post 'books/:book_id/post_comments' => 'book_comments#create', as: 'book_book_comments'
  delete 'books/:book_id/post_comments/:id' => 'book_comments#destroy', as: 'book_book_comment'

  get 'books/:id/edit' => 'books#edit'
  post 'books/:id/edit' => 'books#edit', as: 'edit_book'

  #検索機能のルーティング
  post '/search' => 'searchs#search', as: 'search'







end
