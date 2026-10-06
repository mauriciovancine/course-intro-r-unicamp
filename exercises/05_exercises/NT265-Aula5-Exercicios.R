#' ----
#' title: manipulacao de dados em r - tidyverse
#' author: mauricio vancine
#' date: 2025-11-29
#' ----

# pacotes -----------------------------------------------------------------

# pacotes


# dados -------------------------------------------------------------------

# dados
# carregue os dados 'penguins' e 'penguins_raw' do pacoate palmerpenguins

# exercicios -------------------------------------------------------------

## exercicio 01 ----
# exporte os dados 'penguins' no formato .csv e depois importe novamente

## exercicio 02 ----
# exporte os dados 'penguins' no formato .xlsx e depois importe novamente

## exercicio 03 ----
# # exporte os dados 'penguins' no formato .csv, selecionando apenas as colunas species, island e body_mass_g

## exercicio 04 ----
# crie um tibble usando a função tibble::tibble() com uma coluna sendo o nome das espécies e 
# a outra sendo o número de indivíduos por espécie
# dica: use um table() para saber número de indivíduos por espécie

## exercicio 05 ----
# add uma coluna de ids ao dado 'penguins' usando a funcao tibble::rowid_to_column()

## exercicio 06 ----
# remova as linhas com NAs das colunas 'bill_length_mm', 'bill_depth_mm', 'flipper_length_mm' e 'body_mass_g'

## exercicio 07 ----
# reorganize as colunas de especies, comprimento de asa e comprimento do bico 
# para o formato de dados longo (long)

## exercicio 08 ----
# filtre as linhas de 'penguins' da ilha Dream e ordene pela massa

## exercicio 09 ----
# crie uma variável de massa corporal em kg
# dica: dplyr::mutate()

## exercicio 10 ----
# calcule a média e o desvio-padrão da massa por espécie
# dica: dplyr::group_by() e dplyr::summarise()

## exercicio 11 ----
# selecione todas as colunas que terminam com "_mm". 
# dica: dplyr::select() e ends_with()

## exercicio 12 ---- 
# padronize o nome das ilhas para minúsculas
# dica: stringr::str_subset()

## exercicio 13 ----
# quais colunas possuem nome com "_mm". 
# Dica: stringr::str_subset()

## exercicio 14 ----
# mude a ordem dos fatores das especies: Chinstrap, Adelie e Gentoo.
# Dica: dplyr::mutate() e forcats::fct_relevel()

## exercicio 15 ---- 
# agrupe a classe de ilha menos abundante em "Outras". 
# Dica: dplyr::mutate() e forcats::fct_lump_lowfreq()

## exercicio 16 ---- 
# extraia o mês e o ano das datas da coluna `Date Egg` do dado 'penguins_raw'
# dica: lubridate::month() e lubridate::year()

## exercicio 17 ---- 
# crie uma coluna com datas a partir de hoje somando dias aleatórios de 0 a 100
# dica: dplyr::mutate(), lubridate::today() e sample(0:100, nrow(penguins), replace = TRUE)
# dica2: as dados podem ser somadas com '+'

## exercicio 18 ----
# crie uma lista com as massas por espécie e calcule médias
# dica: split(var, group) e purrr::map()

## exercicio 19 ----
# crie um tibble com o desvio padrao das massas por espécie
# use o resultado do split do ex. 18 e purrr::map_df()

# desafio -----------------------------------------------------------------

## exercicio 20 ---- 
# calcule massa média por ilha, exporte para Excel e depois importe

# end ---------------------------------------------------------------------