#
#dir
setwd("C:/Users/Pichau/OneDrive/Livros legais/Aulas_R")
dir()
getwd()

#package
library(tidyverse)
library(palmerpenguins)

# dados
df <- palmerpenguins::penguins

# estrutura dos dados
glimpse(df)
summary(df)

#retirando NA
df <- drop_na(df)
glimpse(df)  

# tipos de estrutura de dados

# vetor
vetor <- vector() # lista onde a ordem nao importa
vetor <- c(1,2,3,4,5,6,7)
vetor2 <- c("segunda", "quarta", "sexta")
vetor2 <- as.factor(vetor2) 

# list
lista <- list() # lista tipo fila (o primeiro que entra e o primeiro que sai)
                # lista tipo pilha (o primeiro que entra e o ultimo que sai)

# matriz
matriz <- matrix(nrow = 5, ncol = 5)
colnames(matriz) <- c("var_01","var_02","var_03","var_04","var_5") #definir nome das colunas
rownames(matriz) <- c("site_01","site_02","site_03","site_04","site_05")
matriz
view(matriz) #ver o objeto
# nunca, nunca, colocar nomes de colunas e linhas com espaco

# data.frame
matriz_teste <- matrix(nrow = 5, ncol = 5)
matriz_teste <- as.data.frame(matriz_teste) # ja sabe quantas linhas e quantas colunas
data_frame <- data.frame()
data_frame[1,1] <- 10 # obs: Data.frame sempre entre os [1,5], o primeiro valor representa a posicao na linha
data_frame[1,2] <- 15 # e o segundo valor representa a posicao nas colunas
data_frame[2,1] <- 1
data_frame[2,2] <- 70
data_frame[1,3] <- 7
data_frame[4,3] <- 85

# tible
tibble <- tibble()

# gerar dados aleatrios
Inteiros = sample(1:100, 10, replace = F)  # Números inteiros aleatorios entre 1 e 100
Decimais = runif(50, min = 0, max = 100)       # Números decimais entre 0 e 100
Strings = sample(LETTERS, 10, replace = TRUE)# Letras aleatórias de A a Z

palavras <- c("Especie_01","Especie_02","Especie_03")
especie <- rep(palavras,10)

sex <- c("Macho","Femea","Ind")
sexo <- rep(sex,10)

# gerar um data.frame aleatorio
df_aleatorio <- data_frame(
  Species = especie,
  Bico = runif(30, min = 8, max = 10),
  sexo = sexo,
  Asa = runif(30, min = 25, max = 30),
  Tipo_habiat = sample(0:1, 30, replace = T) # 0 = floresta, 1= areas abertas, 3 = generalista de habitat
)


# Manipulacao de dados
# pipe %>%
x <- c(1,2,3,4)
a <- sum(x)
a
b <- sqrt(a)
b
#
c <- sqrt(sum(x))
c
#
d <- x %>%
  sum()%>%
  sqrt()%>%
  min()
d

# manilacao de dados
# tidyverse ->  dplyr

# as principais funcoes sao:
# select() - seleciona colunas
# arrange() - ordena a base
# filter() - filtra linhas
# mutate() - cria/modifica colunas
# group_by() - agrupa a base
# summarise() - sumariza a base

glimpse(df_aleatorio)
class(df_aleatorio)

# select
df_text <- df_aleatorio %>%
  dplyr::select(Species,Tipo_habiat)
df_text

#arrange
df_text2 <- df_aleatorio %>%
  arrange(Bico)
df_text2

#filter
df_text3 <- df_aleatorio %>%
  dplyr::filter(Species == "Especie_01")
df_text3

#mutate
df_text4 <- df_aleatorio %>%
  mutate(Ratio = Asa/Bico) %>%
  mutate(Coletor = rep("Victor",30))
df_text4

df_text5 <- df_aleatorio %>%
  dplyr::filter(Species == "Especie_01") %>%
  mutate(Ratio = Asa/Bico) %>%
  mutate(Coletor = rep("Victor",10))
df_text5

df_text6 <- df_aleatorio %>%
  dplyr::filter(Species == "Especie_02") %>%
  mutate(Ratio = Asa/Bico) %>%
  mutate(Coletor = rep("Roseane",10))
df_text6

df_text7 <- df_aleatorio %>%
  dplyr::filter(Species == "Especie_03") %>%
  mutate(Ratio = Asa/Bico) %>%
  mutate(Coletor = rep("Briza",10))
df_text7

df_total <- rbind(df_text5,df_text6,df_text7)

# group_by
glimpse(df_total)

df_text8 <- df_total %>%
  group_by(Bico > 9) %>%
  dplyr::filter(Coletor == "Victor") %>%
  dplyr::filter(`Bico > 9` == "TRUE")
df_text8

# summarise
df_text9 <- df_total %>%
  summarise(mean = mean(Bico)) # Nao funciona sem argumentos
df_text9
