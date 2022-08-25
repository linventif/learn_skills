function naruto_notif(ply, string, notif, time)
    local table = {
        ["string"] = string,
        ["notif"] = notif,
        ["time"] = time
    }
    net.Start("naruto_message")
    net.WriteTable(table)
    net.Send(ply) 
end

function naruto_table(ply, table)
    net.Start("naruto_table")
    net.WriteTable(table)
    net.Send(ply) 
end