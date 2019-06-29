class Api::V1::SessionsController < ApplicationController
	# protect_from_forgery with: :null_session


	def create
		@user = User.find_by(email: params[:session][:email])

		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id

			user_json = UserSerializer.new(@user).serialized_json
			render json: user_json
		else
			render json: {
				error: "Invalid Credentials"
			}
		end
	end

	def get_current_user
		if logged_in?
			user_json = UserSerializer.new(current_user).serialized_json
			render json: user_json
		else
			render json: {
				error: "No one logged in"
			}
		end
	end

	def delete
		session.clear
		render json: {
			notice: "Successfully logged out"
		}, status: :ok
	end

end
