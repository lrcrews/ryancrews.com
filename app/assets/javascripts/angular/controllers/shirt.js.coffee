"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("ShirtController",
	[ "$scope", "$http", "$timeout", "$window", "Post", "Shirt", ($scope, $http, $timeout, $window, Post, Shirt) ->


		_self = this


		$scope.shirt = new Shirt(gon.shirt)


		# ng-init method
		$scope.initialize = ->
			console.log("hello shirt")

	])
