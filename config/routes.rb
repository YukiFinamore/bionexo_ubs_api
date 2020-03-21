Rails.application.routes.draw do
	resources :hospitals do
		collection {post :import}
	end

	root to: "hospitals#index"
end
