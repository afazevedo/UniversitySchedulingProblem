using Parameters

@with_kw mutable struct Config
    dbPath::String = joinpath(joinpath(pwd(), "banco"), "bancoSimulador.db")
    planilhaCadastro::Dict{String,Any} = Dict(
        "CAMINHO" => joinpath(joinpath(pwd(), "planilhas"), "cadastro.xlsx"),
        "ABA_PROF" => ["Lista de Professores", "A", "B"],
        "ABA_DISC" => ["Lista de Disciplinas", "A", "E"]
    )
end