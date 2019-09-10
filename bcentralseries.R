library(fpp2)
library(tidyverse)
library(readxl)
library(lubridate)

imacec_nm_bc <- read_excel("Cuadro_1.xls",
                       sheet = "ExportCuadro",
                       range = "A3:B81")
imacec_nm_bc <- imacec_nm_bc%>% 
  rename(imacec_no_minero = `1. Imacec no minero`,
         periodo = Periodo)  


pib_bc <- read_excel("Cuadro_2.xls",
                        sheet = "ExportCuadro",
                        range = "A3:B29")
pib_bc <- pib_bc %>% 
  rename(pib = `1. PIB volumen a precios del año anterior encadenado`,
         periodo = Periodo) 

imacec_nm_bc$periodo

min(imacec_nm_bc$periodo)
year(min(imacec_nm_bc$periodo))
month(min(imacec_nm_bc$periodo))

ima_start <- c(year(min(imacec_nm_bc$periodo)), month(min(imacec_nm_bc$periodo)))
ima_start 

pib_start <- c(year(min(pib_bc$periodo)), quarter(min(pib_bc$periodo)))
pib_start 


ima_ts <- ts(imacec_nm_bc$imacec_no_minero, frequency = 12, start = ima_start)

pib_ts <- ts(pib_bc$pib, frequency = 4, start = ima_start)

autoplot(ima_ts)

autoplot(pib_ts)

