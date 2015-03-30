'use strict'

rcblogAppServicesModule = angular.module("rcblogApp.services")

rcblogAppServicesModule.factory("Shirt", ->
	class Shirt
		
		constructor: (json={}) ->
			@created_at = json.created_at ? ""
			@id = json.id ? null
			@image_link = json.image_link ? ""
			@link = json.link ? ""
			@name = json.name ? ""
			@updated_at = json.updated_at ? ""

			
		className: ->
			"shirt-#{ @name.replace(/\ /g, "-") }"


		showLink: ->
			if @id?
				"/shirts/#{@id}"
			else
				"/shirts/meta"


		@shirt_from_json_shirts: (json_shirts_array) ->
			# Create class versions of json shirts in the array
			new Shirt(shirt) for shirt in json_shirts_array

)
