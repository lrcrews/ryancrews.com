"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers")

rcblogAppControllersModule.controller("SiteController",
	[ "$scope", "$http", "$window", "$timeout", "Category", ($scope, $http, $window, $timeout, Category) ->

		_self = this

		$scope.footer_categories = [] # see initialize

		
		$scope.navigateToLink = (link, in_new_tab=false) ->
			if in_new_tab
				window.open("#{link}", '_blank')
			else
				window.location = "#{link}"


		# specific links

		$scope.navigateToAbout = ->
			$scope.navigateToLink("/about")


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


		################
		# Paging Stuff
		############

		# Pagination parameters
		$scope.current_page = gon.pagination?.current_page ? 1
		$scope.default_per_page = gon.pagination?.default_per_page ? 1
		$scope.per_page = gon.pagination?.per_page ? 1
		$scope.total_pages = gon.pagination?.total_pages ? 0
		$scope.total_count = gon.pagination?.total_count


		$scope.showNextPageLink = ->
			parseInt($scope.total_pages, 10) > parseInt($scope.current_page, 10)


		$scope.showPreviousPageLink = ->
			parseInt($scope.current_page, 10) > 1
		

		# Children controllers automatically inherit the parent scope values,
		# however, setting those values from a child does not work on primitive
		# values. Therefore, this is a method a child may call to update such values.
		$scope.updatePagingValues = (current_page, default_per_page, per_page, total_pages, total_count) ->
			$scope.current_page = current_page
			$scope.default_per_page = default_per_page
			$scope.per_page = per_page
			$scope.total_pages = total_pages
			$scope.total_count = total_count

		################
		# END Paging Stuff
		####################


		# Category class (used throughout site)
		$scope.classForCategory = (category) ->
			category.className()


		# ng-init method
		$scope.initialize = ->
			console.log("hello site")
			
			# make JS class versions of the footer categories
			$scope.footer_categories = Category.category_from_json_categories(gon.footer_categories)


	])
