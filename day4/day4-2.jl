raw = read("day4in", String)
dt = split(raw, "\n\n")
callsraw = dt[1]
boardsraw = view(dt, 2:length(dt))
calls = parse.(Int, split(callsraw, ","))

function parseboard(boardraw)
    rowsraw = split(boardraw, "\n")
    rows = map(rowsraw) do rowraw
        parse.(Int, split(rowraw))
    end
    transpose(reduce(hcat, rows))
end

function checkwin(board)
    any(mapslices(i->all(==(-1), i), board, dims=1)) || any(mapslices(i->all(==(-1), i), board, dims=2)) 
end

function play!(boards, calls)
    lastwin = nothing
    for call in calls
        replace!.(boards, call => -1)
        idx = findfirst(checkwin, boards)
        lastwin = idx === nothing ? lastwin : boards[idx]
        filter!(!checkwin, boards)
        if length(boards) == 0
            return lastwin, call
        end
    end
    return lastwin, calls[end]
end

boards = parseboard.(boardsraw)
lastwin, lastcall =  play!(boards, calls)

sum(i->i==-1 ? 0 : i, lastwin)*lastcall
