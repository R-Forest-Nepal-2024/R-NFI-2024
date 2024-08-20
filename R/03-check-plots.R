
## PLOT LEVEL - mapping ######
## Convert data
sf_plot <- plot |>
  mutate(lon = plot_gps_lon, lat = plot_gps_lat) |>
  st_as_sf(coords = c("lon", "lat"), crs = 4326) 

## Check
ggplot() +
  geom_sf(data = sf_plot)

sf_plot |>
  filter(plot_row == 64, plot_col == 34) |>
  ggplot() +
  geom_sf() +
  geom_sf_text(aes(label = plot_no))

## Interactive map
## Check basemaps here: https://leaflet-extras.github.io/leaflet-providers/preview/
tmap_mode("view")
tm_basemap(c("Esri.WorldGrayCanvas", "Esri.WorldTopoMap", "Esri.WorldImagery")) +
  tm_shape(sf_nepal) +
  tm_borders(col = "red") +
  tm_shape(sf_plot) +
  tm_dots(fill = "plot_physiographic_region", fill.scale = )

## CLUSTER LEVEL ######
sf_cluster <- cluster |>
  mutate(cluster_gps_xx = cluster_gps_x, cluster_gps_yy = cluster_gps_y) |>
  st_as_sf(coords = c("cluster_gps_lon", "cluster_gps_lat"), crs = 4326) 

ggplot() +
  geom_sf(data = sf_nepal, fill = NA) +
  geom_sf(data = sf_cluster, aes(color = cluster_physio)) +
  theme(legend.position = "bottom") +
  labs(
    subtitle = "Cluster location map",
    color = ""
  )


