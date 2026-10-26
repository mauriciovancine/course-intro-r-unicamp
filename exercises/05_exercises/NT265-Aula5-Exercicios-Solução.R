#' ----
#' title: aula 05 - manipulacao de dados em r - tidyverse
#' author: mauricio vancine
#' date: 2025-11-29
#' ----

# pacotes -----------------------------------------------------------------

# pacotes
library(tidyverse)
library(palmerpenguins)

# dados -------------------------------------------------------------------

# dados
head(penguins)
head(penguins_raw)

# readr, readxl e writexl -------------------------------------------------

## exercicio 01 ----
# exporte os dados 'penguins' no formato .csv e depois importe novamente
readr::write_csv(penguins, "penguins.csv")
dados_csv <- readr::read_csv("penguins.csv")
head(dados_csv)

## exercicio 02 ----
# exporte os dados 'penguins' no formato .xlsx e depois importe novamente
writexl::write_xlsx(penguins, "penguins.xlsx")
dados_excel <- readxl::read_excel("penguins.xlsx")
head(dados_excel)

## exercicio 03 ----
# exporte os dados 'penguins' no formato .csv, selecionando apenas as colunas species, island e body_mass_g
penguins %>%
    dplyr::select(species, island, body_mass_g) %>%
    readr::write_csv("penguins_subset.csv")

# tibble ------------------------------------------------------------------

## exercicio 04 ----
# crie um tibble usando a função tibble::tibble() com uma coluna sendo o nome das espécies e 
# a outra sendo o número de indivíduos por espécie
# dica: use um table() para saber número de indivíduos por espécie
table(penguins$species)

meu_tibble <- tibble::tibble(
    especie = unique(penguins$species),
    individuos = c(152, 68, 124))
meu_tibble

# maggriter ---------------------------------------------------------------

## exercicio 05 ----
# add uma coluna de ids ao dado 'penguins' usando a funcao tibble::rowid_to_column()
penguins %>%
  tibble::rowid_to_column()

# tidyr -------------------------------------------------------------------

## exercicio 06 ----
# remova as linhas com NAs das colunas 'bill_length_mm', 'bill_depth_mm', 'flipper_length_mm' e 'body_mass_g'
penguins %>%
    tidyr::drop_na(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g)

## exercicio 07 ----
# reorganize as colunas de especies, comprimento de asa e comprimento do bico 
# para o formato de dados longo (long)
# dica use: select para selecionar apenas as colunas de interesse
penguins %>%
  dplyr::select(species, flipper_length_mm, bill_length_mm) %>% 
    tidyr::pivot_longer(
      cols = c(flipper_length_mm, bill_length_mm),
      names_to = "medidas",
      values_to = "valores")

# dplyr -------------------------------------------------------------------

## exercicio 08 ----
# filtre as linhas de 'penguins' da ilha Dream e ordene pela massa
penguins %>%
    dplyr::filter(island == "Dream") %>%
    dplyr::arrange(desc(body_mass_g)) %>%
    head()

## exercicio 09 ----
# crie uma variável de massa corporal em kg
# dica: dplyr::mutate()
penguins %>%
    dplyr::mutate(body_mass_kg = body_mass_g/1000) %>%
    dplyr::select(species, body_mass_g, body_mass_kg) %>%
    head()

## exercicio 10 ----
# calcule a média e o desvio-padrão da massa por espécie
# dica: dplyr::group_by() e dplyr::summarise()
penguins %>%
    dplyr::group_by(species) %>%
    dplyr::summarise(
        media = mean(body_mass_g, na.rm = TRUE),
        desvio = sd(body_mass_g, na.rm = TRUE))

## exercicio 11 ----
# selecione todas as colunas que terminam com "_mm". 
# dica: dplyr::select() e ends_with()
penguins %>%
    dplyr::select(ends_with("_mm")) %>%
    head()

# stringr -----------------------------------------------------------------

## exercicio 12 ---- 
# padronize o nome das ilhas para minúsculas
# dica: stringr::str_to_lower()
stringr::str_to_lower(unique(penguins$island))

## exercicio 13 ----
# quais colunas possuem nome com "_mm". 
# dica: stringr::str_subset()
stringr::str_subset(colnames(penguins), "mm")

# forcats -----------------------------------------------------------------

## exercicio 14 ----
# mude a ordem dos fatores das especies: Chinstrap, Adelie e Gentoo.
# Dica: dplyr::mutate e forcats::fct_relevel
penguins_relevel <- penguins %>%
    dplyr::mutate(species = forcats::fct_relevel(species, c("Chinstrap", "Adelie", "Gentoo")))
penguins_relevel$species

## exercicio 15 ---- 
# mude a ordem dos fatores das especies: Chinstrap, Adelie e Gentoo.
# Dica: dplyr::mutate e forcats::fct_relevel
penguins %>%
    dplyr::mutate(island_fact = forcats::fct_lump_lowfreq(island, other_level = "Outras")) %>% 
    dplyr::count(island_fact)

# lubridate ---------------------------------------------------------------

## exercicio 16 ---- 
# mude a ordem dos fatores das especies: Chinstrap, Adelie e Gentoo.
# Dica: dplyr::mutate e forcats::fct_relevel
lubridate::month(penguins_raw$`Date Egg`, label = TRUE)
lubridate::year(penguins_raw$`Date Egg`)

## exercicio 17 ---- 
# mude a ordem dos fatores das especies: Chinstrap, Adelie e Gentoo.
# Dica: dplyr::mutate e forcats::fct_relevel
set.seed(123)
penguins_datas <- penguins %>%
    dplyr::mutate(data_random = today() + days(sample(0:100, nrow(penguins), replace = TRUE)))
penguins_datas$data_random

# purrr -------------------------------------------------------------------

## exercicio 18 ----
# mude a ordem dos fatores das especies: Chinstrap, Adelie e Gentoo.
# Dica: dplyr::mutate e forcats::fct_relevel
listas_massa <- split(penguins$body_mass_g, penguins$species)
purrr::map(listas_massa, mean, na.rm = TRUE)

## exercicio 19 ----
# mude a ordem dos fatores das especies: Chinstrap, Adelie e Gentoo.
# Dica: dplyr::mutate e forcats::fct_relevel
purrr::map_df(listas_massa, sd, na.rm = TRUE)

# desafio -----------------------------------------------------------------

## exercicio 20 ---- 
# mude a ordem dos fatores das especies: Chinstrap, Adelie e Gentoo.
# Dica: dplyr::mutate e forcats::fct_relevel
penguins %>%
    dplyr::group_by(island) %>%
    dplyr::summarise(media_massa = mean(body_mass_g, na.rm = TRUE)) %>%
    writexl::write_xlsx("media_massa_ilha.xlsx")

readxl::read_excel("media_massa_ilha.xlsx")

# end ---------------------------------------------------------------------