function naruto_net(ply, string, notif, time, int)
--    if int == 1 then
--        local table = {
--            ["string"] = string,
--            ["notif"] = notif,
--            ["time"] = time
--        }
--    elseif int == 2 then
--    elseif int == 3 then
--    end
    net.Start("naruto_net_to_client")
    net.WriteInt(int, 3)
    net.WriteTable(table)
    net.Send(ply)
end

function naruto_table(ply, table)
    net.Start("naruto_table")
    net.WriteTable(table)
    net.Send(ply) 
end

function naruto_skills(ply, caller)
--    if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") then
--        local table_data = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
--        
--        local weapons_learn = Learn_Skills.Technical[table_data.Nature]
--        for k, v in pairs(table_data.Weapons) do 
--            if weapons_learn[v] then
--                table.insert(table_info.Weapons, v)
--            end
--        end
--
--        net.Start("naruto_skills")
--        net.WriteString(table_data.Chakra)
--        net.WriteString(table_data.Nature)
--        net.WriteTable(weapons)
--        net.Send(ply)
--    else
--        naruto_notif(ply, "Erreur Data Serveur", 1, 4)
--    end
print("ok")
end