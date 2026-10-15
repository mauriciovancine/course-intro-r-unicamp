set.seed(43)
df <- data.frame(x = factor(rep(c("A", "B"), 50)), y = rnorm(100))
df                 

boxplot(y ~ x, data = df) # reconhece os fatores A e B, com uma variável contínua e dois fatores (A e B)
boxplot(df$x, df$y)       # considera cada coluna como uma variavel, sendo a primeira com valores 1 e 2 (transforma A em 1 e B em 2), por isso o intervalo do primeiro box como 1 e 2, e o segundo com 2 valores
