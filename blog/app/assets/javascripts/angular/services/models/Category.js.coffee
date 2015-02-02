'use strict'

rcblogAppServicesModule = angular.module("rcblogApp.services")

rcblogAppServicesModule.factory("Category", ->
	class Category
		
		constructor: (json={}) ->
			@created_at = json.created_at ? ""
			@id = json.id ? null
			@name = json.name ? ""
			@updated_at = json.updated_at ? ""

			@intro_post = json.intro_post ? {} #Post.js.coffee
			@posts = json.posts ? [{}] #also Post.js.coffee


		className: ->
			"category-#{@name.replace(' ', '-')}"


		showLink: ->
			if @id?
				"/categories/#{@id}"
			else
				"/categories/meta"


		@category_from_json_categories: (json_categories_array) ->
			# Create class versions of json categories in the array
			new Category(category) for category in json_categories_array

)
