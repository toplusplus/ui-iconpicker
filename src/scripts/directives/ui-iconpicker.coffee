# @author    Justin Lau <justin@tclau.com>
# @copyright Copyright (c) 2014 Justin Lau <justin@tclau.com>
# @license   The MIT License (MIT)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

umd = (root, factory) ->

	# AMD
	if typeof define is "function" and define.amd?
		define("directives/ui-iconpicker", [
			"angular"
			"services/IconGroupCollection"
		], factory);

	# Non-AMD
	else
		factory(root.angular);

umd this, (angular) ->

	# Register Angular Module
	module = angular.module("ui-iconpicker/directives/ui-iconpicker", [
		"ui-iconpicker/services/IconGroupCollection"
	]);

	module.directive "uiIconpicker", [
		"IconGroupCollection"
		"$compile"
		(IconGroupCollection) ->
			restrict: "A"
			scope:
				name  : "@"
				model : "=?ngModel"
			link: ($scope, $element, attrs) ->
				$scope.availableIconClasses = (new IconGroupCollection(attrs.groups)).getClassArray();
				$scope.iconClass = attrs.value;

				template = "<ul class=\"dropdown-menu\" uib-dropdown-menu role=\"menu\">\n	<li ng-repeat=\"class in availableIconClasses\">\n		<button class=\"btn btn-default\" type=\"button\" ng-click=\"$parent.iconClass = class.slice(9)\">\n			<span class=\"{{ class }}\"></span>\n		</button>\n	</li>\n</ul>"
				content = $compile(template)($scope);
				$element.parent().append(content);

				# setup two way bindings between $scope.iconClass and $scope.model
				# when ng-model is found in the DOM attribute.
				if attrs.ngModel
					$scope.model = $scope[attrs.ngModel];
					$scope.$watch "iconClass", ->
						$scope.model = $scope.iconClass;
					$scope.$watch "model", ->
						$scope.iconClass = $scope.model;

				$scope.disabled = attrs.disabled?;
	]
