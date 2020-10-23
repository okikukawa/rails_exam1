Rails.application.routes.draw do
  resources :diaries do
    collection do
      post :confirm
    end
  end
end
