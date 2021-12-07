data = map(i->[i[1], parse(Int, i[2])], split.(readlines("day2in")))
dict = Dict("forward"=>0, "up"=>1im, "down"=>-1im)
k = foldl(data, init=(0im, 1)) do old, i
    ((i[1]=="forward" ? old[1] + i[2] * old[2] : old[1]), (old[2]+dict[i[1]]*i[2]))
end
println(- real(k[1]) * imag(k[1]))
