"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

# The order of the things we're injecting (which is like including a module)
# is as follows:
# 	$scope is always first, it is always required for controllers
# 	other "$" injection follow in alphabetical order
# 	then our Classes/Services follow in alphabetical order

rcblogAppControllersModule.controller("PostController",
	[ "$scope", "$http", "$timeout", "$window", "Category", "Post", ($scope, $http, $timeout, $window, Category, Post) ->


		# this "this" as "_self" keeps you from accidently
		# referencing a different "this" thinking it's this
		# "this" (when in fact it's not this "this", and who
		# wants that?).
		_self = this


		$scope.post = new Post(gon.post)


		$scope.showRandomPost = ->
			$scope.navigateToLink(gon.random_post_link)


		# ng-init method
		$scope.initialize = ->
			console.log("hello post")
			
			# get height of section.show-post>header and set that
			# as the margin-top of the main content, do so after a
			# timeout as angularjs needs a digest cycle to populate
			# the name text for a meaningful height to be gleened.
			$timeout((->
					$("section.show-post > footer").css( 'margin-top', $("section.show-post > header").outerHeight() )
				), 100
			)

			# can't return a DOM manipulation in angularJS, so null
			# is being returned instead
			null

	])
