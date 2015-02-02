"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("PostsController",
	[ "$scope", "$http", "$timeout", "$window", "Post", ($scope, $http, $timeout, $window, Post) ->


		_self = this

		$scope.posts = [] # see initialize


		# ng-init method
		$scope.initialize = ->
			console.log("hello posts")

			# get the JS class versions of the JSON posts
			$scope.posts = Post.posts_from_json_posts(gon.posts)

			# return value can't be a DOM manipulation, and since we don't
			# actually care about the returned value from initialize let's
			# just return null
			null


	])
