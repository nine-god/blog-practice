class Blog::WelcomeController < ApplicationController
	layout "blog"

	def home
	end

	def index
		@users = User.all
	end

	def test_ajax
		xml = "
			<note>
				<to>George</to>
				<from>John</from>
				<heading>Reminder</heading>
				<body>Don't forget the meeting!</body>
			</note>
"
	  	respond_to do |format|
			format.json { render json: {a:"111"} }
			format.xml{render xml: xml}
	  	end
	end
end
