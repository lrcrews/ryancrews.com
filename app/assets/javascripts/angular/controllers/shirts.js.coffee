"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("ShirtsController",
	[ "$scope", "$http", "$timeout", "$window", "Shirt", ($scope, $http, $timeout, $window, Shirt) ->


		_self = this

		$scope.shirts = [] # see initialize


		# ng-init method
		$scope.initialize = ->
			console.log("hello shirts")
			$scope.shirts = Shirt.shirts_from_json_shirts(gon.shirts)


	])
