Rails.application.routes.draw do
	root 'static_pages#home'
	get '/about', to: 'static_pages#about'

	#sessions/login
	get '/login', to: 'sessions#new'
end
