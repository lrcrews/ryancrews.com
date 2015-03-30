"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("ShirtsController",
	[ "$scope", "$http", "$timeout", "$window", "Shirt", ($scope, $http, $timeout, $window, Shirt) ->


		_self = this

		$scope.shirts = [] # see initialize


		# ng-init method
		$scope.initialize = ->
			console.log("hello shirts")

			# get the JS class versions of the JSON shirts
			$scope.shirts = Shirt.shirt_from_json_shirts(gon.shirts)
			
			# return value can't be a DOM manipulation, and since we don't
			# actually care about the returned value from initialize let's
			# just return null
			null


	])
