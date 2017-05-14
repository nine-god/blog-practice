class ArticlesController < ApplicationController
	def index
		@articles = Article.all
		@lcbb_testbed = Lcbb::Testbed.find(1)
		#@lcbb_testbed = Lcbb::Testbed.new(name:"11")
		#@lcbb_testbed.save
		#render file:"/home/caiyuanmao/passenger.3000.log"
		#render js: "alert('Hello Rails');"
		#render json: @lcbb_testbed
		#render plain: "raw"
	end
	def new
		@article = Article.new
	end
	def edit
		@article = Article.find(params[:id])
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
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end

	end

	def show
		@article = Article.find(params[:id])
	end
	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end	

	private

	def article_params
		params.require(:article).permit(:title, :text)
	end
end
