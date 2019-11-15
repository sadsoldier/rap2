class UserController < ApplicationController

    def index
        @pagy, @users = pagy(User.all.order(name: :desc))
    end

    def create
        user = User.new
        user.is_admin = params[:is_admin]
        user.name = params[:name]
        user.username = params[:username]
        user.password = params[:password]
        user.password_confirmation = params[:password]

        if user.valid?
            user.save
            flash[:notice] = "User record created"
        else
            flash[:alert] = user.errors.full_messages
        end 
        redirect_to user_index_path
    end

    def update
        id = params[:id]
        user = User.find_by(id: id)
        user.is_admin = params[:is_admin]
        user.name = params[:name]
        user.username = params[:username]

        if params[:password] != nil
            user.password = params[:password]
            user.password_confirmation = params[:password]
        end

        if user.valid?
            user.save
            flash[:notice] = "User record updated"
        else
            flash[:alert] = user.errors.full_messages
        end
        redirect_to user_index_path
    end

    def drop
        id = params[:id]
        user = User.find_by(id: id)
        user.destroy
        flash[:notice] = "User record deleted"
        redirect_to user_index_path
    end

end
