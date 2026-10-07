#' ----
#' title: Aula 2 - importação, indexação e manipulação de dados no R - NT265/NE320
#' author: mauricio vancine
#' date: 2026-11-29
#' ----

# exercicio 01 ------------------------------------------------------------

# Você estuda a variação da temperatura e precipitação ao longo do ano em dois 
# ecossistemas e precisa organizar os dados em uma tabela

# Você tem dados de janeiro a dezembro: 
# Temperatura ecossistema A: 22.1,	21.9, 21.7, 19.6, 17.1, 15.7, 15.7, 16.6, 18.3, 19.7, 21.5, 21.6
# Precipitação ecossistema A: 122, 103, 97, 56, 49, 47, 29, 26, 64, 125, 142, 105
# Temperatura ecossistema B: 24.2,	23.8, 25.6, 20.6, 20.1, 23.4, 25.7, 23.6, 28.1, 25.7, 26.8, 24.0
# Precipitação ecossistema B: 122, 103, 156, 150, 96, NA, 59, 126, 164, 125, 108, 205


# Crie uma tabela a partir de vetores correspondentes às colunas de cada 
# variável em formato longo chamado "dados"
# dica: ecossistema, meses, temperatura, precipitação e funcoes data.frame() e rep()
dados <- data.frame(
  ecossistema = c(rep("ecossistema_A", 12), rep("ecossistema_B", 12)), 
  meses = rep(c("jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez"), 2), 
  temperatura = c(
    22.1,	21.9, 21.7, 19.6, 17.1, 15.7, 15.7, 16.6, 18.3, 19.7, 21.5, 21.6,
    24.2,	23.8, 25.6, 20.6, 20.1, 23.4, 25.7, 23.6, 28.1, 25.7, 26.8, 24.0), 
  precipitacao = c(
    122, 103, 97, 56, 49, 47, 29, 26, 64, 125, 142, 105,
    122, 103, 156, 150, 96, NA, 59, 126, 164, 125, 108, 205))
dados

# Faça gráficos mostrando a variação de temperatura e precipitação entre os 
# ecossistemas A e B e interprete suas observações (descreva em poucas palavras)
# dica: função boxplot()
boxplot(temperatura ~ ecossistema, data = dados)
boxplot(precipitacao ~ ecossistema, data = dados)

# ecossistema A é mais frio e seco do que o ecossistema B

# Você verificou um problema no sensor de temperatura e o registro errôneo de 
# temperaturas maiores que 22 graus no ecossistema A. Substitua estes valores por NA, 
# pois não serão confiáveis para análise
# dica: [] e <-
dados$temperatura_fix <- dados$temperatura
dados[dados$ecossistema == "ecossistema_A" & dados$temperatura > 22, ]$temperatura_fix <- NA
dados

# Selecione os meses com precipitação maior que >60mm em cada ecossistema e 
# analise as diferenças descrevendo-as
# dica: [] e >
dados[dados$ecossistema == "ecossistema_A" & dados$precipitacao > 60, ]$meses
dados[dados$ecossistema == "ecossistema_B" & dados$precipitacao > 60, ]$meses

# ecossistama A possui meses com umidade maior que 60 mm entre o comeco e no final do ano.
# ja o ecossistema B possui todos os meses com precipitação acima de 60 mm

# Crie uma nova coluna chamada estação com classificando os meses com precipitação 
# menor que 60mm como "seca" e os demais como "chuvosa". 
# dica: $ e ifelse()
dados$estacao <- ifelse(dados$precipitacao > 60, "chuvosa", "seca")
dados

# exercicio 02 ------------------------------------------------------------

# Abra o arquivo "aula2_dados_exercicios.xlsx" no excel e salve-o como txt 
# separado por tabulação. Importe o arquivo txt em um objeto chamado "dados"
# dica: funcao read.table() e sep = "\t" 
dados <- read.table("exercises/02_exercises/aula2_dados_exercicios.txt", 
                    header = TRUE, sep = "\t", dec = ",")
dados

# Use head() e tail() para verificar se sua tabela foi lida corretamente
head(dados)
tail(dados)

# Descubra o comprimento da primeira coluna (grupo) do seu data frame
# dica: length() ou nrow()
length(dados$grupo)
nrow(dados)

# Veja a estrutura e a dimensão dos dados (quantidade de linhas e de colunas)
# dica: dim()
dim(dados)

# Descubra a media dos dados da coluna comprimento_1. 
# dica: $ e mean()
mean(dados$comprimento_1)

# Você conseguiu calcular a média? Por quê?
# nao, pois possia um NA

# Tente resolver isso usando indexação e which(). Usando essas funções, 
# substitua NA pelo valor 1.37
# dica: is.na()
dados_fix <- dados
which(is.na(dados$comprimento_1))
dados_fix[which(is.na(dados_fix$comprimento_1)), ]$comprimento_1 <- 1.37
dados_fix[20, ]$comprimento_1

# Tente calcular a média agora
mean(dados_fix$comprimento_1)

# exercicio 03 ------------------------------------------------------------

# usando o data frame penguins, que já vem no R
penguins

# Cheque o data frame usando as funções head() e tail()
head(penguins)
tail(penguins)

# Qual a classe da coluna bill_len?
# dica: class()
class(penguins$bill_len)

# Qual a classe da coluna species?
# dica: class()
class(penguins$species)

# Calcule a média a coluna bill_dep
# dica: mean() e 
mean(penguins$bill_len, na.rm = TRUE)

# Descubra o valor máximo e o valor mínimo da coluna flipper_len
# dica: range() e na.rm = TRUE
range(penguins$flipper_len, na.rm = TRUE)

# Faça um boxplot de body_mass por espécie. Mude a cor do boxplot de acordo 
# com a espécie (busque os argumentos da função usando ?boxplot). 
# dica: use a função unique() em espécies para conseguir colorir 
boxplot(body_mass ~ species, data = penguins, col = unique(penguins$species))

# Exclua todas as linhas que tiverem os dados da espécie Adelie (use which())
# dica: use o menos "-"
penguins[-which(penguins$species == "Adelie"), ]

# Crie uma nova coluna no penguins com os valores de bill_len 
# divididos pelos valores de bill_dep Coloque o nome BL_BD na sua nova coluna.
penguins$BL_BD <- penguins$bill_len/penguins$bill_dep
penguins

# Crie uma coluna chamada "tamanho" e baseada em body_mass.
# Para cada linha: 
# se body_mass for maior ou igual a 5000, nessa nova coluna temos o termo "grande" 
# se body_mass for menor que 5000 e maior ou igual a 3000, temos o termo "medio", 
# se body_mass for menor que 3000, temos o termo "pequeno". 
# dica: use ifelse() dentro de ifelse(). 
penguins$tamanho <- ifelse(penguins$body_mass > 5000, "grande", 
                    ifelse(penguins$body_mass > 3000 & penguins$body_mass <= 5000, "medio",
                    "pequeno"))

table(penguins$body_mass)
table(penguins$tamanho)

boxplot(body_mass ~ tamanho, penguins)
abline(h = 5000, lty = 2, col = "red")
abline(h = 3000, lty = 2, col = "red")

# Salve o objeto penguins com a nova coluna no formato txt separado por tabulação.
write.table(penguins, "exercises/02_exercises/penguins.txt", sep = "\t",
            quote = FALSE, row.names = FALSE)

# Crie um novo objeto chamado "grandes" selecionando apenas as linhas em que o 
# termo "grande" aparece na coluna "tamanho". Dica: Use a função subset()
grandes <- subset(dados, tamanho == "grande")
grandes

# exercicio extra 01 ------------------------------------------------------------

# Crie um vetor chamado "numeros" e adicione a ele uma sequencia de 1 a 20
# dica: ':' ou seq()
numeros <- 1:20
numeros

# Crie uma matriz com 5 linhas e 4 colunas a partir do vetor "numeros" e 
# salve ela em um objeto chamado minha_matriz. 
# dica: use a função matrix(data, nrow, ncol). 
# Mais uma dica: o vetor "numeros" entra no lugar de "data" na função!
minha_matriz <- matrix(data = numeros, nrow = 5, ncol = 4)
minha_matriz

# Renomeie as colunas para C1, C2, C3 e C4 e as linhas como L1, L2, L3... 
# dica: use as funçoes paste0(), rownames() e colnames()
rownames(minha_matriz) <- paste0("L", 1:5)
colnames(minha_matriz) <- paste0("C", 1:4)
minha_matriz

# exercicio extra 02 ------------------------------------------------------------

# Crie uma lista com os objetos: dados, dados, iris, numeros e minha.matriz
# dica: use a função list() e concatenacao c()
list(dados, penguins, numeros, minha_matriz)

# desafio ------------------------------------------------------------

# Crie um grafico de pontos a partir dos dados penguins. Coloque bill_dep 
# no eixo Y e bill_len no eixo X.
# dica: plot()
plot(bill_dep ~ bill_len, data = penguins)

# Mude o nome dos eixos para "Bill depth" e "Bill length"
# dica: xlab e ylab
plot(bill_dep ~ bill_len, 
     data = penguins,
     xlab = "Bill depth", ylab = "Bill length")

# Mude a fonte do título dos eixos
# dica: family
plot(bill_dep ~ bill_len, 
     data = penguins,
     xlab = "Bill depth", ylab = "Bill length",
     family = "ubuntu")

# Aumente o tamanho dos pontos no gráfico
# dica: cex
plot(bill_dep ~ bill_len, 
     data = penguins,
     xlab = "Bill depth", ylab = "Bill length",
     family = "ubuntu",
     cex = 2)

# Pinte o fundo do gráfico com a sua cor favorita
# dica: par(bg = "sua_cor") 
par(bg = "steelblue") 
plot(bill_dep ~ bill_len, 
     data = penguins,
     xlab = "Bill depth", ylab = "Bill length",
     family = "ubuntu",
     cex = 2)

# Coloque uma linha tendência no gráfico 
# dica: use lm() para fazer a regressão e abline() para desenhar a linha. 
mod <- lm(bill_dep ~ bill_len,  data = penguins)

plot(bill_dep ~ bill_len, 
     data = penguins,
     xlab = "Bill depth", ylab = "Bill length",
     family = "ubuntu",
     cex = 2)
abline(mod, col = "red", lwd = 2)

# end ---------------------------------------------------------------------