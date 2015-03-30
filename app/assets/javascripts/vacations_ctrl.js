(function () {
  "use strict";

  angular.module("app").controller("vacationsCtrl", function($scope) {
  var div = document.getElementById('div-lat-lng');
  
  $scope.lat = div.getAttribute("lat");
  $scope.lng = div.getAttribute("lng");






    window.scope = $scope;
  });
})();