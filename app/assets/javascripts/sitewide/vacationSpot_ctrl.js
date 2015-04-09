(function() {
  "use strict";

  angular.module("app").controller("vacationSpotCtrl", function($scope, $http, $location){

// can the address below not go into the .env file?
    $scope.fetchData = function(vacation_id) {
      $scope.vacation_id = vacation_id;
      $http.get("/api/v1/vacations/" + vacation_id + ".json").then(function(response) {
        $scope.vacations = response.data;
      });



        var vacationBounds = new google.maps.LatLngBounds(
          new google.maps.LatLng(39.8055204953369,-75.88245927974606),
          new google.maps.LatLng(38.00887950466311,-78.19134072025393)
          );

        var input = document.getElementById('user_input');
        var options = {
          bounds: vacationBounds
        };

        var componentForm = {
          street_number: 'short_name',
          route: 'long_name',
          locality: 'long_name',
          administrative_area_level_1: 'short_name',
          country: 'long_name',
          postal_code: 'short_name'
        };

        autocomplete = new google.maps.places.Autocomplete(input, options);
        
          google.maps.event.addListener(autocomplete, 'place_changed', function() {
            fillInAddress();
          });

        function fillInAddress() {
          // Get the place details from the autocomplete object.
          $scope.place = autocomplete.getPlace();
          $scope.$apply();
          // Display misc items on in view (i need to change this bc of XSS)
          // var name = $scope.place.name;
          // var rate = $scope.place.rating;
          // var phone = $scope.place.international_phone_number;
          // var price = $scope.place.price_level;
          // var website = $scope.place.website;
          // var picture = $scope.place.photos[0].getUrl({ 'maxWidth': 250, 'maxHeight': 250 });
          // var reviews = $scope.place.review
          
          // document.getElementById('placeTitle').value = name;
          // document.getElementById('placeRate').value = rate;
          // if (place.opening_hours === undefined) {
          //   document.getElementById('placeOpen').value = ''; 
          // } else if (place.opening_hours.open) {
          //   document.getElementById('placeOpen').value = 'We are open!';
          // } else {
          //   document.getElementById('placeOpen').value = 'Sorry, we are closed'; 
          // }
          // document.getElementById('placePhone').value = phone;
          // document.getElementById('placePrice').value = price;
          // document.getElementById('placeMenu').value = website;
          // document.getElementById('placePhoto').src = picture;

          
          


          for (var component in componentForm) {
            document.getElementById(component).value = '';
            document.getElementById(component).disabled = false;
          }
          
          // Get each component of the address from the place details
          // and fill the corresponding field on the form.
          for (var i = 0; i < $scope.place.address_components.length; i++) {
            var addressType = $scope.place.address_components[i].types[0];
            
            if (componentForm[addressType]) {
              var val = $scope.place.address_components[i][componentForm[addressType]];
              document.getElementById(addressType).value = val;
            }
          }

        }
    };


// thing I have to do is iterate over the type, if bar restaurant set website to menu, else website

    $scope.addNewSpot = function(spotNote) {
        //newLat, newLng, newImage, newSpotName, newDescription, newRout, newPhone, newOpen, newReservation, newWebsite, newCity, newState, newZip, newStreetNumber

          var newSpot = {
            lat: $scope.place.geometry.location.lat(),
            lng: $scope.place.geometry.location.lng(),
            image: $scope.place.photos[0].getUrl({ 'maxWidth': 250, 'maxHeight': 250 }),
            spot_name: $scope.place.name,
            // description: newDescription,
            route: $scope.place.address_components[1].long_name,
            phone: $scope.place.international_phone_number,
            // open: newOpen,
            // reservation: newReservation,
            website: $scope.place.website,
            note: spotNote,
            city: $scope.place.address_components[2].long_name,
            state: $scope.place.address_components[3].long_name,
            zip: $scope.place.address_components[5].long_name,
            street_number: $scope.place.address_components[0].long_name,
            vacation_id: $scope.vacation_id
            };

        $http.post('/api/v1/vacation_spots.json', newSpot).then(function(response) {
                $scope.vacations.vacation_spots.push(newSpot); 
                newSpot.id = response.data.id;
              }, function (error) {
                $scope.error = error.statusText;
              });
          };

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
