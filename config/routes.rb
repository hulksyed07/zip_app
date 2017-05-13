Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'welcome#index'
	# root to:'welcome#index'
  resources :user_files
  root to:'user_files#index'
end
