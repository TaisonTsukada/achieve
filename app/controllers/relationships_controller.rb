class RelationshipsController < ApplicationController
    before_action :authenticate_user!
    def create
        @user = User.find(params[:relationship][:followed_id])
        current_user.follow!(@user)
        redirect_to blogs_path
    end
    def destroy
        @user = Relationship.find(params[:id]).followed
        current_user.unfollow!(@user)
        redirect_to blogs_path
    end
end
