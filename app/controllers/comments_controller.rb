class CommentsController < ApplicationController
    def create
        comment = Comment.create(comment_params)
        redirect_to "/blogs/#{comment.blog.id}"

    end
    def destroy
        @comment = Comment.find(params[:id])
        redirect_to "/blogs/#{comment.blog.id}" if @comment.destroy


    end

    private
    def comment_params
        params.require(:comment).permit(:text).merge(user_id: current_user.id, blog_id: prams[:blog_id])
    end
end
