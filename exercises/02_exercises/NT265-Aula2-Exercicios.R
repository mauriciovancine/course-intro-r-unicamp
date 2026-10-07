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


# Faça gráficos mostrando a variação de temperatura e precipitação entre os 
# ecossistemas A e B e interprete suas observações (descreva em poucas palavras)
# dica: função boxplot()


# Você verificou um problema no sensor de temperatura e o registro errôneo de 
# temperaturas maiores que 50 graus no ecossistema A. Substitua estes valores por NA, 
# pois não serão confiáveis para análise
# dica: [] e <-


# Selecione os meses com precipitação maior que >60mm em cada ecossistema e 
# analise as diferenças descrevendo-as
# dica: [] e >


# Crie uma nova coluna chamada estação com classificando os meses com precipitação 
# menor que 60mm como "seca" e os demais como "chuvosa". 
# dica: $ e ifelse()


# exercicio 02 ------------------------------------------------------------

# Abra o arquivo "aula2_dados_exercicios.xlsx" no excel e salve-o como txt 
# separado por tabulação. Importe o arquivo txt em um objeto chamado dados
# dica: funcao read.table() e sep = "\t" 

# Use head() e tail() para verificar se sua tabela foi lida corretamente


# Descubra o comprimento da primeira coluna (grupo) do seu data frame
# dica: length() ou nrow()


# Veja a estrutura e a dimensão dos dados (quantidade de linhas e de colunas)
# dica: dim()


# Descubra a media dos dados da coluna comprimento_1. 
# dica: $ e mean()


# Você conseguiu calcular a média? Por quê?


# Tente resolver isso usando indexação e which(). Usando essas funções, 
# substitua NA pelo valor 1.37


# Tente calcular a média agora



# exercicio 03 ------------------------------------------------------------

# usando o data frame iris, que já vem no R
iris

# Cheque o data frame usando as funções head() e tail()


# Qual a classe da coluna Sepal.length?
# dica: class()


# Qual a classe da coluna Species?
# dica: class()


# Calcule a média a coluna Petal.length
# dica: mean()

# Descubra o valor máximo e o valor mínimo da coluna Sepal.Width
# dica: range()


# Faça um boxplot de Sepal.Length por espécie. Mude a cor do boxplot de acordo 
# com a espécie (busque os argumentos da função usando ?boxplot). 
# dica: use a função unique() em espécies para conseguir colorir 


# Exclua todas as linhas que tiverem os dados da espécie versicolor (use which())


# Crie uma nova coluna no data frame iris com os valores de Sepal.Length 
# divididos pelos valores de Petal.Length. Coloque o nome SL_PL na sua nova coluna.


# Crie uma coluna chamada "tamanho" e baseada em Sepal.Width. Para cada linha, 
# se Sepal.Width for maior ou igual a 4, nessa nova coluna temos o termo "grande" 
# e, se Sepal.Width for menor que 4 e maior ou igual a 2, temos o termo "medio", 
# se Sepal.Width for menor que 2, temos o termo "pequeno". 
# dica: use ifelse() dentro de ifelse(). 


# Salve o objeto iris com a nova coluna no formato txt separado por tabulação.


# Crie um novo objeto chamado "grandes" selecionando apenas as linhas em que o 
# termo "grande" aparece na coluna "tamanho". Dica: Use a função subset()


# exercicio extra 01 ------------------------------------------------------------

# Crie um vetor chamado "numeros" e adicione a ele uma sequencia de 1 a 20
# dica: ':' ou seq()


# Crie uma matriz com 5 linhas e 4 colunas a partir do vetor "numeros" e 
# salve ela em um objeto chamado minha.matriz. 
# dica: use a função matrix(x ,nrow, ncol). 
# Mais uma dica: o vetor "numeros" entra no lugar de "x" na função!


# Renomeie as colunas para C1, C2, C3 e C4 e as linhas como L1, L2, L3... 
# dica: use a função paste()


# exercicio extra 02 ------------------------------------------------------------

# Crie uma lista com os objetos: dados, iris, numeros e minha.matriz 
# dica: use a função list() e concatenacao c()


# desafio ------------------------------------------------------------

# Crie um grafico de pontos a partir dos dados iris. Coloque Petal.length 
# no eixo Y e Sepal.Length no eixo X.
# dica: plot()


# Mude o nome dos eixos para "Pétala" e "Sépala"
# dica: xlab e ylab


# Mude a fonte do título dos eixos
# dica: family


# Aumente o tamanho dos pontos no gráfico
# dica: cex


# Pinte o fundo do gráfico com a sua cor favorita
# dica:

# Coloque uma linha tendência no gráfico 
# dica: use lm() para fazer a regressão e abline() para desenhar a linha. 


# end ---------------------------------------------------------------------