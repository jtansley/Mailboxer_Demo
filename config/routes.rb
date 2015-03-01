Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  resources :users

  get "/messages" => redirect("/conversations")
  resources :messages do
  member do
    post :new
  end
end
resources :conversations do
  member do
    post :reply
    post :trash
    post :untrash
  end
 collection do
    get :trashbin
    post :empty_trash
 end
end

end
