"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("ShirtsController",
	[ "$scope", "Shirt", ($scope, Shirt) ->


		$scope.shirts = Shirt.shirts_from_json_shirts(gon.shirts)


		$scope.initialize = ->
			# cover yourself
			

	])
