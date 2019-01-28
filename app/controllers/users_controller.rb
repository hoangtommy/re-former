class UsersController < ApplicationController
    def new
        @user = User.new(username: "pretender", email: "pre@tender.com")
    end

    def create
        # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        # Used this for form_tag form

        @user = User.new(user_params)
        # Used this for regular form HTML, and form_for form
        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
