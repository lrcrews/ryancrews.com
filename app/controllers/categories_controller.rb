class CategoriesController < ApplicationController


	# View of all the categories
	def index
		gon.categories = Category.all.as_json
	end


	# A category
	def show
		category = Category.find_by_id(params[:id])
		redirect_to :index if category.nil?
		gon.category = category.as_json(include_all: 'yes')
	end


end
