class UserController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.user_all(current_user).page(params[:page])

    end
    def all_favorites
        @blogs = current_user.all_favorites
    end
end
