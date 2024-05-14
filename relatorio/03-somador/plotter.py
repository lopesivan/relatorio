import pandas as pd
import matplotlib.pyplot as plt
import sys

# Verificar se o nome do arquivo foi passado como argumento
if len(sys.argv) < 2:
    print("Uso: python plotter.py <nome_do_arquivo>.pdf")
    sys.exit(1)

filename = sys.argv[1]

# Carregar dados
data = pd.read_csv(
    "output.csv",
    delim_whitespace=True,
    header=None,
    names=["tempo1", "in", "tempo2", "out"],
)

# Converter tempo de segundos para milissegundos
# data["tempo1"] *= 1000
# data["tempo2"] *= 1000

# Plotar tensão
plt.figure(figsize=(10, 5))
plt.plot(data["tempo1"], data["in"], label="V(in)")
plt.plot(data["tempo2"], data["out"], label="V(out)")

plt.title("Estágio somador")
plt.xlabel("Tempo (ms)")
plt.ylabel("Tensão (V)")
plt.legend()
plt.grid(True)

# Salvar o gráfico em PDF
plt.savefig(filename)
plt.close()  # Fechar a figura para liberar recursos
