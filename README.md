# Nautical Maps

## Usage
See the [USAGE.md](USAGE.md) file for usage instructions.

## FAQ
See the [FAQ.md](FAQ.md) file for frequently asked questions.

## Introduction
![Nautical Chart](https://oceanservice.noaa.gov/facts/nautical_chart.jpg)
A nautical chart is one of the most fundamental tools available to the mariner. It is a map that depicts the configuration of the shoreline and seafloor. It provides water depths, locations of dangers to navigation, locations and characteristics of aids to navigation, anchorages, and other features. [[1]](https://oceanservice.noaa.gov/facts/nautical_chart.html)

----
## Abbreviations

**GIS:** A geographic information system (GIS) is a system that creates, manages, analyzes, and maps all types of data. 
**NOAA:** National Oceanic and Atmospheric Administration

----
## Online Nautical Map Viewers

- [OpenSeaMap](https://map.openseamap.org) (Raster Tile)
- [C-MAP](https://appchart.c-map.com/core/map) (Raster Tile)
- [GPS Nautical Charts](https://fishing-app.gpsnauticalcharts.com/i-boating-fishing-web-app/fishing-marine-charts-navigation.html) (Vector Tile)
- [Open Nautical Chart](http://opennauticalchart.org) (Raster Tile)
- [Navionics](https://webapp.navionics.com) (Raster Tile)

----
## Web Libraries for Interactive Maps

- [MapBox](https://www.mapbox.com)
  - *Mapbox is a company that provides map services and technology - one of those services, Map tiles, can be used in Leaflet as base maps - same as you'd use Google Map tiles in the Google Maps API. Mapbox also develops a Leaflet plugin called Mapbox.js that makes it simple to integrate with their tiles while still using all of the great functionality in Leaflet. We also support Leaflet's development, since the maintainer works here.*

- [MapLibre](https://maplibre.org)
  - *MapLibre is an open source alternative to Mapbox. MapLibre is a community-governed collection of open source mapping libraries. As a community, we believe in building and maintaining freely licensed libraries that enable developers worldwide to build vital tools using maps.*

- [Leaflet](https://leafletjs.com)
  - *Leaflet is a JavaScript API for making maps interactive on the internet. It can integrate with Mapbox, but also plenty of other tile sources, like OpenStreetMap, and other data sources, like GeoJSON overlays.*

- [OpenLayers](https://openlayers.org)
  - *OpenLayers is an open source JavaScript library used for displaying map data in web browsers. It allows putting dynamic maps in web pages. OpenLayers can display map tiles, vector data and markers loaded from any source. Additionally, it provides API for building rich web-based geographic applications.*

*Note: [Comparison Blog](https://bachasoftware.com/custom-software-development/)*


----
## Nautical Map Sources

- [NOAA Charts](https://www.charts.noaa.gov/InteractiveCatalog/nrnc.shtml)
- [Nautical Charts Online](https://www.nauticalchartsonline.com)
- [o-charts](https://o-charts.org/index.html?lng=)
- [Chart World](https://www.chartworld.com/shop)
- [OpenCPN Sources](https://opencpn.org/OpenCPN/info/chartsource.html)
- [GeoFabrik](http://download.geofabrik.de)
- [OSM QA Titles](http://osmlab.github.io/osm-qa-tiles/)
- [OpenStreetMap Data](https://export.hotosm.org/en/v3/)
- [OpenSeaMap](https://ftp.gwdg.de/pub/misc/openstreetmap/openseamap/charts/kap/)

----

## Map Programs
- [QGIS](https://www.qgis.org/en/site/)
  - *Create, edit, visualise, analyse and publish geospatial information on Windows, Mac, Linux, BSD and mobile devices*
- [OpenCPN](https://opencpn.org)
  - *Chart Plotter and Navigational software program for use underway
or as a planning tool.*
- [GDAL](https://gdal.org)
  - *GDAL is a translator library for raster and vector geospatial data formats.*
  - Download GDAL Complete [Link 1](https://sandbox.idre.ucla.edu/sandbox/general/how-to-install-and-run-gdal) or [Link 2](http://www.kyngchaos.com/software/frameworks/#gdal_complete)
- [ArcGIS](https://www.arcgis.com) (Paid)
- [MapShaper](https://mapshaper.org)
- [Maperitive](http://maperitive.net/docs/default.html)
- [Tilemill](https://tilemill-project.github.io/tilemill) (Deprecated)

----
## Map Design Tools

- [MapBox Studio](https://www.mapbox.com) (Paid)
- [MapTiler](https://www.maptiler.com) (Paid)
- [OpenMapTiles](https://openmaptiles.org) (Open Source)

----
## Map Servers

Servers for sharing geospatial data.

- [GeoServer](https://geoserver.org)
- [mapnik](https://mapnik.org)
- [MapServer](https://mapserver.org)
- [tilelive](https://github.com/mapbox/tilelive)
- [mbview](https://github.com/mapbox/mbview)
- [tileserver-gl](https://github.com/maptiler/tileserver-gl)

Examples 
  - https://gis.stackexchange.com/questions/125037/self-hosting-mapbox-vector-tiles
  - https://github.com/consbio/mbtileserver

----

## Map Formats

- **BSB – Maptech/NOAA BSB Nautical Chart Format (Raster Tiles)**
KAP-charts are raster navigational charts (RNC),

- **S57 ENC (Vector Tiles)**
International Hydrographic Organisation (IHO) S-57 Electronic Navigation Charts (ENC) datasets are supported for read access.
Individual S57 data files have an extension of *.000
  - https://www.shodb.gov.tr/shodb_esas/index.php/tr/urunler/haritalar/elektronik-seyir-haritalari
  - https://gdal.org/drivers/vector/s57.html
  - https://mapserver.org/input/vector/S57.html
  - http://www.teledynecaris.com/S-57/frames/S57catalog.htm
  - https://iho.int/iho_pubs/standard/S-57Ed3.1/S-57%20Appendix%20B.1%20Annex%20A%20UOC%20Edition%204.1.0_Jan18_EN.pdf
  - https://link.springer.com/content/pdf/bbm:978-94-011-7370-4/1.pdf
  - https://iho.int/iho_pubs/standard/S-4/S4_V4-8-0_Oct_2018_EN.pdf
  - https://iho.int/uploads/user/pubs/standards/s-52/S-52%20PresLib%20Ed%204.0.3%20Part%20I%20Addendum_Clean.pdf

- **S-63 (encryption standard)**
  - https://en.wikipedia.org/wiki/S-63_(encryption_standard)
  - https://o-charts.org/manuals/s63_index.php
  - https://metanorma.github.io/mn-samples-iho/documents/s63/document.html

- **MBTiles (Raster Tiles)**
MBTiles is a file format for storing map tiles in a single file. It is, technically, a SQLite database.
  - https://gdal.org/drivers/raster/mbtiles.html
  - https://wiki.openstreetmap.org/wiki/MBTiles

----

## Map Styles

- OpenStreetMaps
  - [OpenMapTiles](https://openmaptiles.org/styles/) (For OpenStreetMaps)
- S-57
  - [OpenCPN](https://github.com/OpenCPN/OpenCPN/tree/master/data/s57data)
  - https://msi.nga.mil/Publications/Chart1
  - https://www.charts.gc.ca/publications/chart1-carte1/sections/l-offsho/submarinepipelines-eng.html

----
## Raster vs Vector Tiles

**Raster map tiles**
Raster map tiles are actually nothing else than raster images. Zoomable raster maps consist of many raster map tiles (in the .png or .jpg format) placed next to each other, ordered in a pyramid scheme.

**Vector map tiles**
Vector tiles were introduced later, they also deliver data which are divided into roughly squared tiles. But these tiles do not consist of raster images, they are made of mathematical interpretations of geometric features such as points, curves or polygons.

[Reference](https://documentation.maptiler.com/hc/en-us/articles/4411234458385-Raster-vs-Vector-Map-Tiles-What-Is-the-Difference-Between-the-Two-Data-Types-)

----
## Translate Formats

- QGIS software could be used to translate formats.
- https://openmaptiles.org/docs/generate/custom-vector-from-shapefile-geojson/

- Extract SOUNDG (water depth) from S57
  - ogr2ogr -f "geojson" -oo SPLIT_MULTIPOINT=ON -oo ADD_SOUNDG_DEPTH=ON soundings.geojson 1R76W7RI.000 SOUNDG
  - SRC: https://www.cruisersforum.com/forums/f134/depth-soundings-in-vector-charts-192630.html#post3118697

- Utility to convert data from S57 to a structured PostGIS database
https://github.com/nextgis/navi2pg

- OpenStreetMaps to MBTiles and Map Server
  - (osm.pbf to mbtiles with tilemaker) https://blog.kleunen.nl/blog/tilemaker-generate-map
  - https://github.com/systemed/tilemaker
  - ```
    tilemaker --input turkey-latest.osm.pbf --output turkey.mbtiles --process resources/process-openmaptiles.lua --config resources/config-openmaptiles.json
    ```

- GeoJSON to MBTiles
  - https://github.com/mapbox/tippecanoe

- https://stackoverflow.com/questions/16968121/generate-maptiles-from-bsb-kap-files-using-gdal2tiles

- https://github.com/vokkim/finnish-nautical-chart-vectors

- https://stackoverflow.com/questions/41030276/how-to-export-a-mapbox-studio-map-as-mbtiles-file

- https://www.statsilk.com/maps/convert-esri-shapefile-map-geojson-format

- https://www.gisci.org/Portals/0/2022%20Map%20Contest/comp.pdf?ver=t5pKh8SpEXyjhlPfzXeEUQ%3D%3D

- Ogre is a web client (service) that translates spatial files into GeoJSON using the ogr2ogr command line tool for use in web applications and frameworks.
https://ogre.adc4gis.com

- S57 stores both data and symbology in the same format while shapefiles only store the data. So infact the depth information is present in the shapefile, what is missing are the instructions to display that number as text and a dot (or whatever S57 uses for depth points) - thus ArcMap or QGis will just display the point by default. You will need to add some styling information to tell the program to display a text label (based on the depth value) next to the point.
https://gis.stackexchange.com/a/168963

- ```gdal_translate -of GTiff PARAmap1.pdf out1File.tif --config GDAL_PDF_DPI 300```
    - https://gis.stackexchange.com/a/130106

----

## Useful Links

- https://github.com/mapbox/awesome-vector-tiles
- https://wiki.openstreetmap.org/wiki/Software_libraries
- https://en.ppt-online.org/1003476
- https://github.com/alukach/s57-vector-tile-server/blob/master/readme.md
- https://www.crunchydata.com/blog/dynamic-vector-tiles-from-postgis
- https://github.com/faunalia/qnavigate/blob/master/README.md 
- https://github.com/sduclos/S52
- https://github.com/mapbox/mbview/blob/master/mbview.js (Example mbtiles server)
- https://maplibre.org/maplibre-gl-js-docs/example/local-geojson/ (Add geojson to map)

----
## Create Map Sprites from SVGs

https://github.com/mapbox/spritezero
```
nvm install 6.17.1
nvm use 6.17.1
npm install -g @mapbox/spritezero-cli
```
see: https://github.com/mapbox/spritezero/issues/84#issuecomment-656327476

> tileserver-gl has a problem with serving sprites. So we need to use express for serving the sprites.

- https://stackoverflow.com/questions/63816659/drawing-s57-symbols-onto-leaflet-or-openlayers-map
- https://www.geomatys.com/2016/04/07/between-gis-and-ecdis-s-57-and-s-52-for-marine-and-military-fields/
