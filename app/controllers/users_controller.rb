class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @upcoming_events = @user.created_events.future
        @previous_events = @user.created_events.past
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:name))
        if @user.save
          log_in @user
          redirect_to @user
        else
          render :new
        end
    end

end