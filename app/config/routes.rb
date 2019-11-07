
class AdminConstraint

    def current_user(request)
        User.find_by_id(request.session[:user_id])
    end

    def matches?(request)
        #true
        #request.session[:user_id] != nil
        user = current_user(request)
        user != nil
    end

end


Rails.application.routes.draw do

    #root 'index#index'
    #resources :sessions, only: [:new, :create, :destroy]
    #get 'sessions/new'
    #get 'sessions/create'
    #get 'sessions/destroy'
    #get 'signup', to: 'users#new', as: 'signup'

    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    post 'auth', to: 'sessions#create', as: 'auth'


    constraints AdminConstraint.new do
        root 'index#index'
        get 'user', to: 'user#index'
        post 'user/create', to: 'user#create'
        post 'user/drop', to: 'user#drop'
    end

    root 'sessions#new'

    #namespace :api, constraints: { format: 'json' } do
    #    get 'users', to: 'users#index'
    #end

    match "/404", :to => "error#not_found", :via => :all
    match "/402", :to => "error#not_found", :via => :all
    match "/500", :to => "error#internal_server_error", :via => :all
    match "/503", :to => "error#internal_server_error", :via => :all

end
