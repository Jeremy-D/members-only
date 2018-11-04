Rails.application.routes.draw do
	root 'posts#index'
	get '/about', to: 'static_pages#about'

	#sessions/login
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	

	#users 
	resources :users, only: [:index]  

	#posts 
	resources :posts, only: [:index, :new, :create]

end
