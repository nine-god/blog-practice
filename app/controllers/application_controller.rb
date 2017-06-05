class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private

    def authenticate
	unless  authenticate_with_http_basic { |u, p| "caiyuanmao" == u && "admin" == p }

          request_http_basic_authentication
        end

    end
end
