"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("HomeController",
	[ "$scope", "$timeout", "Post", ($scope, $timeout, Post) ->


		$scope.posts = Post.posts_from_json_posts(gon.posts)


		$scope.navigateToAllPosts = ->
			$scope.navigateToLink("/posts")


		$scope.initialize = ->
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
