

tree |> 
  filter(plot_id_new == vec_plot_manytrees) |>
  ggplot() +
  geom_point(aes(x = tree_distance, y = tree_azimuth))

gg <- tree |> 
  filter(plot_id_new == vec_plot_manytrees) |>
  ggplot() +
  geom_point(aes(x = tree_distance, y = tree_azimuth, color = tree_dbh_class1, size = tree_dbh_class1)) +
  scale_x_continuous(breaks = c(0, 4, 8, 15, 20)) +
  scale_y_continuous(breaks = c(0, 90, 180, 270), labels = c("N", "E", "S", "W"), limits = c(0, 360)) +
  coord_polar(theta = "y") +
  theme_bw() +
  labs(
    x = "", 
    y = "",
    color = "",
    size = "",
    subtitle = paste0("tree maps for plot: ", vec_plot_manytrees)
  )
print(gg)
