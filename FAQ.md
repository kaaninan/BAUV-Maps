# F.A.Q.

### 1. What we have?
The nautical maps that we have are in the following formats:
- S57 format (.000 extension)
- BSB format (.KAP format)

The S-57 format is a vector format and the BSB format is a raster format.

### 2. What software can be used to view these maps?
As open source, [OpenCPN](http://opencpn.org) or [QGIS](http://qgis.org) can be used. You can also view maps with paid software.

*Note: For QDIS, S-57 maps will appear incomplete. The reason for this is that the S-52 symbology is not directly installed in QDIS. See [link](https://www.sigterritoires.fr/index.php/en/displaying-marine-charts-with-s57-qgis/). However, it does not show all layers properly.
OpenCPN must be used to see the maps properly.*

### 3. What we need to use nautical maps to web interface?

- **Map Viewer for Web**
In order to show maps on the web, it is necessary to use a map library, this library should be able to show the map on the web and interact with the map.

- **Format translate tools**
Map libraries support a limited number of formats. We cannot use the maps we have directly in this library. In order to use the maps, we have to translate the format that supported by the library.

- **Map Server**
MapLibre GL cannot directly display the .mbtiles file as a map. MBTiles file needs to be served by a server. For this, we need to use a map server.

- **Style File**
For Vector tiles maps, it is necessary to tell the map how the objects in the layers will look one by one. Since raster tiles are in image format, they do not need a style file.

- **Base Map**
The nautical maps we have can be difficult to use as they only cover certain areas. In this case, we use the OpenStreetMap map as the basemap and show the nautical charts above this basemap.

### Which library we use for web?
We use MapLibre open-source library.

### Which map we use for base map?
We use OpenStreetMap map as a base map. This map is free to use. You can find it [here](https://www.openstreetmap.org/).

### What formats could we use for Map Viewer?
We need a format that supported by MapLibre GL. MapLibre GL supports the following formats:
- GeoJSON
- MBTiles
- [other types](https://maplibre.org/maplibre-gl-js-docs/api/sources/)

### Can it be used as a map only, without nautical maps?
Yes, it can be used instead of Google Maps as it uses OpenStreetMaps.