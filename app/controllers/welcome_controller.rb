class WelcomeController < ApplicationController
	layout 'welcome'
  def index
  	@users = User.all
  	# sign_out
  end
end
