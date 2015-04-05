'use strict'

rcblogAppServicesModule = angular.module("rcblogApp.services")

rcblogAppServicesModule.factory("Shirt", 
	[ "Post", (Post) ->

		class Post
			
			constructor: (json={}) ->
				@created_at = json.created_at ? ""
				@id = json.id ? null
				@image_link = json.image_link ? ""
				@link = json.link ? ""
				@name = json.name ? ""
				@updated_at = json.updated_at ? ""

				@post = if json.post? then new Post(json.post) else new Post()

				
			postName: ->
					"#{@post?.name}"


				showLink: ->
				if @id?
					"/shirts/#{@id}"
				else
					"/shirts"


			@shirts_from_json_shirts: (json_shirts_array) ->
				# Create class versions of json shirts in the array
				new Shirt(shirt) for shirt in json_shirts_array

])
