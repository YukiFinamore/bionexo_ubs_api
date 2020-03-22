Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/find_ubs', to: 'hospitals#index' , as: 'find_ubs'
    end
  end
  
  resources :hospitals do
    collection {post :import}
  end

  root to: "api/v1/hospitals#index"
end
