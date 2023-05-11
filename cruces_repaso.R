# install.packages("openxlsx")

library(tidyverse)
library(readr)
library(readxl)
library(tidyverse)
library(openxlsx)

# Cargado de bases
base1 <- read_csv("Documentos/Javeriana/JuanCa/data/2023-05-10_183116-usuarios-javerianacali.csv")
base2 <- read_excel("Documentos/Javeriana/JuanCa/data/Base2.xlsx")
base1$ID = as.numeric(base1$ID)


#----------------------------------------------
# Comparar las bases de datos y seleccionar los registros que faltan en base_datos2
# los estudiantes que diligenciaron del sistema que faltan por llenar el forms
registros_faltantes <- anti_join(base1, base2, by = c("ID" = "ID2"))

# Mostrar los registros faltantes
print(registros_faltantes)

#--------------------------------------------------------
# Comparar las bases de datos y seleccionar los registros que están en base_datos2 pero no en base_datos1
#

# Comparar las bases de datos y seleccionar los registros que están en base_datos2 pero no en base_datos1
registros_faltantes2 <- setdiff(base2$ID2, base1$ID)

# Filtrar los registros faltantes en base_datos2
registros_faltantes_base2 <- base2[base2$ID2 %in% registros_faltantes2, ]

# Mostrar los registros faltantes
print(registros_faltantes_base2)
#---------------------------------------------------
# guardar archivos en formato excel
# Grabar la base de datos resultante en formato Excel
write.xlsx(registros_faltantes, file = "/home/deg/Documentos/Javeriana/JuanCa/data/registro_faltantes.xlsx")
write.xlsx(registros_faltantes_base2, file = "/home/deg/Documentos/Javeriana/JuanCa/data/registro_faltantes2.xlsx")




