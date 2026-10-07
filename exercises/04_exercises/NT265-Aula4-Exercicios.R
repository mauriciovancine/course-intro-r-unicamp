# ----
# title: aula 04 - topicos avancados em programacao em R
# author: mauricio vancine
# date: 2026-10-29
# ----

# table -------------------------------------------------------------------

## carregue os dados do palmerpenguins

## exercicio 01 ----
# Qual é a frequencia absolulta e relativa de cada espécie? 
# dica: table() e prop.table()

## exercicio 02 ----
# Qual é a frequencia absolulta e relativa de pinguins machos e fêmeas?
# dica: table() e prop.table()

## exercicio 03 ----
# Quantos pinguins Adelie são machos? E quantas fêmeas da espécie Gentoo?
# dica: table()

## exercicio 04 ----
# Qual ilha tem a maior quantidade de pinguins?
# dica: table()

## exercicio 05 ----
# Em qual ilha a espécie Gentoo é mais abundante?
# E onde Adelie tem a maior concentração?
# dica: table()

## exercicio 06 ----
# Em qual ilha há o maior número de pinguins machos?
# dica: table()

## exercicio 07 ----
# Quantos pinguins fêmeas da espécie Chinstrap estão presentes na ilha Dream?
# dica: table()

## exercicio 08 ----
# Usando o pacote janitor e a função tabyl, crie uma tabela de frequência de 
# espécie e sexo 

## exercicio 09 ----
# Usando o pacote janitor e a função tabyl, crie uma tabela de frequência de 
# espécie, sexo e por ilhas

## exercicio 10 ----
# Usando a tabela do exercicio 8 e pacote janitor, e as funções adorn_totals(), 
# adicione os totais de linhas e colunas

# apply -------------------------------------------------------------------

## antes de seguir, crie um objeto penguins_na retirando as linhas com NA
# dica: na.omit()

## exercicio 11 ----
# Calcule a média de cada coluna numérica
# dica: apply e mean

## exercicio 12 ----
# Calcule o desvio padrão de cada coluna numérica
# dica: apply e sd

## exercicio 13 ----
# Encontre o valor mínimo e máximo de cada coluna numérica
# dica: apply, max e min

## exercicio 14 ----
# Calcule a média da massa corporal para cada espécie de pinguim
# dica: tapply

## exercicio 15 ----
# 'summary' para fazer a descricao da massa corporal para cada 
# espécie de pinguim 
# dica: tapply

# programacao -------------------------------------------------------------

## exercicio 16 ----
# Escreva um loop for que percorra cada linha do penguins_na e classifique os
# pinguins como tendo "bico_longo" ou "bico_curto", com base em um comprimento 
# de bico maior que 40 mm e add numa coluna chamada 'bill_length_class'

# criar uma coluna
penguins_na$bill_length_class <- ""
penguins_na

# ideia 
se penguins_na[1, ]$bill_length_mm > 40

TRUE
penguins_na[i, ]$bill_length_class <- "bico_longo"

FALSE 
penguins_na[i, ]$bill_length_class <- "bico_curto"

# estrutura
for(i in 1:nrow(---)){
  
  if(---) {
    
    ---
    
  }else {
    
    ---
    
  }
}

# ver
penguins_na[, c("bill_length_mm", "bill_length_class")]

## exercicio 17 ----
# Use um loop while para emagrecer um pinguim. Comece com um pinguim pesando 10 kg 
# e retire 100 g a cada iteração do loop ate 3.5 kg. Conte quantas retiradas aconteceram

# comecar
massa_pinguim <- 10000
i <- 0

# estrutura
while(--- > 3500){
  
  --- <- --- - 100
  --- <- --- + 1

  }

massa_pinguim
i

# desafio -----------------------------------------------------------------

# Escreva uma função que verifique se o comprimento do bico (bill_length_mm) de 
# um pinguim é maior que 40 mm. como fazer a funcao anterior ser aplicada a 
# a toda coluna?

# funcao
check_bill <- function(---){
  
  if((--- > 40){
    return("Bico grande")
    
  }else {
    return("Bico pequeno")
  }
}

check_bill((---[1])

sapply((---, check_bill)

# end ---------------------------------------------------------------------