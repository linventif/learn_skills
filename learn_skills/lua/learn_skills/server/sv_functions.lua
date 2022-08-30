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

function naruto_skills(ply)
    if Learn_Skills.Team[team.GetName(ply:Team())] then
        print("é")
    else
        if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") then
            local table_data = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
            net.Start("naruto_skills")
            net.WriteTable(table_data)
            net.Send(ply) 
        else
            naruto_notif(ply, "Erreur Data Serveur", 1, 4)
        end
    end
end

function naruto_skills_admin(ply)
    local table_data = {}
    for i, v in ipairs(player.GetAll()) do
        if file.Exists("linventif/learn_skills/players/" .. v:SteamID64() .. ".json", "data") then
            local table_ply = {
                [v] = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. v:SteamID64() .. ".json", "DATA"))
            }
            table.Merge(table_data, table_ply)
        else
            naruto_notif(ply, "Erreur Data Serveur", 1, 4)
        end
    end
    net.Start("naruto_skills_admin")
    net.WriteTable(table_data)
    net.Send(ply) 
end