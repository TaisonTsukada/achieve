class UserController < ApplicationController
    def index
        @users = User.user_all.page(params[:page])
    end
    def all_favorites
        @blogs = current_user.all_favorites
    end
end
