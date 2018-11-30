import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { autocompleteApiGoogleBooks } from '../components/init_autocomplete_api';
import { toggleMsgBox } from '../components/init_toggle_msg';


initMapbox();

if (document.querySelector('#comic_title') != null) {
  autocompleteApiGoogleBooks();
};

if (document.querySelector('#button-msg-box') != null) {
  toggleMsgBox();
};
toggleMsgBox();

