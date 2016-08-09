class UsersController < ApplicationController
# class UsersController < ApplicationController (dit was de regel voor heroku gepiel)
	def show
		@user = User.find(params[:id])
		@trainings = @user.trainings
	end
end
