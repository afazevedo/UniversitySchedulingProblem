"""
Arquivo de Controle do programa.

Autor: Amanda Azevedo
"""
import sqlite3 # interação com o banco de dados sqlite
import conf_excel
from create_sql import criarTabelas
dbDir = conf_excel.dbDir

class Control:
    def __init__(self, path, time):
        self.caminho = path
        self.start = time
        
    con = sqlite3.connect(dbDir + "\\bancoSimulador.db") # cria conexão ao banco de dados. Se o arquivo não existir, cria um.
    cur = con.cursor() # as operações são feitas através do cursor
    criarTabelas(con, cur)
