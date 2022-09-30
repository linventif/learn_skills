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
function skills_message(ply, message, delay)
    net.Start("skills_message")
    net.WriteString(util.TableToJSON(message))
    if delay then net.WriteInt(delay, 5) end
    net.Send(ply)
end

function naruto_skills(ply)
    if Learn_Skills.Team[team.GetName(ply:Team())] then
        naruto_skills_admin(ply)
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

function skills_nature()
    local nature = math.random(1, 200)
    if nature == 1 then
        nature = "Futton"
    elseif nature == 2 then
        nature = "Jinton"
    elseif nature == 3 then
        nature = "Jiton Dorée"
    elseif nature == 4 then
        nature = "Shoton"
    elseif nature == 5 then
        nature = "Bakuton"
    elseif nature == 6 then
        nature = "Shakuton"
    elseif nature == 7 then
        nature = "Ranton"
    elseif nature == 8 then
        nature = "Puple Raiton"
    elseif nature > 8 and nature < 47 then
        nature = "Futon"
    elseif nature > 46 and nature < 85 then
        nature = "Doton"
    elseif nature > 84 and nature < 121 then
        nature = "Katon"
    elseif nature > 120 and nature < 161 then
        nature = "Suiton"
    else
        nature = "Raiton"
    end
    return nature
end