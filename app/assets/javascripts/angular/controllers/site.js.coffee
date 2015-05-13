"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("SiteController",
	[ "$scope", "$window", "$timeout", "Category", "Post", ($scope, $window, $timeout, Category, Post) ->

		
		$scope.apps_category = new Category(gon.apps_category)
		$scope.footer_categories = Category.category_from_json_categories(gon.footer_categories)

		
		$scope.navigateToLink = (link, in_new_tab=false) ->
			if in_new_tab
				window.open("#{link}", '_blank')
			else
				window.location = "#{link}"


		$scope.navigateToAbout = ->
			$scope.navigateToLink("/about")


		$scope.navigateToApps = ->
			$scope.navigateToLink($scope.apps_category.showLink())


		$scope.navigateToDisclosure = ->
			$scope.navigateToLink("/disclosure")


		$scope.navigateToGithub = ->
			$scope.navigateToLink("https://github.com/lrcrews/ryancrews.com", true)


		$scope.navigateToHome = ->
			$scope.navigateToLink("/")


		$scope.navigateToShirts = ->
			$scope.navigateToLink("/shirts")


		$scope.navigateToSiteStuff = ->
			$scope.navigateToLink(gon.site_stuff_link)


		$scope.navigateToTwitter = ->
			$scope.navigateToLink("http://twitter.com/RyanCrews", true)


		$scope.showCategory = (event, category) ->
			event.stopPropagation()
			window.location = category.showLink()


		# Category class (used throughout site)
		$scope.classForCategory = (category) ->
			category.className()


		$scope.initialize = ->
			$scope.apps_category.intro_post = new Post($scope.apps_category.intro_post)
			$scope.apps_category.posts.pop() #remove the intro post
			$scope.apps_category.posts = Post.posts_from_json_posts($scope.apps_category.posts)


	])
