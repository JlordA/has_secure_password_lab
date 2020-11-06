class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless user
        seession[:user_id] = user.user_id
        @user = user

        redirect_to controller: 'welcome', action: 'home'
    end

    def destroy_all
        session.delete :user_id
        redirect_to '/'
    end
end 