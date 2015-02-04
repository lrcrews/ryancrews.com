"use strict"

rcblogAppDirectivesModule = angular.module("rcblogApp.directives")

# This directive allows a HTML element to show a given message
# upon entering a hover state.
#
# Attributes:
#   * rc-hover-message
# 		... it's the hover message.
#
rcblogAppDirectivesModule.directive("rcHoverElement", ->
	restrict: "A"
	
	scope:
		message: "@rcHoverMessage"
	
	link: (scope, element, attributes) ->
		element = $(element) # Wrap element in a jQuery selector.
		
		# the mouse enter event
		element.bind('mouseenter', ->
			scope.original_text = element.html()?.trim()
			element.html("#{scope.message}")
		)

		# the mouse leave event
		element.bind('mouseleave', ->
			element.html("#{scope.original_text}")
		)
)
