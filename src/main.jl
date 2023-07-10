"""
Main program file.

Author: Amanda Azevedo
"""

using Dates
include("control.jl")
include("parameters.jl")

function main()
    # Path to the directory
    path = pwd() * "/"

    # Initialize the time counter
    start = time()
    start_date = Dates.now()

    try
        # Create an instance of Config and Control
        config = Config()
        control = Control(config)
    catch e
        @error "Execution error, see erro.txt for details"
        open("erro.txt", "w") do f
            write(f, sprint(showerror, e))
        end
        # exit(1)
    end

    elapsed = time() - start

    println("Finished - Total Time: $(round(Int, elapsed)) seconds")
end

# Call the main function
main()