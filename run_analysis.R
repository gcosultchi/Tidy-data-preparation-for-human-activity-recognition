# Load dplyr
library(dplyr)

# Descargar y descomprimir datos si es necesario
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "datos.zip")
unzip("datos.zip")

# Leer datos de entrenamiento y prueba

setwd("UCI HAR Dataset")
train_data <- read.table("./train/X_train.txt")
test_data <- read.table("./test/X_test.txt")

# Leer etiquetas de actividades y sujetos
train_labels <- read.table("./train/y_train.txt")
test_labels <- read.table("./test/y_test.txt")
train_subjects <- read.table("./train/subject_train.txt")
test_subjects <- read.table("./test/subject_test.txt")

# Combinar datos de entrenamiento y prueba
full_data <- rbind(train_data, test_data)
full_labels <- rbind(train_labels, test_labels)
full_subjects <- rbind(train_subjects, test_subjects)

# Extraer columnas relevantes (media y desviación estándar)
colnames(full_data) <- read.table("./features.txt")[,2]
relevant_cols <- grepl("mean|std", colnames(full_data))
full_data <- full_data[, relevant_cols]

# Agregar etiquetas de actividades y sujetos
full_data$activity <- full_labels[,1]
full_data$subject <- full_subjects[,1]

# Usar nombres descriptivos para actividades
activity_labels <- read.table("./activity_labels.txt")
full_data$activity <- factor(full_data$activity, 
                             levels = activity_labels[,1], 
                             labels = activity_labels[,2])

# Etiquetar variables descriptivamente
colnames(full_data) <- gsub("\\(", "", colnames(full_data))
colnames(full_data) <- gsub("\\)", "", colnames(full_data))
colnames(full_data) <- gsub("\\-", "", colnames(full_data))

# Crear conjunto de datos con promedios
tidy_data <- full_data %>%
  group_by(activity, subject) %>%
  summarise_all(mean, na.rm = TRUE)

# Guardar datos
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)