
  // var vacationBounds = new google.maps.LatLngBounds(
  //   new google.maps.LatLng(39.8055204953369,-75.88245927974606),
  //   new google.maps.LatLng(38.00887950466311,-78.19134072025393)
  //   );

  // var options = {
  //   bounds: vacationBounds
  // };

  // var input = document.getElementById('user_input');
  // map.controls[google.maps.ControlPosition.TOP_LEFT].push(input)

  // var placeAutocomplete = new google.maps.places.Autocomplete(input, options)


// the code below is example to get the boundingBox - should use ajex I guess to pull this from DB
// var floor = Math.floor;
// var div = document.getElementById('div-lat-lng');
// var lat = div.getAttribute("lat");
// var lng = div.getAttribute("lng");

// // var latlng = [38.9072, -77.0369];
// // var latlng = [41.8818, -87.6232]
// var latlng = [parseFloat(lat), parseFloat(lng)];

// function makeMyRequest(latlng) {

//   var myRequest;

//   myRequest = {
//     'tag': 'buildings',
//     'rect': getBoundingBox(latlng, 9)
//   };
//   return myRequest;
// };

// var myRequest = makeMyRequest(latlng);

// var photoOptions = {
//   'width': 250,
//   'height': 250
// };

// var wapiblock = document.getElementById('wapiblock');
// var widget = new panoramio.PhotoWidget(wapiblock, myRequest, photoOptions);
// widget.setPosition(0);

// }