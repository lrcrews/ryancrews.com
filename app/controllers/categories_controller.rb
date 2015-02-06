class CategoriesController < ApplicationController


	# View of all the categories
	def index
		gon.categories = Category.all.as_json
	end


	# The category about Category
	def meta
		# meta category doesn't have an actual DB intro post
		# or list of posts, hence this stuff
		meta_post = Post.meta_post.as_json.merge!(category: Category.meta_category.as_json)
		meta_category = Category.meta_category.as_json
		meta_category.merge!(intro_post: meta_post)
		meta_category.merge!(posts: ([] << meta_post)*6)
		gon.category = meta_category
		render :show
	end


	# A category
	def show
		category = Category.find_by_id(params[:id])
		redirect_to :index if category.nil?
		gon.category = category.as_json(include_all: 'yes')
	end


end
