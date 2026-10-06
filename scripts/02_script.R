#' ----
#' title: aula 02 - Análise de dados e apresentação de gráficos usando a linguagem R - Base R
#' author: mauricio vancine
#' date: 2026-10-15
#' ----

# topics ------------------------------------------------------------------

# Atributos dos objetos
# Manipulação de dados unidimensionais
# Manipulação de dados multidimensionais
# Valores faltantes e especiais
# Diretório de trabalho
# Importar dados
# Conferência de dados importados
# Exportar dados

# atributos dos objetos -----------------------------------------------

## modos dos objetos ----

### logical ----
logical <- TRUE
logical

### numeric ----
numeric <- 3.14
numeric

### integer ----
integer <- 2L
integer

### complex ----
complex <- 3 + 2i
complex

### character ----
character <- "a"
character

## verificar o modo dos objetos
# is.numeric()
# is.integer()
# is.character()
# is.logical()
# is.complex()

## conversoes entre modos
# as.numeric()
# as.integer()
# as.character()
# as.logical()
# as.complex()

# estrutura dos objetos ---------------------------------------------------

## vector ----

# concatenar
c(1, 2, 3)
c("amostra1", "amostra2", "amostra3")

# sequencia
seq(1, 10, 2)

# repetir
rep(c(23, 42), times = 2)
rep(c(23, 42), each = 2)

# combinar
paste("amostra", 1:3)

# amostrar
sample(1:60, 6)

## factor ----
# factor nominal
ftc_nom <- factor(
  x = sample(c("f", "p"), size = 20, rep = TRUE),
  levels = c("f", "p"))
ftc_nom
levels(ftc_nom)

# factor ordinal
ftc_ord <- factor(
  x = sample(c("b", "a"), size = 20, rep = TRUE),
  levels = c("b", "a"), ordered = TRUE)
ftc_ord
levels(ftc_ord)

## matrix ----

# dispor uma sequencia
ve <- 1:9
ma_col <- matrix(data = ve, nrow = 3, ncol = 3, byrow = FALSE)
ma_col

# combinar vetores
vec_1 <- c(1, 2, 3)
vec_2 <- c(4, 5, 6)

# linhas
ma_rbind <- rbind(vec_1, vec_2)
ma_rbind

# colunas
ma_cbind <- cbind(vec_1, vec_2)
ma_cbind

# array ----
# dispor uma sequencia
ve <- sample(c(0, 1), 27, rep = TRUE)
ar <- array(data = ve, dim = c(3, 3, 3))
ar

# lista ----

# concatenar objetos
li <- list(ve, # vector
           ma_rbind, # matrix
           ma_cbind) # outra matrix
li

# data frame ----

# combinando vetores horizontalmente
sp <- c("sp1", "sp2", "sp3")
ab <- c(12, 8, 9)
ha <- c("flo", "cer", "past")

df <- data.frame(sp, ab, ha)
df

# combinando vetores horizontalmente com nomes
df <- data.frame(
  especies = paste0("sp", 1:3), 
  abundancia = sample(5:10, 3), 
  vegetacao = c("flo", "cer", "past"))
df

# manejo de dados unidimensionais -------------------------------------

# vetor e fator
# indexacao []

# fixar a amostragem
set.seed(42)

# amostrar 10 elementos de uma sequencia
ve <- sample(x = seq(0, 2, .05), size = 10)
ve

# seleciona o quinto elemento
ve[5]

# seleciona os elementos de 1 a 5
ve[1:5] 

# seleciona os elementos 1 e 10 e atribui
ve_sel <- ve[c(1, 10)]
ve_sel

# retira o decimo elemento
ve[-10]

# retira os elementos 2 a 9
ve[-(2:9)]

# retira os elementos 5 e 10 e atribui
ve_sub <- ve[-c(5, 10)]
ve_sub

# selecao condicional: selecionar elementos por condicões 
# dois vetores
foo <- 42
bar <- 23

# operadores relacionais - saidas booleanas (TRUE ou FALSE)
foo == bar # igualdade
foo != bar # diferenca 
foo > bar # maior
foo >= bar # maior ou igual
foo < bar # menor
foo <= bar # menor ou igual

# quais valores sao maiores que 1?
ve > 1 

# valores acima de 1
ve[ve > 1] 

# atribui valores maiores que 1
ve_maior1 <- ve[ve > 1]
ve_maior1

# maximo
max(ve)

# minimo
min(ve)

# amplitude
range(ve)

# comprimento
length(ve)

# ordenar crescente
sort(ve)

# ordenar decrescente
sort(ve, dec = TRUE)

# arredondamento
round(ve, digits = 1)

# arredondamento
round(ve, digits = 0)

# algum?
any(ve > 1)

# todos?
all(ve > 1)

# qual(is)?
which(ve > 1)

# subconjunto
subset(ve, ve > 1)

# condicao para uma operacao
ifelse(ve > 1, 1, 0)

# indexacao []
# lista
li <- list(elem1 = 1, elem2 = 2, elem3 = 3)
li

# acessar o primeiro elemento
li[1]

# acessar o primeiro e o terceiro elementos e atribuir
li2 <- li[c(1, 3)]
li2

# retirar o primeiro elemento
li[-1]

# retirar o segundo elemento e atribuir
li_13 <- li[-2]
li_13

# valor do primeiro elemento
li[[1]]

# valor do segundo elemento e atribuir
li2_val <- li[[2]]
li2_val

# acessar o primeiro elemento
li$elem1

# acessar o primeiro e o terceiro elementos e atribuir
li1 <- li$elem1
li1

# comprimento
length(li)

# names
names(li)

# renomear
names(li) <- paste0("elemento0", 1:3)
li

# manejo de dados bidimensionais --------------------------------------

# matriz - indexacao []
ma <- matrix(1:12, 4, 3)
ma 

# linha 3
ma[3, ] 

# coluna 2
ma[, 2] 

# elemento da linha 1 e coluna 2
ma[1, 2] 

# elementos da linha 1 e coluna 1 e 2
ma[1, 1:2] 

# elementos da linha 1 e coluna 1 e 3
ma[1, c(1, 3)] 

# elementos da linha 1 e coluna 1 e 3 e atribuir
ma_sel <- ma[1, c(1, 3)]
ma_sel

# data frame - indexacao $
# criar tres vetores
sp <- paste("sp", 1:10, sep = "")
abu <- 1:10
flo <- factor(rep(c("campo", "floresta"), each = 5))

# data frame
df <- data.frame(sp, abu, flo)
df

# $ funciona apenas para data frame 
df$sp 
df$abu
df$flo

# funcoes para uma coluna indexada por $
length(df$abu)
max(df$abu)
min(df$abu)
range(df$abu)

# converter colunas
mode(df$abu)
df$abu <- as.character(df$abu)

df$abu
mode(df$abu)

# converter colunas
df$abu <- as.numeric(df$abu)
df$abu
mode(df$abu)

# adicionar uma coluna
set.seed(42)
df$abu2 <- sample(0:1, nrow(df), rep = TRUE)
df$abu2
df

# selecionar linhas de uma matriz ou data frame 
df[df$abu > 4, ]

# selecionar linhas de uma matriz ou data frame 
df[df$abu2 == 0, ]

# selecionar linhas de uma matriz ou data frame 
df[df$flo == "floresta", ]

# funcoes de visualizacao e manejo
# head(): mostra as primeiras 6 linhas
# tail(): mostra as últimas 6 linhas
# nrow(): mostra o número de linhas
# ncol(): mostra o número de colunas
# dim(): mostra o número de linhas e de colunas
# rownames(): mostra os nomes das linhas (locais)
# colnames(): mostra os nomes das colunas (variáveis)
# str(): mostra as classes de cada coluna (estrutura)
# summary(): mostra um resumo dos valores de cada coluna
# rowSums(): calcula a soma das linhas (horizontal)
# colSums(): calcula a soma das colunas (vertical)
# rowMeans(): calcula a média das linhas (horizontal)
# colMeans(): calcula a média das colunas (vertical)

# valores faltantes e especiais --------------------------------------

# 1 na - not available
foo_na <- NA
foo_na

# data frame
df <- data.frame(var1 = c(1, 4, 2, NA), var2 = c(1, 4, 5, 2))
df

# verificar a presenca/ausencia de NA's
is.na(df)

# verificar a presenca de algum NA's
any(is.na(df))

# retirar as linhas que possuem NA's
df_sem_na <- na.omit(df)
df_sem_na

# numero de linhas
nrow(df)
nrow(df_sem_na)

# substituir na por 0
df[is.na(df)] <- 0
df

# 2 nan - not a number
0/0
log(-1)

# criar um vetor
ve <- c(1, 2, 3, NA, NaN)
ve

# verificar a presenca de na
is.na(ve)

# verificar a presenca de nan
is.nan(ve)

# 3 inf - infinito
# limite matematico
1/0

# numero grande
10^310

# objeto nulo
nulo <- NULL
nulo

# diretorio de trabalho -----------------------------------------------

# definir o diretorio de trabalho
setwd("/home/mude/github/mauriciovancine/course-intro-r-unicamp/") # mudem

# verificar o diretorio
getwd()

# listar os arquivos
dir()

#  importar dados ------------------------------------------------------

# ler uma planilha eletronica (.csv)
read.csv("ATLANTIC_AMPHIBIANS_sites.csv", encoding = "latin1")

# ler e atribuir uma planilha eletronica (.csv) a um objeto
da <- read.csv("ATLANTIC_AMPHIBIANS_sites.csv", encoding = "latin1")

# ver os dados
da

# conferir a classe
class(da)

# ler e atribuir uma planilha simples (.txt) a um objeto
da <- read.table("ATLANTIC_AMPHIBIANS_sites.txt", row.names = 1, header = TRUE, sep = "\t")
da

# pacote openxlsx
# install.packages("openxlsx")
library(openxlsx)

# ler e atribuir uma planilha eletronica (.xlsx) a um objeto
da <- openxlsx::read.xlsx("ATLANTIC_AMPHIBIANS_sites.xlsx", sheet = 1)
da

# 7. Conferir e manejar dados importados ---------------------------------

# conjunto de funcoes para conferir os dados
# head(): mostra as primeiras 6 linhas
# tail(): mostra as ultimas 6 linhas
# nrow(): mostra o numero de linhas
# ncol(): mostra o numero de colunas
# dim(): mostra o numero de linhas e de colunas
# rownames(): mostra os nomes das linhas (locais)
# colnames(): mostra os nomes das colunas (variaveis)
# str(): mostra as classes de cada coluna (estrutura)
# summary(): mostra um resumo dos valores de cada coluna

# head(): mostra as primeiras 10 linhas
head(da)

# head(): mostra as primeiras 10 linhas
head(da, 10)

# tail(): mostra as ultimas 6 linhas
tail(da)

# nrow(): mostra o numero de linhas
nrow(da)

# ncol(): mostra o numero de colunas
ncol(da)

# dim(): mostra o numero de linhas e de colunas
dim(da)

# rownames(): mostra os nomes das linhas (locais)
rownames(da)

# mudar nome das linhas
rownames(da) <- da$id
da

# colnames(): mostra os nomes das colunas (variaveis)
colnames(da)

# str(): mostra as classes de cada coluna (estrutura)
str(da)

# summary(): mostra um resumo dos valores de cada coluna
summary(da)

# Verificar a presenca de NAs
# algum?
any(is.na(da))

# quais?
which(is.na(da))

# retirar os NAs
da_na <- na.omit(da)

# numero de linhas
nrow(da)
nrow(da_na)

# subset das linhas com amostragens de anfibios em sao paulo
da_sp <- da[da$state == "São Paulo", ]
da_sp

# 8. Exportar dados -----------------------------------------------------

# exportar planilha eletronica (.csv)
write.csv(da_sp, "ATLANTIC_AMPHIBIAN_sites_sao_paulo.csv", 
          row.names = FALSE)

# exportar planilha de texto (.txt)
write.table(da_sp, "ATLANTIC_AMPHIBIAN_sites_sao_paulo.txt", 
            row.names = FALSE, quote = FALSE, sep = ";")

# exportar planilha eletronica (.xlsx)
openxlsx::write.xlsx(da_sp, "ATLANTIC_AMPHIBIAN_sites_sao_paulo.xlsx", 
                     row.names = FALSE, quote = FALSE)

# end ---------------------------------------------------------------------