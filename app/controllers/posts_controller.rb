class PostsController < ApplicationController


	before_action :set_random_post_link, only: [ :meta, :show ]


	# About whom?  Perhaps him?  Maybe her?
	def about
		about_post = Post.about_post
		if about_post.present?
			gon.post = about_post.as_json
			render :show
		else
			redirect_to :root
		end
	end


	# It's the home page
	def home
		gon.posts = Post.most_recent(6).as_json
	end


	# Paged(?) view of all the posts
	def index
		gon.posts = Post.all.as_json
	end


	# The post about Post
	def meta
		# meta post doesn't have an actual DB category, hence this
		meta_post = Post.meta_post.as_json
		meta_post.merge!(category: Category.meta_category.as_json)
		gon.post = meta_post
		render :show
	end


	# A post
	def show
		gon.post = Post.find_by_id(params[:id]).as_json
	end


	private

		def set_random_post_link
			gon.random_post_link = params[:id].present? ? post_url( id: rand(1..Post.count) ) : meta_posts_url
		end


end
