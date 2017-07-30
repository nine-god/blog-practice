class Blog::ArticlesController < ApplicationController
	layout "blog"
	before_action :authenticate_user!,:auth_update , except: [:index,:show]
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
		@user = User.find(params[:user_id])
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to blog_user_article_path(@user,@article)
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

	def auth_update
		user_id = params[:user_id]
		if current_user.id != user_id.to_i
			@user = User.find(user_id)
			redirect_to blog_user_articles_path(@user), notice: '您没有权限！'
		
		end	
	end
end
