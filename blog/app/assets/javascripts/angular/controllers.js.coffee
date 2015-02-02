"use strict"

rcblogAppControllersModule = angular.module("rcblogApp.controllers", [])

rcblogAppControllersModule.config([ "$httpProvider",
	($httpProvider) ->
		# This header is required for all Ajax requests.
		$httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"
	])
