class Blog::StaticsticsController < ApplicationController
	layout "blog"
	def index
		@staticstics = Staticstic.all
	end
end
