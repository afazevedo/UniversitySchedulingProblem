using SQLite

function criarTabelas(db)
    @assert typeof(db) == SQLite.DB "DB must be of type SQLite.DB"

    println("Criando tabelas do banco de dados...")

    SQLite.execute(db, """
        CREATE TABLE IF NOT EXISTS disciplinas
        (codigo_disciplina text not null, horario text not null, dias_semana text not null, creditos integer not null)
    """)

    SQLite.execute(db, """
        CREATE TABLE IF NOT EXISTS professores
        (matricula integer not null, nome text not null)
    """)

    SQLite.execute(db, """
        CREATE TABLE IF NOT EXISTS preferencias
        (matricula integer not null, codigo_disciplina text not null)
    """)

    println("Pronto. Tabelas criadas: disciplinas, professores e preferências")

    return nothing
end