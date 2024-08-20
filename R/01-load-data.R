
## TREE DATA ######
tree_init <- read_xlsx("data-source/LEAF/tree_data2016_21_LEAF.xlsx", sheet = "Sheet1")

tree_init
names(tree_init)
summary(tree_init)

length(unique(tree_init$FID_tree_d))
length(unique(tree_init$S_N_))
length(unique(tree_init$Plot_id))

## EQUATIONS ######
eq_init <- read_csv(file.path(path_leaf, "Equations.csv"))

# tibble(
#   id = c(1, 2),
#   equation = c(1, 1),
#   number  = c(1, 2),
#   genus = c("Abies", "Acacia"),
#   species = c("Abies pindrow", "Acacia catechu"),
#   local_name = c("Gobre salla")
# )

## NEPAL Country boundaries ######
sf_nepal <- read_sf("data-source/spatial/gadm41_NPL_0.json")



