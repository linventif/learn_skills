function naruto_notif(data_table)
    notification.AddLegacy(data_table.string, data_table.notif, data_table.time)
    print(data_table.string)
end

function naruto_message(data_table)
    chat.AddText(Color(108, 216, 216), "Skills Learn | ", Color(255, 255, 255), data_table.string)
end

local function net_to_server(cmd, traget_ply, value)
    net.Start("naruto_cmd")
    net.WriteString(cmd)
    net.WriteEntity(traget_ply)
    if value then 
        if isstring(value) then
            net.WriteBool(true)
            net.WriteString(value)
        else
            net.WriteBool(false)
            net.WriteInt(value, 32)
        end
    end
    net.SendToServer()
end

--local function message(string, notif, time)
--    notification.AddLegacy(string, notif, time)
--    print(string)
--end