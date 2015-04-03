(function() {
  "use strict";

  angular.module("app").controller("vacationSpotCtrl", function($scope, $http){


    $scope.fetchData = function() {
      $http.get("#{ENV['VACATION_SPOT_API']}/vacationSpots.json").then(function(response) {
        $scope.lumbers = response.data["spots"];
      });
    };

    $scope.addWood = function(newDimensions, newSpecies, newSizes, newUse) {
      var wood = {
        dimensions: newDimensions,
        species: newSpecies,
        sizes: newSizes,
        use: newUse
      };

      $http.post('/api/v1/lumbers.json', wood).then(function(response) {
          $scope.lumbers.push(wood);
          $scope.newWoodDim = "";
          $scope.newWoodSpecies = "";
          $scope.newWoodsize = "";
          $scope.newWoodUse = "";
          $scope.errors = null;
        }, function (error) {
          $scope.errors = error.data.errors;
        });

    };
 
      $scope.descending = true;

    $scope.changeOrder = function(attribute) {
          $scope.orderByAttribute = attribute;
          $scope.descending = !$scope.descending;
        };
    


    window.scope = $scope;
  });

}());
