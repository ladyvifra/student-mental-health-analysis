import pandas as pd
import sqlite3

# Ruta al CSV (ajusta si tu archivo tiene otro nombre)
csv_path = "../data/student_mental_health.csv"

# Cargar el CSV
df = pd.read_csv(csv_path)

# Conectar a SQLite
conn = sqlite3.connect("mental_health.db")

# Guardar DataFrame como tabla en SQLite
df.to_sql("mental_health", conn, if_exists="replace", index=False)

print("Datos cargados en la base de datos mental_health.db")
