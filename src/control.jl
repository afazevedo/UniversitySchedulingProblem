include("create_sql.jl")
include("read_data.jl")

"""
Structure for Controlling the program.

Author: Amanda Azevedo
"""

function Control(config)
    # # Create the database
    # con = SQLite.DB(config.dbPath) # Open the database
    # criarTabelas(con) # Create the tables

    # Read the data
    discDict, diasDaSemana, horarios, professores = leituraCadastro(config)
    
    
end
