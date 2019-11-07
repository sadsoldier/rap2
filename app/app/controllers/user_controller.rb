class UserController < ApplicationController

    def index
    end

    def create
        user = User.new
        user.name = params[:name]
        user.email = params[:email]
        user.password = params[:password]
        user.save
        #user.password_confirmation = params[:password]
        #user.save
        redirect_to '/user'
    end

    def drop
        id = params[:id]
        user = User.find_by(id: id)
        user.destroy
        redirect_to '/user'
    end

end
