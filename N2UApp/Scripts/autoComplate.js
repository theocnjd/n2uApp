﻿
// This sample uses the Autocomplete widget to help the user select a
// place, then it retrieves the address components associated with that
// place, and then it populates the form fields with those details.
// This sample requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script
// src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbpMrOCpxEKk6Vv9cQuBQ6cJ-0OcYLNjU&libraries=places">

let placeSearch;
let autocomplete;
let componentForm = {
    street_number: "short_name",
    route: "long_name",
    postal_town: "long_name",
    postal_code: "short_name",
    //administrative_area_level_1: "short_name",
    //administrative_area_level_2: "short_name",
    //locality: "long_name"  
};

function initAutocomplete() {
    // Create the autocomplete object, restricting the search predictions to
    // geographical location types.
    autocomplete = new google.maps.places.Autocomplete(
      document.getElementById("autocomplete"),
      {
          types: ["geocode"]
      }
    ); // Avoid paying for data that you don't need by restricting the set of
    // place fields that are returned to just the address components.

    autocomplete.setFields(["address_component"]); // When the user selects an address from the drop-down, populate the
    // address fields in the form.

    autocomplete.addListener("place_changed", fillInAddress);
}

function fillInAddress() {
    // Get the place details from the autocomplete object.
    let place = autocomplete.getPlace();

    for (let component in componentForm) {
        document.getElementById(component).value = "";
        document.getElementById(component).disabled = false;
    } // Get each component of the address from the place details,
    // and then fill-in the corresponding field on the form.

    for (let component of place.address_components) {
        let addressType = component.types[0];

        if (componentForm[addressType]) {
            let val = component[componentForm[addressType]];
            document.getElementById(addressType).value = val;
        }
    }
} // Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.

function geolocate() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
            let geolocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            let circle = new google.maps.Circle({
                center: geolocation,
                radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
        });
    }
}