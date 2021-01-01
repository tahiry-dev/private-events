class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:name))
        if @user.save
          flash[:success] = "welcome to Private Events APP"
          redirect_to @user
        else
          render :new
        end
    end

end