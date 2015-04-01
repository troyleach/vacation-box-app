// var loc = new google.maps.LatLng(41.8818, -87.6232);
// // var loc = new google.maps.LatLng(coords.latitude, coords.longitude);
// var map = new google.maps.Map(document.getElementById("map-canvas-interests"), {
//               mapTypeId: google.maps.MapTypeId.ROADMAP,
//               center: loc,
//               zoom: 13
// });


// var resultList = [];
// var service = new google.maps.places.PlacesService(map);  
// var request = {
//     location: map.getCenter(),
//     radius: '9000',
//     query: <search string>            
// };

// service.textSearch(request, function(results, status, pagination){
//     if (status == google.maps.places.PlacesServiceStatus.OK) {
//         resultList = resultList.concat(results);
//         plotResultList();
//     }
// });