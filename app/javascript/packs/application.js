import "bootstrap";
import "controllers"
import 'plugins/flatpickr'
import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})
