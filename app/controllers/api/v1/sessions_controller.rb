class Api::V1::SessionsController < ApplicationController
	protect_from_forgery with: :null_session

	def create
		@user = User.find_by(email: params[:session][:email])

		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			render json: @user
		else
			render json: {
				error: "Invalid Credentials"
			}
	end

	private

	def sessionParams
		params.require(:session).permit(:email, :password)
	end

end
