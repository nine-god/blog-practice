class ArticlesController < ApplicationController
	layout "blog"
	def index
		if params[:user_id].nil?
			@articles = Article.all
		else
			@user = User.find(params[:user_id])
			@articles = @user.articles
			
		end
		
	end
	def new
		@user = User.find(params[:user_id])
		@article = @user.articles.new
	end
	def edit
		@article = Article.find(params[:id])
		@user = User.find(@article.user_id)
	end
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end
	def create
		@user = User.find(params[:user_id])
		@article = @user.articles.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end

	end

	def show
		@article = Article.find(params[:id])
		@user = User.find(@article.user_id)
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		@user = User.find(@article.user_id)
		redirect_to user_articles_path(@user)
	end	

	private

	def article_params
		params.require(:article).permit(:title, :text)
	end
end
