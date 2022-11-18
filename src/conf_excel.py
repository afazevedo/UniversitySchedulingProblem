import os
import sys

path = os.path.dirname(os.path.abspath(__file__))
sys.path.append(path)

dbDir = "D:\\Documents\\GitHub\\UniversitySchedulingProblem\\banco"

planilhaFormulario = {"NOME_ARQUIVO": path + "\\Cadastro.xlsm",
"ABA": "Agentes",
"COLUNA_NOME": 1,
"COLUNA_TIPO": 2,
}
