using SQLite, XLSX, DataFrames


function leituraCadastro(config)
    path = config.planilhaCadastro["CAMINHO"]
    aba = config.planilhaCadastro["ABA_PROF"][1]
    inicio = config.planilhaCadastro["ABA_PROF"][2]
    fim = config.planilhaCadastro["ABA_PROF"][3]
    
    # Convert to DataFrame
    cadastroProf = DataFrame(XLSX.readdata(
        path, # Path to the file
        aba, # Sheet name
        inicio*":"*fim # Range of cells
        ), :auto)

    aba = config.planilhaCadastro["ABA_DISC"][1]
    inicio = config.planilhaCadastro["ABA_DISC"][2]
    fim = config.planilhaCadastro["ABA_DISC"][3]

    # Convert to DataFrame
    cadastroDisc = DataFrame(XLSX.readdata(
        path, # Path to the file
        aba, # Sheet name
        inicio*":"*fim, # Range of cells
        ), :auto)

    # Drop first row 
    cadastroProf = cadastroProf[7:end, :]
    cadastroDisc = cadastroDisc[7:end, :]

    # give a name to the columns
    rename!(cadastroProf, :x1 => :ListaDeProfessores)
    rename!(cadastroProf, :x2 => :Matricula)
    rename!(cadastroDisc, :x1 => :ListaDeDisciplinas)
    rename!(cadastroDisc, :x2 => :Codigo)
    rename!(cadastroDisc, :x3 => :Horario)
    rename!(cadastroDisc, :x4 => :DiadaSemana)
    rename!(cadastroDisc, :x5 => :Créditos)

    # Drop rows with missing values
    dropmissing!(cadastroDisc)

    # Create the dicts 
    profDict = Dict()

    # 'Codigo: [Horario, DiaDaSemana, Créditos]'
    discDict = Dict()
    for i in eachindex(cadastroDisc[:, :Codigo])
        discDict[cadastroDisc[i, :Codigo]] = [cadastroDisc[i, :Horario], cadastroDisc[i, :DiadaSemana], cadastroDisc[i, :Créditos]]
    end

    # List of possible days of week 
    diasDaSemana = unique(cadastroDisc[:, :DiadaSemana])[2:end]

    # List of possible hours
    horarios = unique(cadastroDisc[:, :Horario])[2:end]

    # list of teachers
    professores = unique(cadastroProf[:, :ListaDeProfessores])

    return discDict, diasDaSemana, horarios, professores
end