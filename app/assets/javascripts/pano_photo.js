// function setup() {

// var floor = Math.floor;
// var div = document.getElementById('div-lat-lng');
// var lat = div.getAttribute("lat");
// var lng = div.getAttribute("lng");

// // var lat = 38.9072;
// // var lng = -77.0369;
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

// window.addEventListener('load', setup, false);

// // I moved the boundsbox to its own file in vendor/assets