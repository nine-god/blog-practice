class Blog::ArticlesController < ApplicationController
	layout "blog"
	def index
		if params[:user_id].nil?
			@articles = Article.all
		else
			begin
				@user = User.find(params[:user_id])
				@articles = @user.articles
			rescue
				logger.error "无效的用户id #{params[:user_id]}"
				redirect_to blog_welcome_index_url, notice: '无效的用户id'
			end
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
			redirect_to blog_user_article_path(@user,@article)
		else
			render 'new'
		end

	end

	def test
		respond_to do |format|
	        format.js
	    end
	end

	def show
		@user = User.find(params[:user_id])
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		@user = User.find(@article.user_id)
		redirect_to blog_user_articles_path(@user)
	end	

	private

	def article_params
		params.require(:article).permit(:title, :text)
	end
end
