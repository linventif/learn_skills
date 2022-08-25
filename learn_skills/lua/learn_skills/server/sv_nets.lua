util.AddNetworkString("learn_skill_open")
util.AddNetworkString("naruto_cmd")
util.AddNetworkString("naruto_message")
util.AddNetworkString("naruto_table")

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
                    ["Chakra"]  = math.random(600, 1000),
                    ["Weapons"] = {}
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
                naruto_table(traget_ply, table)
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
                naruto_table(ply, table_data)
                naruto_notif(ply, "Data reçus regarder votre console.", 0, 4)
            end
        else
            naruto_notif(ply, "Erreur Data Serveur", 1, 4)
        end
    else
        naruto_notif(ply, "Acces Refuser", 1, 4)
    end
end)

net.Receive("learn_skill_open", function()
    LocalPlayer():ChatPrint("message")
end)

net.Receive("naruto_chakra_set", function(len, ply)
end)

net.Receive("naruto_chakra_reset", function(len, ply)
end)