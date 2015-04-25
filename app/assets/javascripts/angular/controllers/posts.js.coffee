"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("PostsController",
	[ "$scope", "Post", ($scope, Post) ->


		$scope.posts = Post.posts_from_json_posts(gon.posts)


		$scope.initialize = ->
			# go warriors
			

	])
