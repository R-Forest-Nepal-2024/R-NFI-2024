

## Make values for missing species
eq_tarai <- eq |> filter(species_name_combi == "Miscellaneous in Terai")
eq_hill <- eq |> filter(species_name_combi == "Miscellaneous in Hill")

tmp_plot <- plot |> select(plot_id_new, plot_physio)

tmp_tree1 <- tree |>
  left_join(tmp_plot, by = "plot_id_new") |>
  mutate(tree_species_code = as.character(tree_species_code)) |>
  left_join(eq, by = join_by(tree_species_code)) |>
  mutate(
    stem_a = case_when(
    is.na(stem_a) & plot_physio == "Terai" ~ eq_tarai$stem_a,
    is.na(stem_a) & plot_physio != "Churia" ~ eq_hill$stem_a,
    TRUE ~ stem_a
    )
    )

table(tmp_tree1$plot_physio, useNA = "ifany")
summary(tmp_tree1$stem_a)
