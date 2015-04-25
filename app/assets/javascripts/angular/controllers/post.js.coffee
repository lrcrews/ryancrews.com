"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("PostController",
	[ "$scope", "$timeout", "Post", ($scope, $timeout, Post) ->


		$scope.post = new Post(gon.post)


		$scope.showRandomPost = ->
			$scope.navigateToLink(gon.random_post_link)


		$scope.initialize = ->
			$timeout((->
					$("section.show-post > footer").css( 'margin-top', $("section.show-post > header").outerHeight() )
				), 100
			)

			# can't return a DOM manipulation in angularJS, so null
			# is being returned instead
			null
			

	])
