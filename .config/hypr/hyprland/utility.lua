


function hostname ()
    os.execute("hostnamectl > hostname")
    local lines = {}
    for line in io.lines("hostname") do
        lines[#lines+1] = line
    end

    local words = {}
    for i in string.gmatch(lines[1], "%S+") do table.insert(words, i) end

    os.execute("rm hostname")
    return words[3]

end
