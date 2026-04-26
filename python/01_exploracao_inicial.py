import pandas as pd

print("Script iniciou")

# Caminho do dataset
file_path = "../data/raw/product_sales_dataset_final.csv"

# Carregando dados
df = pd.read_csv(file_path)

print("Arquivo carregado com sucesso")

print("\n========== PRIMEIRAS 5 LINHAS ==========")
print(df.head())

print("\n========== TAMANHO DO DATASET ==========")
print(f"Linhas: {df.shape[0]}")
print(f"Colunas: {df.shape[1]}")

print("\n========== TIPOS DE DADOS ==========")
print(df.dtypes)

print("\n========== VALORES NULOS ==========")
print(df.isnull().sum())