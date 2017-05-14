Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'welcome#index'
	# root to:'welcome#index'
  resources :user_files do
    collection do
      post 'search'
    end
  end
  root to:'user_files#index'
end
