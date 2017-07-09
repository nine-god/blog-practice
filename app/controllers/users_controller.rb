class UsersController < ApplicationController
	layout 'blog'
	before_action :authenticate_user!
	before_action :auth_update , except:[:index]
	before_action :auth_admin ,only:[:index,:destroy]
	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end
	def update
		
		@user = User.find(params[:id])
		if @user.update(permit_params)
			@users = User.all
			redirect_to user_path()
		else
			render 'edit'
		end
	end
	def show
		@user = User.find(params[:id])
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path()
	end
	private

	def permit_params
		params.require(:user).permit(:username,:blog_name)
	end

	def auth_update
		user_id = params[:id]
		if current_user.id  != user_id.to_i
			@user = User.find(user_id)
			# redirect_to user_path(@user), notice: '您没有权限！'
			redirect_to blog_user_articles_path(@user), notice: '您没有权限！'
		end	
	end
	def auth_admin
		if current_user.email != "191176233@qq.com"
			redirect_to root_path(), notice: '您没有权限！'
		end
	end
end
