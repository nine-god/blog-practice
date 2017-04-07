class ArticlesController < ApplicationController
	def new
	end
	def create
	p "1"*88
	p params
	p "1"*88
	render plain: params[:article].inspect
	end
end
