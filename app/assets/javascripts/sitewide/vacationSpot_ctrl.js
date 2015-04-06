(function() {
  "use strict";

  angular.module("app").controller("vacationSpotCtrl", function($scope, $http, $location){

// can the address below not go into the .env file?
    $scope.fetchData = function(vacation_id) {
      $scope.vacation_id = vacation_id;
      $http.get("/api/v1/vacations/" + vacation_id + ".json").then(function(response) {
        $scope.vacations = response.data;
      });
    };


// thing I have to do is iterate over the type, if bar restaurant set website to menu, else website

    $scope.addNewSpot = function(newLat, newLng, newImage, newSpotName, newDescription, newRout, newPhone, newOpen, newReservation, newWebsite, newCity, newState, newZip, newStreetNumber) {

          var newSpot = {
            lat: newLat,
            lng: newLng,
            image: newImage,
            spot_name: newSpotName,
            description: newDescription,
            rout: newRout,
            phone: newPhone,
            open: newOpen,
            reservation: newReservation,
            website: newWebsite,
            city: newCity,
            state: newState,
            zip: newZip,
            street_number: newStreetNumber
            };

            $scope.vacations.vacation_spots.push(newSpot);

       // $http.post('/api/v1/vacations.json', newSpot).then(function(response) {
       //         $scope.vacations.vacation_spots.push(newSpot);
       //       }, function (error) {
       //         $scope.error = error.statusText;
       //       });
          };

          $scope.test = function() {
            $scope.$apply();
          }




    //   $http.post('/api/v1/lumbers.json', wood).then(function(response) {
    //       $scope.lumbers.push(wood);
    //       $scope.newWoodDim = "";
    //       $scope.newWoodSpecies = "";
    //       $scope.newWoodsize = "";
    //       $scope.newWoodUse = "";
    //       $scope.errors = null;
    //     }, function (error) {
    //       $scope.errors = error.data.errors;
    //     });

    // };
 
    //   $scope.descending = true;

    // $scope.changeOrder = function(attribute) {
    //       $scope.orderByAttribute = attribute;
    //       $scope.descending = !$scope.descending;
    //     };
    


    window.scope = $scope;
  });

}());
