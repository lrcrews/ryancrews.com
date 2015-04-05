"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("CategoryController",
	[ "$scope", "$http", "$timeout", "$window", "Category", "Post", ($scope, $http, $timeout, $window, Category, Post) ->


		_self = this

		$scope.category = new Category(gon.category)
		$scope.post = null # the partial showing the intro post content expects a scope variable called post to exist


		$scope.introPostPresent = ->
			$scope.post?


		$scope.showPost = (post) ->
			window.location = post.showLink()


		# ng-init method
		$scope.initialize = ->
			console.log("hello category")
			
			# get the JS class versions of the category's posts
			$scope.category.intro_post = new Post($scope.category.intro_post)
			$scope.category.posts = Post.posts_from_json_posts($scope.category.posts)

			# set the scope variable used for the display of the intro post
			if $scope.category.intro_post?.id? || $scope.category.intro_post?.category?.name == "meta"
				$scope.post = $scope.category.intro_post

			# get height of section.show-category>header and set that
			# as the margin-top of the main content, do so after a
			# timeout as angularjs needs a digest cycle to populate
			# the name text for a meaningful height to be gleened.
			$timeout((->
					new_margin_top = $("section.show-category > header").outerHeight()
					new_margin_top = "5em" if new_margin_top == null
					$("section.show-category > footer").css('margin-top', new_margin_top)
				), 100
			)

			# can't return a DOM manipulation in angularJS, so null
			# is being returned instead
			null

	])
