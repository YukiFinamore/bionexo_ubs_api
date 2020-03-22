Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get  '/find_ubs'    , to: 'hospitals#index'        , as: 'find_ubs'
      post '/find_by_term', to: 'hospitals#find_by_term' , as: 'find_by_term'
    end
  end
  
  resources :hospitals do
    collection {post :import}
  end

  root to: "hospitals#index"
end
