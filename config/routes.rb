Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :properties do
        post 'attach_image', on: :collection
        get 'closet', on: :collection
      end
    end
  end
end
