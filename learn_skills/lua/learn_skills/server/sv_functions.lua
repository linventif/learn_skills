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

function naruto_skills(ply)
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
    net.Start("naruto_skills")
    net.Send(ply) 
end

function naruto_skills_admin(ply)
    local table = {}
    for i, v in ipairs(player.GetAll()) do
        if file.Exists("linventif/learn_skills/players/" .. v:SteamID64() .. ".json", "data") then
            local table_ply = {
                [tostring(v:SteamID64())] = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. v:SteamID64() .. ".json", "DATA"))
            }
            PrintTable(table_ply)
            print(" - - ")
            table.Add(table_ply, table)
            PrintTable(table)
            print(" - - ")
        else
            naruto_notif(ply, "Erreur Data Serveur", 1, 4)
        end
    end
    net.Start("naruto_skills_admin")
    net.WriteTable(table)
    net.Send(ply) 
end


local table = {
    ["Chakra"]  =  853,
    ["Nature"]  =  "Doton"
}
local table_2 = {
    ["Chakra"]  =  000,
    ["Nature"]  =  "DAton"
}
table.Add(table_2, table)
PrintTable(table_2)