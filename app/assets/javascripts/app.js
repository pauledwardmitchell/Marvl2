
// loop through array of locations that came back from db... build var locations
  //create var for stringed address... need this to pass into code address fn

// create a marker for each location "(codeAddress function?)"

// push marker into markers array
// display markers on map
// make infowindow for each marker - display on click


// $(document).ready(function(){

 
// });
  
  var map;
  var geocoder;
  
  var markers = [];

  var allLocations = getLocations()

  function initMap() {
    // Constructor creates a new map - only center and zoom are required.
    map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 38.889330, lng: -77.035981},
          zoom: 10
    });

    geocoder = new google.maps.Geocoder();

    
    // var locations = [
    //   {title: 'Park Ave Penthouse', location: {lat: 40.7713024, lng: -73.9632393}},
    //   {title: 'Chelsea Loft', location: {lat: 40.7444883, lng: -73.9949465}},
    //   {title: 'Union Square Open Floor Plan', location: {lat: 40.7347062, lng: -73.9895759}},
    //   {title: 'East Village Hip Studio', location: {lat: 40.7281777, lng: -73.984377}},
    //   {title: 'TriBeCa Artsy Bachelor Pad', location: {lat: 40.7195264, lng: -74.0089934}},
    //   {title: 'Chinatown Homey Space', location: {lat: 40.7180628, lng: -73.9961237}}
    // ];
        
      //   var largeInfowindow = new google.maps.InfoWindow();
        
      //   var bounds = new google.maps.LatLngBounds();
      //   // The following group uses the location array to create an array of markers on initialize.
      //   for (var i = 0; i < allLocations.length; i++) {
      //     // Get the position from the location array.
          
      //     codeAddress(allLocations[i])


      //     var position = locations[i].location;
      //     var title = locations[i].title;
      //     // Create a marker per location, and put into markers array.
      //     var marker = new google.maps.Marker({
      //       map: map,
      //       position: position,
      //       title: title,
      //       animation: google.maps.Animation.DROP,
      //       id: i
      //     });
      //     // Push the marker to our array of markers.
      //     markers.push(marker);
      //     // Create an onclick event to open an infowindow at each marker.
      //     marker.addListener('click', function() {
      //       populateInfoWindow(this, largeInfowindow);
      //     });
      //     bounds.extend(markers[i].position);
      //   }
      //   // Extend the boundaries of the map for each marker
      //   map.fitBounds(bounds);
      // }




      // This function populates the infowindow when the marker is clicked. We'll only allow
      // one infowindow which will open at the marker that is clicked, and populate based
      // on that markers position.
      // function populateInfoWindow(marker, infowindow) {
      //   // Check to make sure the infowindow is not already opened on this marker.
      //   if (infowindow.marker != marker) {
      //     infowindow.marker = marker;
      //     infowindow.setContent('<div>' + marker.title + '</div>');
      //     infowindow.open(map, marker);
      //     // Make sure the marker property is cleared if the infowindow is closed.
      //     infowindow.addListener('closeclick',function(){
      //       infowindow.setMarker(null);
      //     });
      //   }



codeAddress(allLocations[0][0]);
codeAddress(allLocations[0][1]);

      }
// console.log(codeAddress("5625 Shaddelee Ln. W., Fort Myers, FL, 33919"));
// debugger
//     function codeAddress(address) {
//       var addressLatLng = []

//     geocoder.geocode( { 'address': address}, function(results, status) {
//       if (status == 'OK') {
//         addressLatLng = results[0].geometry.location;
//         debugger
//         map.setCenter(results[0].geometry.location);
//         var marker = new google.maps.Marker({
//             map: map,
//             position: results[0].geometry.location
//         });
//       } else {
//         alert('Geocode was not successful for the following reason: ' + status);
//       }
//       return addressLatLng;
//     });

//     return addressLatLng;
//   }

// console.log(codeAddress("8900 Georgia Ave, Silver Spring, MD, 20910"));

    function codeAddress(locationObject) {
      var address = locationObject.street_address + ", " + locationObject.city + ", " + locationObject.state + ", " + locationObject.zip_code
      geocoder.geocode( { 'address': address }, function(results) {
        // if (status == 'OK') {
          addressLatLng = results[0].geometry.location;
          map.setCenter(addressLatLng);
          var marker = new google.maps.Marker({
              map: map,
              title: locationObject.name,
              position: addressLatLng
          });
          markers.push(marker);

      });
    }


    function fetchLocationsData() {
      return $.ajax({url: 'locations/all', method: 'GET', dataType: 'json'});
    }

    function getLocations() {
      var locations = []
      fetchLocationsData().done(function(response){  
      locations.push(response)
      });
      return locations
    }




