# Load libraries
library(ggplot2)
library(dplyr)
library(DBI)
library(RSQLite)

# Connect to SQL database
conn <- dbConnect(SQLite(), dbname = "customer_churn.db")

# Load data
df <- dbGetQuery(conn, "SELECT * FROM customer_churn")

# Churn distribution visualization
ggplot(df, aes(x = churn, fill = churn)) +
  geom_bar() +
  ggtitle("Customer Churn Distribution")

# Churn rate by contract type
ggplot(df, aes(x = contract, fill = churn)) +
  geom_bar(position = "fill") +
  ylab("Proportion") +
  ggtitle("Churn Rate by Contract Type")
