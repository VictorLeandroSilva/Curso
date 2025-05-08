#
setwd(choose.dir())
setwd("C:/Users/Pichau/OneDrive/Livros legais/Aulas_R")
dir()
getwd()

# library
# install.packages("tidyverse", dependencies = T)
# install.packages("palmerpenguins", dependencies = T)
library(tidyverse) 
library(palmerpenguins)
library(viridis)

# ler os dados do PC
# obs01: Sempre usem seus dados em .csv ou .txt
dir()
df <- read_csv("comm.csv")
df <- read_csv2("comm.csv") #tratar as linhas = observacao, tratar as colunas = variavel
df2 <- read_table("comm.txt")
df2 <- read_table2("comm.txt")
  
# olhar os dados
glimpse(df) # checar a estrutura dos dados
summary(df) # checar valores outline

# Escrevendo dados
cbind() # juntar dois objetos pelas colunas
rbind() # juntar dois objetos pelas linhas
df3 <- cbind(df,df2)
df4 <- rbind(df,df2)

getwd()
write_csv(df4, file = "comm_nova.csv")
write_csv2(df4, file = "comm_nova2.csv")

# funcoes 

# usar uma funcao
# nome_da_função(argumento1, argumento2, …)
# Nome da função: remete ao que ela faz
# Parênteses: limitam a função
# Argumentos: valores, parâmetros ou expressões onde a função atuará
# Vírgulas: separam os argumentos
# tipos de argumentos:
#   Valores ou objetos: a função alterará os valores em 
#   si ou os valores atribuídos aos objetos
#   Parâmetros: valores fixos que informam um método ou a 
#   realização de uma operação. Informa-se o nome desse argumento, 
#   seguido de “=” e um número, texto ou TRUE ou FALSE

# introducao a graficos no ggplot
penguins <- palmerpenguins::penguins
glimpse(penguins)
penguins
head(penguins) # mostrar as primeiras linhas
tail(penguins) # mostrar as ultimas linhas
summary(penguins)

penguins <- drop_na(penguins) # retirar as linhas que contem `NA`
glimpse(penguins)

# Grafico = package ggplot2

ggplot(data = penguins)
# ----
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)
# ---
ggplot(data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()
# ---
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g, colour = species)) + 
  geom_point()

# ---
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g, colour = species)) + 
  geom_point() +
  geom_smooth(method = "lm") #lm = linear model

# ---
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point() +
  geom_smooth(method = "lm") #lm = linear model

# ---
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(mapping = aes(colour = species, shape = species)) +
  geom_smooth(method = "lm") #lm = linear model

# ---
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g,colour = species)) + 
  geom_point(mapping = aes(shape = species)) +
  geom_smooth(method = "lm") + #lm = linear model
  labs(
    title = "Grafico aula 2",
    subtitle = "introducao a gglplot",
    x = "Flipper (mm)",
    y = "Mass (g)"
    )

# ---
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g, colour = species)) + 
  geom_point(mapping = aes(shape = species)) +
  geom_smooth(method = "lm") + #lm = linear model
  labs(
    title = "Grafico aula 2",
    subtitle = "introducao a gglplot",
    x = "Flipper (mm)",
    y = "Mass (g)"
  )

# ---
cor <- c("red","blue","black")
cor2 <- c("#FF00FF","#D2691E","#006400")
cores <- c("Adelie" = "#E41A1C", "Chinstrap" = "#377EB8", "Gentoo" = "#4DAF4A")

ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(mapping = aes(shape = species, colour = species)) +
  geom_smooth(method = "lm") + #lm = linear model
  labs(
    title = "Grafico aula 2",
    subtitle = "introducao a gglplot",
    x = "Flipper (mm)",
    y = "Mass (g)"
  ) +
  scale_color_manual(values = cor)

# ---
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g, colour = species)) + 
  geom_point(mapping = aes(shape = species)) +
  geom_smooth(method = "lm") + #lm = linear model
  labs(
    title = "Grafico aula 2",
    subtitle = "introducao a gglplot",
    x = "Flipper (mm)",
    y = "Mass (g)"
  ) +
  scale_color_manual(values = cores)

# --- grafico de barra
ggplot(data = penguins, mapping = aes(x = fct_infreq(species))) +
  geom_bar()

# --- grafico de histograma
ggplot(data = penguins, mapping = aes(x = body_mass_g)) +
  geom_histogram(binwidth = 20)

ggplot(data = penguins, mapping = aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)

ggplot(data = penguins, mapping = aes(x = body_mass_g)) +
  geom_histogram(binwidth = 2000)

# --- grafico de densidade
ggplot(data = penguins, mapping = aes(x = body_mass_g)) +
  geom_density()

# --- grafico de boxploit
ggplot(data = penguins, mapping = aes(x = species, y = body_mass_g)) +
  geom_boxplot()

ggplot(data = penguins, mapping = aes(x = species, y = flipper_length_mm)) +
  geom_boxplot()

ggplot(data = penguins, mapping = aes(x = species, y = flipper_length_mm, fill = species)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  ggtitle("A boxplot with jitter") +
  xlab("")
  
  
  
  
