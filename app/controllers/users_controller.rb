class UsersController < ApplicationController 
    before_action :authenticate_user!
    before_action :only_current_user
    
    # GET to /user/:id
    def show
        @user = User.find(params[:id])
    end

    private
    def only_current_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
    end
end