"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("SiteController",
	[ "$scope", "$window", "$timeout", "Category", ($scope, $window, $timeout, Category) ->

		
		$scope.footer_categories = Category.category_from_json_categories(gon.footer_categories)

		
		$scope.navigateToLink = (link, in_new_tab=false) ->
			if in_new_tab
				window.open("#{link}", '_blank')
			else
				window.location = "#{link}"


		$scope.navigateToAbout = ->
			$scope.navigateToLink("/about")


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
			# that wasn't a fould Joey


	])
