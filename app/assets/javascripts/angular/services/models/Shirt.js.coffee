'use strict'

rcblogAppServicesModule = angular.module("rcblogApp.services")

rcblogAppServicesModule.factory("Shirt", ->
	class Shirt
		
		constructor: (json={}) ->
			@created_at = json.created_at ? ""
			@description = json.description ? ""
			@id = json.id ? null
			@image_link = json.image_link ? ""
			@link = json.link ? ""
			@name = json.name ? ""
			@updated_at = json.updated_at ? ""


		showLink: ->
			if @id?
				"/shirts/#{@id}"
			else
				"/shirts"


		@shirts_from_json_shirts: (json_shirts_array) ->
			new Shirt(shirt) for shirt in json_shirts_array

)
