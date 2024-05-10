// Assuming you're using Stimulus.js
import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });

    // Listen for changes in the DOM
    this.element.addEventListener('cars:new', event => {
      const { car } = event.detail;
      if (car.address) {
        // Geocode the address and add a marker to the map
        this.geocodeAndAddMarker(car.address);
      }
    });

    // Add markers for existing cars
    this.markersValue.forEach(marker => this.addMarker(marker));

    // Fit the map to markers
    this.fitMapToMarkers();
  }

  geocodeAndAddMarker(address) {
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(address)}.json?access_token=${this.apiKeyValue}`)
      .then(response => response.json())
      .then(data => {
        if (data.features && data.features.length > 0) {
          const [lng, lat] = data.features[0].center;
          this.addMarker({ lng, lat });
        }
      })
      .catch(error => console.error('Error geocoding address:', error));
  }

  addMarker({ lng, lat }) {
    new mapboxgl.Marker()
      .setLngLat([lng, lat])
      .addTo(this.map);
  }

  fitMapToMarkers() {
    if (this.markersValue.length > 0) {
      const bounds = new mapboxgl.LngLatBounds();
      this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    }
  }
}
