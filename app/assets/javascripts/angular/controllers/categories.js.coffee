"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("CategoriesController",
	[ "$scope", "Category", ($scope, Category) ->


		$scope.categories = Category.category_from_json_categories(gon.categories)


		$scope.initialize = ->
			# Daredevil on Netflix is amazing


	])
