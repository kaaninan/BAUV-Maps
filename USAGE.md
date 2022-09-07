# Usage

## Run Server with Docker

**Step 1:** Install Docker

Install Docker Engine from [here](https://www.docker.com).

**Step 2:** Get GitHub repository

```bash
git clone --depth 1 git@github.com:kaaninan/BAUV-Maps.git
cd BAUV-Maps
```

**Step 3:** Build the docker image with the following command:

```bash
docker build -t mapserver .****
```

*Note: Add ```--platform linux/amd64``` option if using Apple M1.*

**Step 4:** Run the docker image with the following command:

```bash
docker run -d -p 8000:8000 -p 8001:8001 --restart always mapserver
```

To see the map previews, go to [http://localhost:8000](http://localhost:8000), change localhost to your server IP address if you are running the server on a remote server.

To see docker logs, run the following command:

```bash
docker logs -f containerID
```

### Included Maps
| Name               | Description                   | Type   | Style |
| :----------------- | :---------------------------- | :----- | :---- |
| turkey-osm.mbtiles | OpenStreetMap data for Turkey | Vector | yes   |
| TR402921.mbtiles   | Istanbul Bosphorus            | Vector | no    |
| G1111_1.mbtiles    | Istanbul Bosphorus            | Raster | no    |

### Ports
| Port | Description                               | Tool          |
| :--- | :---------------------------------------- | :------------ |
| 8000 | Tile server for mbtiles, styles and fonts | tileserver-gl |
| 8001 | SVG files for Nautical Maps               | express       |

### Edit Maps and styles

You can edit the maps and styles in the ```src/tileserver/tilesets``` and ```src/tileserver/styles``` folder.

### Adding Nautical Maps

You can add nautical maps in the ```src/tileserver/tilesets``` folder. The maps should be in the ```.mbtiles``` format.

Then, you should edit the ```src/tileserver/config.json``` file. Add the following line to the ```tilesets``` array:

```json
"data": {
    "turkey-osm": {
        "mbtiles": "turkey-osm.mbtiles"
    },
    // Add the following lines
    "your-map-id": { 
        "mbtiles": "your-map.mbtiles"
    }
    // End of the lines
}
```

After adding the map, you should rebuild the docker image and run it again.

### IP Address Declaration

If you want to use a different IP address or domain, you can change the IP address in the following files:

- ```src/tileserver/styles/*.json```
- ```src/tileserver/config.json```
- ```src/index.js```


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
| ├── config-example.json |
| ├---------------------n |
| ├── process-example.lua |
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