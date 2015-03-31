class ShirtsController < ApplicationController


	# View of all the shirts
	def index	
		gon.shirts = Shirt.all.as_json
	end


	# A shirt
	def show
		gon.shirt = Shirt.find_by_id(params[:id])
		gon.shirt.as_json
		if shirt.present? 
			respond_to do |format|
				format.html
			end	
		else
			respond_to do |format|
				format.html { redirect_to :index }
			end
		end
	end

end