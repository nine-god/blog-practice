class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :blog_staticstics, except: []
	private
		def blog_staticstics
			Staticstic.create(ip_addr:request.ip,url:request.fullpath)
		end
end
