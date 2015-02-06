"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("CategoriesController",
	[ "$scope", "$http", "$timeout", "$window", "Category", ($scope, $http, $timeout, $window, Category) ->


		_self = this

		$scope.categories = [] # see initialize


		# ng-init method
		$scope.initialize = ->
			console.log("hello categories")

			# get the JS class versions of the JSON categories
			$scope.categories = Category.category_from_json_categories(gon.categories)

			# return value can't be a DOM manipulation, and since we don't
			# actually care about the returned value from initialize let's
			# just return null
			null


	])
