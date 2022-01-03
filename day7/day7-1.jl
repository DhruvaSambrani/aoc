data = parse.(Int, split(read("day7in", String), ","))

posrange = minimum(data):maximum(data)

k = minimum(posrange) do pos
        sum(abs.(data .- pos))
    end

print(k)
