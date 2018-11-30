import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { autocompleteApiGoogleBooks } from '../components/init_autocomplete_api';

initMapbox();

if (document.querySelector('#comic_title') != null) {
  autocompleteApiGoogleBooks();
}

