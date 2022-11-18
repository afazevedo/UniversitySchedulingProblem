"""
Arquivo principal do programa.

Autor: Amanda Azevedo
"""

import time
import sys
import traceback
import os

from control import Control

# Caminho do diretório
caminho = os.getcwd() + "\\"

# Inicializa o contador de tempo
start = time.process_time()
startDate = time.localtime()

try:    
    control = Control(path = caminho, time = startDate)
except:
    print("Erro de Execucao");
    print("Consulte o arquivo erro.txt")
    saidaResul = open(caminho + "erro.txt", "w", encoding='utf-8') # cria o arquivo txt de erro
    saidaResul.write(traceback.format_exc())
    sys.exit(1)
elapsed = time.process_time()
elapsed = elapsed - start

print("Concluido - Tempo Total: " + str(int(float(elapsed))) + " segundos")