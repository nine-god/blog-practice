class Blog::CommentsController < ApplicationController
    before_action :auth_login, except: [:create]
    before_action :auth_update,only:[:destroy]
    def create
        body = params[:comment][:body]
        username = current_user.username
        @user = User.find(params[:user_id])
        @article = @user.articles.find(params[:article_id])
        @comment = @article.comments.create(commenter: username ,body: body)
        redirect_to blog_user_article_path(@user,@article)
    end
    def destroy
        @user = User.find(params[:user_id])
        @article = @user.articles.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to blog_user_article_path(@user,@article)
    end
    private
    def auth_update
        user_id = params[:user_id]
        if current_user.id != user_id.to_i
          @user = User.find(user_id)
          @article = @user.articles.find(params[:article_id])
          redirect_to blog_user_article_path(@user,@article), notice: '您没有权限！'
        
        end 
    end
end
