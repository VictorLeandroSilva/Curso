
# Definir diretorio
setwd("C:/Users/Pichau/OneDrive/Livros legais/Aulas_R")
setwd(choose.dir()) # escolher o diretorio
dir() # O que tem dentro do diretorio
getwd() # retornar o diretorio

# packages
# instalar pacotes
install.packages("raster", dependencies = T) # nome do pacote entre aspas

# carregar pacote
library(raster)

# varias funcoes logicas e aritimeticas 
c <- 3 + 5 # <- atribuicao 
a = 4 + 5 # + adicao
b = 7 - 4 # - subtracao
f = 10 / 2 # / divisao
r = 4 * 4 # * multiplication 

# o sinal de igual (=) NAO SIGNIFICA IGUALDADE NO R
# ele significa atribuicao

t = 10 %% 3 # %% resto da divisao
y = 10 %/% 3 # %/% resultado inteiro da divisao
u = 3 ^ 2 # ^ exponencial

# funcoes relacionais
z = 3 < 2 # < e > maior que e menor que
x = t > r # sempre vai guardar Verdadeiro (TRUE) ou falso (FALSE)
s = 4 >= 3 # >= e <= 
v = x >= t # sempre vai guardar Verdadeiro (TRUE) ou falso (FALSE)

i = 4 == 4 # o sinal de igualdade no R eh representado por dois igaus (==)
q = f == y # sempre vai guardar Verdadeiro (TRUE) ou falso (FALSE)

w = 7 != 6 # != eh o sinal de diferenca
h = f != y # sempre vai guardar Verdadeiro (TRUE) ou falso (FALSE)

# operadores logicos
# ! Lógico NÃO
# & Lógico elementar E
# | Lógico elementar OU

# 3 > 2 = T mas 5 nao eh maior do que 8 (false)
p = 4 > 2 && 13 > 8
# || funcao de OU

# nunca sobrescreva um numero
obj <- 100
obj
obj2 <- 1
obj2

# funcao 
# sum
data <- c(45,32,5,6,234,78,432) # funcao c() faz concatenar
View(data) # abrir na janela
data
soma <- sum(obj,obj2)
soma <- sum(34,68)
obj + obj2
# somar todos os dados
data2 <- sum(data)
data2

# repetir 
data3 <- rep(x = "Turdus leucomelas", times = 7) # repetir algo quantas vezes eu precisar 
data3

# cbind juntas colunas o nome nao precisa ser igual
data4 <- cbind(data,data3)
data4

# rbind juntas linhas, e aqui os nomes precisam ser iguais 

# rais quadrada
raiz <- sqrt(100)
raiz <- sqrt(data2)

# funcoes de um pacote
# :: namespace 
raster::area()

# Toda vez que eu precisar usar uma funcao especifica quando 
# tem duas funcoes com o mesmo nome, eu vou precisar indicar
# o namespace (pacote + :: + funcao) Ex: raster::area()

# pedindo ajuda ao R para entender uma funcao
?area # funcao usa apenas um ?
?? raster # pacote usa duas interrogacoes 

# principais erros

# 1 - letras mausculas e menusculas 
# diferencia 'A' de 'a'

# 2 Esquecer de completar uma função ou bloco de códigos
sum(1,2

# 3 Esquecer de vírgulas dentro de funções
sum(1 2)

# 4 Chamar um objeto pelo nome errado
obj <- 10
OBJ

# 5 Esquecer de carregar um pacote
## Carregar dados
data(dune) # dados dentro de pacotes
## Função do pacote vegan
decostand(dune[1:6, 1:6], "hell")
# preciso
library(vegan)

# 6 Usar o nome da função de forma errônea
## Soma das colunas
colsums(dune) # forma errada
## Soma das colunas
colSums(dune) # forma certa

# 7 Atentar para o diretório correto
## Listar os arquivos do diretório definido
dir()
list.files()

## Listar os arquivos do diretório definido por um padrão
dir(pattern = ".csv")
