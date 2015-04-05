class ShirtsController < ApplicationController


	# View of all the shirts
	def index	
		gon.shirts = Shirt.all.as_json
	end


	# A shirt
	def show
		shirt = Shirt.find_by_id(params[:id])
		redirect_to :index if shirt.nil?
		gon.shirt = shirt.as_json
	end

end