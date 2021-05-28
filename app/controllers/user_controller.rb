class UserController < ApplicationController
    def index
        @users = User.user_all.page(params[:page])
    end
end
