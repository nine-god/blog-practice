class Blog::WelcomeController < ApplicationController
	layout "blog"
	def index
		@users = User.all
	end
end
