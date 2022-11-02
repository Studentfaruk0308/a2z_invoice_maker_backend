class UsersController < ApplicationController
before_action :welcome, :except => [:new, :create]

    def new # render the signup form
        if !logged_in?
        @user = User.new
        else
            redirect_to root_path
        end
    end

    def create #processing sign up form
        @user = User.new(user_params)
        if @user.save
            session[:uid] = @user.id
            #log user in
            redirect_to root_path
            # redirect_to user_path(@user)
        else
            
            # show errors
            # make them try again
            render :new
        end
    end

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to action: "index"
    end

private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end  

end
