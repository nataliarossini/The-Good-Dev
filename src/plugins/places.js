var places = require('places.js');
var placesAutocomplete = places({
  appId: 'JS5D68P1GR',
  apiKey: 'd7f92dd7ca77bdce58600a2b12b11dd8',
  container: document.querySelector('#address-input')
});
export { placesAutocomplete };
