class FavoritesController < ApplicationController
    before_action :authenticate_user!


    def create
        favorite = current_user.favorites.create(blog_id: params[:blog_id])
        redirect_to blog_path(params[:blog_id])
    end

    def destroy
        favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
        redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
    end
end
