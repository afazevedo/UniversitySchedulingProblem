import sqlite3 # interação com o banco de dados sqlite
import conf_excel
dbDir = conf_excel.dbDir

def criarTabelas(con, cur):
    """Cria tabelas com as entidades relevantes no banco de dados e registra estas alterações em uma operação de commit."""

    if(not isinstance(con, sqlite3.Connection)):
        raise ValueError("Conexão ao banco de dados (con) de tipo inválido. Deve ser sqlite3.Connection.")

    if(not isinstance(cur, sqlite3.Cursor)):
        raise ValueError("Cursor do banco de dados (cur) de tipo inválido. Deve ser sqlite3.Cursor.")

    print("Criando tabelas do banco de dados...")

    cur.execute('''CREATE TABLE IF NOT EXISTS disciplinas
                   (codigo_disciplina text not null, horario text not null, dias_semana text not null, creditos integer not null)''')

    cur.execute('''CREATE TABLE IF NOT EXISTS professores
                   (matricula integer not null, nome text not null)''')
    
    cur.execute('''CREATE TABLE IF NOT EXISTS preferencias
                   (matricula integer not null, codigo_disciplina text not null)''')

    print("Pronto. Tabelas criadas: disciplinas, professores e preferências")

    # Salvar as alterações
    con.commit()
