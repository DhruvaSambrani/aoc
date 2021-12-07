function parseline(line)
    points = split.(split(line, " -> "), ",")
    from, to = sort(map(points) do point
        CartesianIndex(parse.(Int, point)...)
    end)
    (from:to) .+ Ref(CartesianIndex(1,1))
end

function isline(crange)
    a,b = size(crange)
    isone(a)&&!iszero(b) || !iszero(a)&&isone(b)
end

lines = filter(isline, parseline.(readlines("day5in")))

boardsize = Tuple(maximum(maximum.(lines)))
board = zeros(Int, boardsize)
for line in lines
    board[line] .+= 1
end
board'
count(>=(2), board)