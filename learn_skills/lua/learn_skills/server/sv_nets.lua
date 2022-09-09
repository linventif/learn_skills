util.AddNetworkString("naruto_skills")
util.AddNetworkString("naruto_skills_admin")
util.AddNetworkString("naruto_message")
util.AddNetworkString("naruto_table")
util.AddNetworkString("naruto_skills_learn_server")
util.AddNetworkString("naruto_skills_learn_client")
util.AddNetworkString("naruto_skills_learn_a")

net.Receive("naruto_skills_learn_server", function(len, ply)
    local ply_data = net.ReadTable()
    ply_data.instructor = ply
    net.Start("naruto_skills_learn_client")
    net.WriteTable(ply_data)
    net.Send(ply_data.ply)
end)

net.Receive("naruto_skills_learn_a", function(len, ply)
    local ply_data = net.ReadTable()
    ply_data.ply = ply

    hook.Run("learn_skills_logs", ply_data.ply, ply_data.wep, ply_data.time, ply_data.instructor)
end)


util.AddNetworkString("naruto_reroll")
net.Receive("naruto_reroll", function(len, ply)
    if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") then
        local table = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
        if table.Reroll > 0 then
            table.Reroll = table.Reroll -1
            table.Nature = math.random(1, 200)
            if table.Nature == 1 then
                table.Nature = "Futton"
            elseif table.Nature == 2 then
                table.Nature = "Jinton"
            elseif table.Nature == 3 then
                table.Nature = "Jiton Dorée"
            elseif table.Nature == 4 then
                table.Nature = "Shoton"
            elseif table.Nature == 5 then
                table.Nature = "Bakuton"
            elseif table.Nature == 6 then
                table.Nature = "Shakuton"
            elseif table.Nature == 7 then
                table.Nature = "Ranton"
            elseif table.Nature == 8 then
                table.Nature = "Puple Raiton"
            elseif table.Nature > 8 and table.Nature < 47 then
                table.Nature = "Futon"
            elseif table.Nature > 46 and table.Nature < 85 then
                table.Nature = "Doton"
            elseif table.Nature > 84 and table.Nature < 121 then
                table.Nature = "Katon"
            elseif table.Nature > 120 and table.Nature < 161 then
                table.Nature = "Suiton"
            else
                table.Nature = "Raiton"
            end
            file.Write("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", util.TableToJSON(table))
            naruto_notif(ply, "Vous avez utuliser un reroll vous êtes maintenant un " .. table.Nature .. " !", 0, 4)
        else
            naruto_notif(ply, "Vous n'avez pas assez de Reroll !", 1, 4)
        end
    else
        naruto_notif(ply, "Erreur Data Serveur", 1, 4)
    end
end)


util.AddNetworkString("naruto_cmd")
net.Receive("naruto_cmd", function(len, ply)
    naruto_skills(ply)
end)
--[[

net.Receive("naruto_cmd", function(len, ply)
    if (ply:IsPlayer() and Learn_Skills.UserGroup[ply:GetUserGroup()]) then
        local net_var = {}
        net_var.cmd = net.ReadString()
        net_var.traget_ply = net.ReadEntity()
        if net.ReadBool() then
            net_var.value = net.ReadString()
        else
            net_var.value = net.ReadInt(32)
        end
        if file.Exists("linventif/learn_skills/players/" .. net_var.traget_ply:SteamID64() .. ".json", "data") then
            local table_data = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. net_var.traget_ply:SteamID64() .. ".json", "DATA"))
            if net_var.cmd == "naruto_reset" then
                local table = {
                    ["Nature"]  = math.random(1, 5),
                    ["Chakra"]  = math.random(600, 1000)
                } 
    
                if table.Nature == 1 then
                    table.Nature = math.random(1, 50)
                    if table.Nature == 1 then
                        table.Nature = "Futton"
                    elseif table.Nature == 2 then
                        table.Nature = "Jiton_Dorée"
                    elseif table.Nature == 3 then
                        table.Nature = "Jinton"
                    else
                        table.Nature = "Futon"
                    end
                elseif table.Nature == 2 then
                    table.Nature = math.random(1, 50)
                    if table.Nature == 1 then
                        table.Nature = "Bakuton"
                    elseif table.Nature == 2 then
                        table.Nature = "Jinton "
                    elseif table.Nature == 3 then
                        table.Nature = "Shoton"
                    else
                        table.Nature = "Doton"
                    end
                elseif table.Nature == 3 then
                    table.Nature = math.random(1, 50)
                    if table.Nature == 1 then
                        table.Nature = "Shakuton"
                    elseif table.Nature == 2 then
                        table.Nature = "Jinton"
                    else
                        table.Nature = "Katon"
                    end
                elseif table.Nature == 4 then
                    table.Nature = math.random(1, 50)
                    if table.Nature == 1 then
                        table.Nature = "Ranton"
                    elseif table.Nature == 2 then
                        table.Nature = "Futton"
                    else
                        table.Nature = "Suiton"
                    end
                else
                    table.Nature = math.random(1, 50)
                    if table.Nature == 1 then
                        table.Nature = "Bakuton"
                    elseif table.Nature == 2 then
                        table.Nature = "Ranton"
                    elseif table.Nature == 3 then
                        table.Nature = "Puple_Raiton"
                    else
                        table.Nature = "Raiton"
                    end
                end
            
                file.Write("linventif/learn_skills/players/" .. net_var.traget_ply:SteamID64() .. ".json", util.TableToJSON(table))
                naruto_notif(net_var.traget_ply, false, false, false, table)
            elseif net_var.cmd == "naruto_chakra_add" then
                table_data.Chakra = table_data.Chakra + net_var.value
                file.Write("linventif/learn_skills/players/" .. net_var.traget_ply:SteamID64() .. ".json", util.TableToJSON(table_data))
                naruto_notif(net_var.traget_ply, "Un Staff a modifier votre chakra il est maintenant de " .. util.TypeToString(table_data.Chakra), 0, 4)
            elseif net_var.cmd == "naruto_chakra_set" then
                table_data.Chakra = net_var.value
                file.Write("linventif/learn_skills/players/" .. net_var.traget_ply:SteamID64() .. ".json", util.TableToJSON(table_data))
                naruto_notif(net_var.traget_ply, "Un Staff a modifier votre chakra il est maintenant de " .. util.TypeToString(table_data.Chakra), 0, 4)
            elseif net_var.cmd == "naruto_chakra_reset" then
                table_data.Chakra = math.random(600, 1000)
                file.Write("linventif/learn_skills/players/" .. net_var.traget_ply:SteamID64() .. ".json", util.TableToJSON(table_data))
                naruto_notif(net_var.traget_ply, "Un Staff a modifier votre chakra il est maintenant de " .. util.TypeToString(table_data.Chakra), 0, 4)
            elseif net_var.cmd == "naruto_weapons_add" then
                table.insert(table_data.Weapons, net_var.value)
                file.Write("linventif/learn_skills/players/" .. net_var.traget_ply:SteamID64() .. ".json", util.TableToJSON(table_data))
                naruto_notif(net_var.traget_ply, "Un Staff vous a ajoutez un.e " .. net_var.value .. " de manière permanente.", 0, 4)
            elseif net_var.cmd == "naruto_info" then
                naruto_notif(ply, false, false, false, table_data)
                naruto_notif(ply, "Data reçus regarder votre console.", 0, 4)
            end
        else
            naruto_notif(ply, "Erreur Data Serveur", 1, 4)
        end
    else
        naruto_notif(ply, "Acces Refuser", 1, 4)
    end
end)

]]--