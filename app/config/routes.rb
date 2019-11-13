
class AdminConstraint

    def current_user(request)
        User.find_by_id(request.session[:user_id])
    end

    def matches?(request)
        user = current_user(request)
        if user 
            user.is_admin
        else
            false
        end
    end
end

class UserConstraint

    def current_user(request)
        User.find_by_id(request.session[:user_id])
    end

    def matches?(request)
        user = current_user(request)
        user != nil
    end
end


Rails.application.routes.draw do

    get 'login', to: 'session#new', as: 'login'
    get 'logout', to: 'session#destroy', as: 'logout'
    post 'auth', to: 'session#create', as: 'auth'

    constraints UserConstraint.new do
        root 'record#index'
        get 'record', to: 'record#index', as: 'record_index'
        get 'record/download', to: 'record#download', as: 'record_download'
        get 'record/update', to: 'record#update', as: 'record_update'

    end

    constraints AdminConstraint.new do
        root 'record#index'

        get 'user', to: 'user#index', as: 'user_index'
        post 'user/create', to: 'user#create', as: 'user_create'
        post 'user/drop', to: 'user#drop', as: 'user_drop'
        post 'user/update', to: 'user#update', as: 'user_update'
    end

    root 'session#new'

    match "/404", to: "error#not_found", via: :all
    match "/402", to: "error#not_found", via: :all
    match "/422", to: "error#unacceptable", via: :all
    match "/500", to: "error#internal_error", via: :all
    match "/503", to: "error#internal_error", via: :all

    match '/:url', to: "error#not_found", via: :all, constraints: { url: /.*/ }

end
