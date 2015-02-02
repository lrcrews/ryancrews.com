"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("HomeController",
	[ "$scope", "$http", "$timeout", "$window", "Post", ($scope, $http, $timeout, $window, Post) ->


		_self = this

		$scope.posts = [] # see initialize


		$scope.navigateToAllPosts = ->
			$scope.navigateToLink("/posts")


		# ng-init method
		$scope.initialize = ->
			console.log("hello home")

			# get the JS class versions of the JSON posts
			$scope.posts = Post.posts_from_json_posts(gon.posts)

			# scroll the updates footer to a visible position
			scroll_top_value = $('section.home>footer').offset().top + 100 - window.innerHeight;
			if scroll_top_value > 0
				$timeout((->
						$('body, html').animate({ scrollTop: scroll_top_value }, 'slow');
					), 1000
				)

			# return value can't be a DOM manipulation, and since we don't
			# actually care about the returned value from initialize let's
			# just return null
			null


	])
