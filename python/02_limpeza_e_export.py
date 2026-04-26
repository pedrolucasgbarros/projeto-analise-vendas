import pandas as pd

INPUT_PATH = "../data/raw/product_sales_dataset_final.csv"
OUTPUT_PATH = "../data/processed/sales_clean.csv"

df = pd.read_csv(INPUT_PATH)

# 1) Padronizar nomes de colunas 
df.columns = [c.strip().lower() for c in df.columns]

# 2) Converter data (Order_Date -> datetime)

df["order_date"] = pd.to_datetime(df["order_date"], format="%m-%d-%y", errors="coerce")

# 3) Checagens rápidas
print("\n==== Linhas/Colunas ====")
print(df.shape)

print("\n==== Datas inválidas (NaT) ====")
print(df["order_date"].isna().sum())

print("\n==== Duplicatas (linhas repetidas) ====")
print(df.duplicated().sum())

# 4) Remover duplicatas (se houver)
df = df.drop_duplicates()

# 5) Criar colunas derivadas (para análise no Power BI/SQL)
df["year"] = df["order_date"].dt.year
df["month"] = df["order_date"].dt.month
df["month_name"] = df["order_date"].dt.month_name()
df["quarter"] = df["order_date"].dt.quarter

# 6) Garantir numéricos (caso algum venha como texto)
for col in ["quantity", "unit_price", "revenue", "profit"]:
    if col in df.columns:
        df[col] = pd.to_numeric(df[col], errors="coerce")

print("\n==== Nulos por coluna (top 10) ====")
print(df.isnull().sum().sort_values(ascending=False).head(10))

# 7) Exportar dataset tratado
df.to_csv(OUTPUT_PATH, index=False)

print(f"Exportado com sucesso para: {OUTPUT_PATH}")