class RelationshipsController < ApplicationController
    def create
        follow = current_user.active_relationships.create(user_id: params[:user_id])
        redirect_to user_index_path
    end
    def destroy
        unfollow = current_user.active_relationships.find_by(user_id: params[:user_id]).destroy
        redirect_to user_index_path

    end
end
