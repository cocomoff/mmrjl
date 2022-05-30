using Revise

include("./src/mmr.jl")

function main()
    N = 10
    query = 1
    mat1 = rand(N, N)
    mat2 = rand(N, N)
    q1 = mmr(query, mat1, mat2)
    q2 = mmr(query, mat1, mat2; lambda=1.0)
    println(q1)
    println(q2)
end