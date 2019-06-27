class Api::V1::SessionsController < ApplicationController
	protect_from_forgery with: :null_session

	def create
		binding.pry
		
	end

end
