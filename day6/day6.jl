fish = parse.(Int32, split(read("day6in", String), ","))
for i in 1:256
    fish .-= Int32(1)
    newfish = count(==(-1), fish)
    replace!(fish, -1=>6)
    append!(fish, fill(Int32(8), newfish))
    if i%20 == 0
        println(i)
    end
end

println(length(fish))

