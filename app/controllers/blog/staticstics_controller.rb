class Blog::StaticsticsController < ApplicationController
	layout "blog"
	def index
		@limit = params[:limit]||12
		@offset = params[:offset]||0
		@total = Staticstic.count
		@staticstics = Staticstic.order("created_at").offset(@offset).limit(@limit)
	end
end
