# self




# this code gets me all the keys for this look up. but geocde will not do it's thing until a key is provided, but not sure where the key goes... going to try to make a autocomplete bymself, no damn gem.
chi = Unirest.get("http://maps.googleapis.com/maps/api/geocode/json?latlng=41.8818,-87.6232").body["results"]
p chi.class
chi.each do |key|
  puts key["place_id"]
end


# => weather app embed
<iframe id="forecast_embed" class="weather_iframe" type="text/html" frameborder="0" height="60" width="100%" src="http://forecast.io/embed/#lat=<%= @profile.latitude %>&lon=<%= @profile.longitude %>&name=<%= @profile.locality %>"> </iframe>


def dayOfWeek
  day.each do |day|
  end
end

def convertSeconds(seconds)
  convertToDay(Time.at(seconds))
end

def convertToDay(the_object)
  the_object.strftime("%A")
end


puts convertSeconds(1426737600) 

# theDay = Time.at(t)

# puts theDay
# # => 2015-03-18 23:00:00 -0500
# theDay.strftime("%A")
# # => "Wednesday"

# cc.keys
# # => ["latitude", "longitude", "timezone", "offset", "currently", "minutely", "hourly", "daily", "flags"]

# day = cc["daily"]

# day.keys
# # =>  ["summary", "icon", "data"] 


# day = day["data"]
# theday = day[7]["time"]

# GOOGLE MAPS****** ********************
#{@profile.latitude},#{@profile.longitude}
map with denver marker

"http://maps.google.com/maps/api/staticmap?center=39.739236,-104.990251&markers=<%= @profile.latitude %>,<%= @profile.longitude %>|39.739236,-104.990251|40.792240,-73.138260&size=750x300"

@places_been = "http://maps.google.com/maps/api/staticmap?center=#{@profile.latitude},#{@profile.longitude}&markers=color:yellow|label:#{@first_init}|#{@profile.latitude},#{@profile.longitude}|39.739236,-104.990251|40.792240,-73.138260|-33.918861,18.423300&size=750x300"

take out the zoom and it will zoom to see the two markers

url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur)


http://maps.googleapis.com/maps/api/staticmap?center=denver+co&zoom=13&scale=false&size=600x300&maptype=roadmap&format=png&visual_refresh=true&markers=size:small%7Ccolor:red%7Clabel:1%7Cdenver+co

#-----------------------------------------------------------------
# THIS IS THE LODING JS CODE UNCHNAGED
// This example uses the autocomplete feature of the Google Places API.
// It allows the user to find all hotels in a given place, within a given
// country. It then displays markers for all the hotels returned,
// with on-click details for each hotel.

var lodgingMap, places, infoWindow;
var markers = [];
var autocomplete;
var countryRestrict = { 'country': 'us' };
var MARKER_PATH = 'https://maps.gstatic.com/intl/en_us/mapfiles/marker_green';
var hostnameRegexp = new RegExp('^https?://.+?/');

var placeType = {
  'types': ['lodging']
}

var countries = {
  'au': {
    center: new google.maps.LatLng(-25.3, 133.8),
    zoom: 4
  },
  'br': {
    center: new google.maps.LatLng(-14.2, -51.9),
    zoom: 3
  },
  'ca': {
    center: new google.maps.LatLng(62, -110.0),
    zoom: 3
  },
  'fr': {
    center: new google.maps.LatLng(46.2, 2.2),
    zoom: 5
  },
  'de': {
    center: new google.maps.LatLng(51.2, 10.4),
    zoom: 5
  },
  'mx': {
    center: new google.maps.LatLng(23.6, -102.5),
    zoom: 4
  },
  'nz': {
    center: new google.maps.LatLng(-40.9, 174.9),
    zoom: 5
  },
  'it': {
    center: new google.maps.LatLng(41.9, 12.6),
    zoom: 5
  },
  'za': {
    center: new google.maps.LatLng(-30.6, 22.9),
    zoom: 5
  },
  'es': {
    center: new google.maps.LatLng(40.5, -3.7),
    zoom: 5
  },
  'pt': {
    center: new google.maps.LatLng(39.4, -8.2),
    zoom: 6
  },
  'us': {
    center: new google.maps.LatLng(37.1, -95.7),
    zoom: 3
  },
  'uk': {
    center: new google.maps.LatLng(54.8, -4.6),
    zoom: 5
  }
};

function initialize() {
  var myOptions = {
    zoom: countries['us'].zoom,
    center: countries['us'].center,
    mapTypeControl: false,
    panControl: false,
    zoomControl: false,
    streetViewControl: false
  };

  lodgingMap = new google.maps.Map(document.getElementById('map-canvas-lodging'), myOptions);

  infoWindow = new google.maps.InfoWindow({
      content: document.getElementById('info-content')
      });

  // Create the autocomplete object and associate it with the UI input control.
  // Restrict the search to the default country, and to place type "cities".
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
      {
        types: ['(cities)'],
        componentRestrictions: countryRestrict
      });
  places = new google.maps.places.PlacesService(lodgingMap);

  google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);

  // Add a DOM event listener to react when the user selects a country.
  google.maps.event.addDomListener(document.getElementById('country'), 'change',
      setAutocompleteCountry);
}

// When the user selects a city, get the place details for the city and
// zoom the map in on the city.
function onPlaceChanged() {
  var place = autocomplete.getPlace();
  if (place.geometry) {
    lodgingMap.panTo(place.geometry.location);
    lodgingMap.setZoom(15);
    search();
  } else {
    document.getElementById('autocomplete').placeholder = 'Enter a city';
  }

}

// Search for hotels in the selected city, within the viewport of the map.
function search() {
  var search = {
    bounds: lodgingMap.getBounds(),
    types: ['lodging']
  };

  places.nearbySearch(search, function(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      clearResults();
      clearMarkers();
      // Create a marker for each hotel found, and
      // assign a letter of the alphabetic to each marker icon.
      for (var i = 0; i < results.length; i++) {
        var markerLetter = String.fromCharCode('A'.charCodeAt(0) + i);
        var markerIcon = MARKER_PATH + markerLetter + '.png';
        // Use marker animation to drop the icons incrementally on the map.
        markers[i] = new google.maps.Marker({
          position: results[i].geometry.location,
          animation: google.maps.Animation.DROP,
          icon: markerIcon
        });
        // If the user clicks a hotel marker, show the details of that hotel
        // in an info window.
        markers[i].placeResult = results[i];
        google.maps.event.addListener(markers[i], 'click', showInfoWindow);
        setTimeout(dropMarker(i), i * 100);
        addResult(results[i], i);
      }
    }
  });
}

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    if (markers[i]) {
      markers[i].setMap(null);
    }
  }
  markers = [];
}

// [START region_setcountry]
// Set the country restriction based on user input.
// Also center and zoom the map on the given country.
function setAutocompleteCountry() {
  var country = document.getElementById('country').value;
  if (country == 'all') {
    autocomplete.setComponentRestrictions([]);
    lodgingMap.setCenter(new google.maps.LatLng(15, 0));
    lodgingMap.setZoom(2);
  } else {
    autocomplete.setComponentRestrictions({ 'country': country });
    lodgingMap.setCenter(countries[country].center);
    lodgingMap.setZoom(countries[country].zoom);
  }
  clearResults();
  clearMarkers();
}
// [END region_setcountry]

function dropMarker(i) {
  return function() {
    markers[i].setMap(lodgingMap);
  };
}

function addResult(result, i) {
  var results = document.getElementById('results');
  var markerLetter = String.fromCharCode('A'.charCodeAt(0) + i);
  var markerIcon = MARKER_PATH + markerLetter + '.png';

  var tr = document.createElement('tr');
  tr.style.backgroundColor = (i % 2 == 0 ? '#F0F0F0' : '#FFFFFF');
  tr.onclick = function() {
    google.maps.event.trigger(markers[i], 'click');
  };

  var iconTd = document.createElement('td');
  var nameTd = document.createElement('td');
  var icon = document.createElement('img');
  icon.src = markerIcon;
  icon.setAttribute('class', 'placeIcon');
  icon.setAttribute('className', 'placeIcon');
  var name = document.createTextNode(result.name);
  iconTd.appendChild(icon);
  nameTd.appendChild(name);
  tr.appendChild(iconTd);
  tr.appendChild(nameTd);
  results.appendChild(tr);
}

function clearResults() {
  var results = document.getElementById('results');
  while (results.childNodes[0]) {
    results.removeChild(results.childNodes[0]);
  }
}

// Get the place details for a hotel. Show the information in an info window,
// anchored on the marker for the hotel that the user selected.
function showInfoWindow() {
  var marker = this;
  places.getDetails({placeId: marker.placeResult.place_id},
      function(place, status) {
        if (status != google.maps.places.PlacesServiceStatus.OK) {
          return;
        }
        infoWindow.open(lodgingMap, marker);
        buildIWContent(place);
      });
}

// Load the place information into the HTML elements used by the info window.
function buildIWContent(place) {
  document.getElementById('iw-icon').innerHTML = '<img class="hotelIcon" ' +
      'src="' + place.icon + '"/>';
  document.getElementById('iw-url').innerHTML = '<b><a href="' + place.url +
      '">' + place.name + '</a></b>';
  document.getElementById('iw-address').textContent = place.vicinity;

  if (place.formatted_phone_number) {
    document.getElementById('iw-phone-row').style.display = '';
    document.getElementById('iw-phone').textContent =
        place.formatted_phone_number;
  } else {
    document.getElementById('iw-phone-row').style.display = 'none';
  }

  // Assign a five-star rating to the hotel, using a black star ('&#10029;')
  // to indicate the rating the hotel has earned, and a white star ('&#10025;')
  // for the rating points not achieved.
  if (place.rating) {
    var ratingHtml = '';
    for (var i = 0; i < 5; i++) {
      if (place.rating < (i + 0.5)) {
        ratingHtml += '&#10025;';
      } else {
        ratingHtml += '&#10029;';
      }
    document.getElementById('iw-rating-row').style.display = '';
    document.getElementById('iw-rating').innerHTML = ratingHtml;
    }
  } else {
    document.getElementById('iw-rating-row').style.display = 'none';
  }

  // The regexp isolates the first part of the URL (domain plus subdomain)
  // to give a short URL for displaying in the info window.
  if (place.website) {
    var fullUrl = place.website;
    var website = hostnameRegexp.exec(place.website);
    if (website == null) {
      website = 'http://' + place.website + '/';
      fullUrl = website;
    }
    document.getElementById('iw-website-row').style.display = '';
    document.getElementById('iw-website').textContent = website;
  } else {
    document.getElementById('iw-website-row').style.display = 'none';
  }
}

google.maps.event.addDomListener(window, 'load', initialize);
