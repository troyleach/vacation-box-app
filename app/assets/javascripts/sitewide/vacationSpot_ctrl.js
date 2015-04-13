(function() {
  "use strict";

  angular.module("app").controller("vacationSpotCtrl", function($scope, $http, $location){

// can the address below not go into the .env file?
    $scope.fetchData = function(vacation_id) {
      $scope.vacation_id = vacation_id;
      $http.get("/api/v1/vacations/" + vacation_id + ".json").then(function(response) {
        $scope.vacations = response.data;
      });

// window.onload = function() {
//   // CODE GOES HERE
// }
      var floor = Math.floor;
      var div = document.getElementById('div-lat-lng');
      var lat = div.getAttribute("lat");
      var lng = div.getAttribute("lng");

      console.log(lat);
      console.log(lng);

      var latlng = [parseFloat(lat), parseFloat(lng)];

      // console.log(latlng);
      var vacationBounds = getBoundingBox(latlng, 15);
      console.log(vacationBounds.sw.lat,vacationBounds.sw.lng);
      console.log(vacationBounds.ne.lat,vacationBounds.ne.lng);
      // console.log('just before this line of text')

      var vacationBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(vacationBounds.sw.lat,vacationBounds.sw.lng),
        new google.maps.LatLng(vacationBounds.ne.lat,vacationBounds.ne.lng)
        );
     
        // var vacationBounds = new google.maps.LatLngBounds(
        //   new google.maps.LatLng(41.95894884458032,-87.52121488584687),
        //   new google.maps.LatLng(41.79725115541969,-87.73838511415313)
        //   );

        var input = document.getElementById('user_input');

        var options = {
          // bounds: getBoundingBox(latlng, 9)
          bounds: vacationBounds
        };


        autocomplete = new google.maps.places.Autocomplete(input, options);
        
          google.maps.event.addListener(autocomplete, 'place_changed', function() {
            fillInAddress();
          });

          



        function fillInAddress() {
          // Get the place details from the autocomplete object.
          $scope.place = autocomplete.getPlace();
        
// not sure I need below
          // for (var component in componentForm) {
          //   document.getElementById(component).value = '';
          //   document.getElementById(component).disabled = false;
          // }
          
          // Get each component of the address from the place details
          // and fill the corresponding field on the form.
          var addressComponentMapping = {
            street_number: 'short_name',
            route: 'long_name',
            locality: 'long_name',
            administrative_area_level_1: 'short_name',
            country: 'long_name',
            postal_code: 'short_name'
          }

          $scope.spotInfo = {};

          for (var i = 0; i < $scope.place.address_components.length; i++) {
            var addressType = $scope.place.address_components[i].types[0];
            
              var val = $scope.place.address_components[i][addressComponentMapping[addressType]];
              $scope.spotInfo[addressType] = val;
            } 
          
          $scope.$apply();
        }

        $scope.addNewSpot = function(spotNote) {

              var newSpot = {
                lat: $scope.place.geometry.location.lat(),
                lng: $scope.place.geometry.location.lng(),
                image: $scope.place.photos ? $scope.place.photos[0].getUrl({ 'maxWidth': 250, 'maxHeight': 250 }) : null,
                spot_name: $scope.place.name,
                // description: newDescription,
                route: $scope.spotInfo.route,
                phone: $scope.place.international_phone_number,
                // open: newOpen,
                // reservation: newReservation,
                website: $scope.place.website,
                note: spotNote,
                city: $scope.spotInfo.locality,
                state: $scope.spotInfo.administrative_area_level_1,
                zip: $scope.spotInfo.postal_code,
                street_number: $scope.spotInfo.street_number,
                vacation_id: $scope.vacation_id
                };

            $http.post('/api/v1/vacation_spots.json', newSpot).then(function(response) {
                    $scope.vacations.vacation_spots.push(newSpot); 
                    newSpot.id = response.data.id;
                    $scope.userInput = null;
                  }, function (error) {
                    $scope.error = error.statusText;
                  });
              };

// ****I DO NOT KNOW WHY I CAN'T PULL THIS OUT INTO IT'S OWN FILE*********************************************
          'use strict';

          /**
           * @param {number} distance - distance (km) from the point represented by centerPoint
           * @param {array} centerPoint - two-dimensional array containing center coords [latitude, longitude]
           * @description
           *   Computes the bounding coordinates of all points on the surface of a sphere
           *   that has a great circle distance to the point represented by the centerPoint
           *   argument that is less or equal to the distance argument.
           *   Technique from: Jan Matuschek <http://JanMatuschek.de/LatitudeLongitudeBoundingCoordinates>
           * @author Alex Salisbury
          */

          function getBoundingBox(centerPoint, distance) {
            var MIN_LAT, MAX_LAT, MIN_LON, MAX_LON, R, radDist, degLat, degLon, radLat, radLon, minLat, maxLat, minLon, maxLon, deltaLon;
            if (distance < 0) {
              return 'Illegal arguments';
            }
            // helper functions (degrees<–>radians)
            Number.prototype.degToRad = function () {
              return this * (Math.PI / 180);
            };
            Number.prototype.radToDeg = function () {
              return (180 * this) / Math.PI;
            };
            // coordinate limits
            MIN_LAT = (-90).degToRad();
            MAX_LAT = (90).degToRad();
            MIN_LON = (-180).degToRad();
            MAX_LON = (180).degToRad();
            // Earth's radius (km)
            R = 6378.1;
            // angular distance in radians on a great circle
            radDist = distance / R;
            // center point coordinates (deg)
            degLat = centerPoint[0];
            degLon = centerPoint[1];
            // center point coordinates (rad)
            radLat = degLat.degToRad();
            radLon = degLon.degToRad();
            // minimum and maximum latitudes for given distance
            minLat = radLat - radDist;
            maxLat = radLat + radDist;
            // minimum and maximum longitudes for given distance
            minLon = void 0;
            maxLon = void 0;
            // define deltaLon to help determine min and max longitudes
            deltaLon = Math.asin(Math.sin(radDist) / Math.cos(radLat));
            if (minLat > MIN_LAT && maxLat < MAX_LAT) {
              minLon = radLon - deltaLon;
              maxLon = radLon + deltaLon;
              if (minLon < MIN_LON) {
                minLon = minLon + 2 * Math.PI;
              }
              if (maxLon > MAX_LON) {
                maxLon = maxLon - 2 * Math.PI;
              }
            }
            // a pole is within the given distance
            else {
              minLat = Math.max(minLat, MIN_LAT);
              maxLat = Math.min(maxLat, MAX_LAT);
              minLon = MIN_LON;
              maxLon = MAX_LON;
            }
            
            var boxObject = {
              'sw': {
                'lat': minLat.radToDeg(),
                'lng': minLon.radToDeg()
              },
              'ne': {
                'lat': maxLat.radToDeg(),
                'lng': maxLon.radToDeg()
              }  
            };
            return boxObject;
          };
        



    };


    window.scope = $scope;
  });

}());
