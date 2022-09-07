# Usage

## Run Server with Docker (WIP)

Use Dockerfile for creating a docker image for tileserver-gl and express. 

Step 1: Create mbtiles maps and put them in the same directory with the Dockerfile.
Step 2: Build the docker image with the following command:

```bash
docker build -t map .
```

Step 3: Run the docker image with the following command:

```bash
docker run -p 8080:8080 map
```

Step 4: Open the following link in your browser: http://localhost:8080


----
## From Scratch

### Prepare Base Map

- Download OpenStreetMaps data from [here](http://download.geofabrik.de). For example the [Turkey map](http://download.geofabrik.de/europe/turkey-latest.osm.pbf).
- Use [tilemaker](https://github.com/systemed/tilemaker) for making vector tiles from the map data (osm.pbf). Download tilemaker prebuild binaries from [here](https://github.com/systemed/tilemaker/releases/tag/v2.2.0).
- For include sea tiles, create a directory called coastline in the same place you're running tilemaker from, and then save the files from https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip in it, such that tilemaker can find a file at coastline/water_polygons.shp
- Directory structure should be as follows:

```
map
├── coastline
│   └── ...
├── build
│   └── tilemaker
├── resources
|   ├── config-example.json
|   ├── config-openmaptiles.json
|   ├── process-example.lua
│   └── process-openmaptiles.lua
└── turkey-latest.osm.pbf
```

- Convert the map data to vector tiles with the following command:

```bash
chmod +x build/tilemaker  
./build/tilemaker --input turkey-latest.osm.pbf --output turkey.mbtiles --process resources/process-openmaptiles.lua --config resources/config-openmaptiles.json
```

[Reference](https://blog.kleunen.nl/blog/tilemaker-generate-map)

----
### Prepare Nautical Maps

Prerequisites:
- GDAL 3

#### Raster Maps (BSB format)
First, convert to GTiff format so QGIS can read it. Then, convert to MBTiles format so MapLibre GL can read it.

```bash
gdal_translate -of GTiff -expand rgba MAP.KAP out.tif
```

Then, use QGIS to convert the BSB format to MBTiles format.

TODO: add screenshot

#### Vector Maps (S57 format)
ogr2ogr is a command line tool to convert simple features data between file formats. It is part of the GDAL project. It is used to convert the S57 format to MBTiles format. Depth data included.

```bash
ogr2ogr OUT.mbtiles -f "mbtiles" -oo SPLIT_MULTIPOINT=ON -oo ADD_SOUNDG_DEPTH=ON MAP_NAME.000 -skipfailures -dsco MINZOOM=0 -dsco MAXZOOM=16
```

----
### MBTiles server

#### Overview

For viewing .mbtiles data there are two tools available:
- [tileserver-gl](https://github.com/maptiler/tileserver-gl)
- [mbview](https://github.com/mapbox/mbview) (alternative)

We will use express for serving svg icons for the map.
- [express](https://expressjs.com)

**tileserver-gl**, serves both raster and vector mbtiles and fonts. It supports style files. It can display maps with style files or raw within itself. But it works with a specific node version. (v10.17.0) Use nvm for installing node.

**mbview** uses the MapBox GL JS library to render the tiles. It uses the MapBox Map as the base layer. For this you need to create an account and get an access token. It can be used to quickly look at the mbtiles file. Also, if there is a style file on the web, it can be used as a source of mbview.