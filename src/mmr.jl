function mmr(query, sim1, sim2; lambda=0.5)
    @assert size(sim1) == size(sim2)

    N = size(sim1, 1)
    items = Set{Int}(1:N)
    set_selected = Set{Int}()
    selected = Int[]

    while length(selected) != size(sim1, 1)
        remaining = setdiff(items, set_selected)

        if isempty(selected)
            mmr_score = [lambda * sim1[query, k] for k in 1:N]
        else
            mmr_score = [
                k in set_selected ?
                0 :
                lambda * sim1[query, k] + (1 - lambda) * sim2[query, k]
                for k in 1:N
            ]
        end
        j = argmax(mmr_score)
        push!(selected, j)
        push!(set_selected, j)
    end

    selected

end