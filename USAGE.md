# Usage

## From Scratch

### Prepare Base Map

- Download OpenMapStreet map data from [here](http://download.geofabrik.de). For example the [Turkey map](http://download.geofabrik.de/europe/turkey-latest.osm.pbf).
- We use [tilemaker](https://github.com/systemed/tilemaker) for making vector tiles from the map data (osm.pbf).
- Download tilemaker prebuild binaries from [here](https://github.com/systemed/tilemaker/releases/latest).
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