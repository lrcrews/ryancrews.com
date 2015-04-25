"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("ShirtController",
	[ "$scope", "Shirt", ($scope, Shirt) ->


		$scope.shirt = new Shirt(gon.shirt)


		$scope.initialize = ->
			# ne ho
			

	])
