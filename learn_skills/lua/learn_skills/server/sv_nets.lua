util.AddNetworkString("naruto_skills")
util.AddNetworkString("naruto_skills_admin")
util.AddNetworkString("naruto_message")
util.AddNetworkString("naruto_skills_learn_server")
util.AddNetworkString("naruto_skills_learn_client")
util.AddNetworkString("naruto_skills_learn_a")
util.AddNetworkString("skills_learning")
util.AddNetworkString("skills_teatching")
util.AddNetworkString("skills_teatching_end")
util.AddNetworkString("skills_message")

timer.Create("Auto_Skills", 360, 0, function()
    for k, ply in pairs(player.GetAll()) do
        local points = 0
        local chakra = 0
        if Learn_Skills.BoostGroup[ply:GetUserGroup()] then
            points = math.random(4, 10)
            chakra = math.random(12, 24)
        else
            points = math.random(2, 5)
            chakra = math.random(6, 12)
        end
        ply:PS_GivePoints(points)
        local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez automatiquement reçu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = points .. " Super Points", ["color_3"] = Color(255, 255, 255), ["string_3"] = " pour avoir joué sur le serveur." }

        if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA") then
            local table = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
            if table.Chakra < 15000 then
                if (table.Chakra + chakra) > 15000 then
                    table.Chakra = 15000
                else
                    table.Chakra = table.Chakra + chakra
                end
                message.color_3 = Color(255, 255, 255)
                message.string_3 = " ainsi que "
                message.color_4 = Color(255, 100, 0)
                message.string_4 = chakra .. " Points de Chakra"
                message.color_5 = Color(255, 255, 255)
                message.string_5 = " pour avoir joué sur le serveur."
                file.Write("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", util.TableToJSON(table))
            end

            local job_limit = Learn_Skills.Config.Chakra_Limit_By_Job[team.GetName(ply:Team())]
            if job_limit && (table.Chakra > job_limit) then
                print(table.Chakra)
                ply:SetNWInt("BCMaxMana", job_limit)
                if (ply:GetNWInt("BCMana") + chakra) <= job_limit then
                    ply:SetNWInt("BCMana", ply:GetNWInt("BCMana") + chakra)
                else
                    ply:SetNWInt("BCMana", job_limit)
                end
            else
                ply:SetNWInt("BCMaxMana", table.Chakra)
                ply:SetNWInt("BCMana", ply:GetNWInt("BCMana") + chakra)
            end
        end
        skills_message(ply, message)
    end
end)

net.Receive("naruto_skills_learn_server", function(len, ply)
    local ply_data = net.ReadTable()
    ply_data.instructor = ply
    if ply:GetWeapon(ply_data.wep):IsValid() then
        net.Start("naruto_skills_learn_client")
        net.WriteTable(ply_data)
        net.Send(ply_data.ply)
    else
        naruto_notif(ply, "Armes Invalide !", 1, 4)
    end
end)

net.Receive("naruto_skills_learn_a", function(len, ply)
    local ply_data = net.ReadTable()
    ply_data.ply = ply

    net.Start("skills_teatching")
    net.WriteTable(ply_data)
    net.Send(ply_data.instructor)

    net.Start("skills_learning")
    net.WriteTable(ply_data)
    net.Send(ply_data.ply)

    hook.Run("learn_skills_learn", ply_data.ply, ply_data.wep, ply_data.time, ply_data.instructor)
end)

net.Receive("skills_teatching_end", function(len, ply)
    local ply_data = net.ReadTable()
    if ply_data.succes then
        --PrintTable(ply_data)
        naruto_notif(ply_data.ply, "Bravo vous avez réusit a apprendre " .. ply_data.wep .. " !", 0, 4)
        local ply_data_table = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply_data.ply:SteamID64() .. ".json", "DATA"))
        if ply_data_table.Weapons then
            table.insert(ply_data_table.Weapons, ply_data.wep)
        else
            ply_data_table.Weapons = {ply_data.wep}
        end
        file.Write("linventif/learn_skills/players/" .. ply_data.ply:SteamID64() .. ".json", util.TableToJSON(ply_data_table))
        ply_data.ply:Give(ply_data.wep)
        if Learn_Skills.Advert then
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = ply_data.ply:Nick() .. " a appris avec succes ", ["color_2"] = Color(108, 216, 216), ["string_2"] = ply_data.wep }
            net.Start("skills_message")
            net.WriteString(util.TableToJSON(message))
            net.Broadcast()
        end
    else
        naruto_notif(ply_data.ply, "Malheresement vous n'avez pas réusit a apprendre " .. ply_data.wep .. " !", 0, 4)
    end
end)


util.AddNetworkString("naruto_reroll")
net.Receive("naruto_reroll", function(len, ply)
    if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") then
        local table = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
        if table.Reroll > 0 then
            table.Reroll = table.Reroll -1
            table.Nature = skills_nature()
            file.Write("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", util.TableToJSON(table))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Votre nature a changé, vous êtes maintenant un ", ["color_2"] = Color(255, 100, 0), ["string_2"] = table.Nature}
            skills_message(ply, message)
            hook.Run("learn_skills_reroll", ply, table.Nature)
        else
            naruto_notif(ply, "Vous n'avez pas assez de Reroll !", 1, 4)
        end
    else
        naruto_notif(ply, "Erreur Data Serveur", 1, 4)
    end
end)

util.AddNetworkString("skills_cmd")
net.Receive("skills_cmd", function(len, ply)
    local cmd_args = util.JSONToTable(net.ReadString())
    cmd_args.target = net.ReadEntity()
    if Learn_Skills.Config.Admin_Group[ply:GetUserGroup()] && cmd_args.target:IsValid() then
        if cmd_args.cmd == "skills_reset" then
            local skills_info = {
                ["Nature"] = skills_nature(),
                ["Chakra"] = math.random(Learn_Skills.Config.Random_Chakra_Min, Learn_Skills.Config.Random_Chakra_Max),
                ["Reroll"] = 2
            }
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez étais Role Play Kill, une nouvelle aventure commence pour vous."}
            skills_message(cmd_args.target, message)
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Votre aventure commence en temps que ", ["color_2"] = Color(255, 100, 0), ["string_2"] = skills_info.Nature, ["color_3"] = Color(255, 255, 255), ["string_3"] = " plus d'info dans le /skills."}
            skills_message(cmd_args.target, message, 4)
            naruto_notif(ply, "Vous avez Role PLay Kill " .. cmd_args.target:Nick(), 0, 4)
            cmd_args.target:KillSilent()
            cmd_args.target:Spawn()
            print(cmd_args.target)
            hook.Run("learn_skills_reset", ply, cmd_args.target)
        elseif cmd_args.cmd == "skills_weapon_give" then
            cmd_args.target:Give(cmd_args.value)
            local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
            if skills_info.Weapons then
                table.insert(skills_info.Weapons, cmd_args.value)
            else
                skills_info.Weapons = {cmd_args.value}
            end
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez reçu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = "."}
            skills_message(cmd_args.target, message)
            naruto_notif(ply, "Vous avez donner " .. cmd_args.value .. " a " .. cmd_args.target:Nick(), 0, 4)
            hook.Run("learn_skills_weapon_give", ply, cmd_args.target, cmd_args.value)
        elseif cmd_args.cmd == "skills_weapon_remove" then
            cmd_args.target:StripWeapon(cmd_args.value)
            local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
            if skills_info.Weapons then
                for k, v in pairs(skills_info.Weapons) do
                    if v == cmd_args.value then
                        table.remove(skills_info.Weapons, k)
                    end
                end
            else
                local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Le joueurs ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.target:Nick(), ["color_3"] = Color(255, 255, 255), ["string_3"] = " n'a pas de appris ", ["color_4"] = Color(255, 100, 0), ["string_4"] = cmd_args.value}
                skills_message(ply, message)
            end
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez perdu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = "."}
            skills_message(cmd_args.target, message)
            naruto_notif(ply, "Vous avez enlever " .. cmd_args.value .. " a " .. cmd_args.target:Nick(), 0, 4)
            hook.Run("learn_skills_weapon_remove", ply, cmd_args.target, cmd_args.value)
        elseif cmd_args.cmd == "skills_weapon_reset" then
            local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
            skills_info.Weapons = {}
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez perdu tout vos armes."}
            skills_message(cmd_args.target, message)
            naruto_notif(ply, "Vous avez enlever tout les armes de " .. cmd_args.target:Nick(), 0, 4)
            hook.Run("learn_skills_weapon_reset", ply, cmd_args.target)
        elseif cmd_args.cmd == "skills_chakra_give" then
            cmd_args.value = util.StringToType(cmd_args.value, "int")
            local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
            if (skills_info.Chakra + cmd_args.value) > Learn_Skills.Chakra_Limit then
                cmd_args.value = Learn_Skills.Chakra_Limit - skills_info.Chakra
            end
            cmd_args.target:SetNWInt("BCMaxMana", skills_info.Chakra + cmd_args.value)
            cmd_args.target:SetNWInt("BCMana", cmd_args.target:GetNWInt("BCMana") + cmd_args.value)
            skills_info.Chakra = skills_info.Chakra + cmd_args.value
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez reçu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = " de Chakra."}
            skills_message(cmd_args.target, message)
            naruto_notif(ply, "Vous avez donné " .. cmd_args.value .. " de Chakra a " .. cmd_args.target:Nick(), 0, 4)
            hook.Run("learn_skills_chakra_give", ply, cmd_args.target, cmd_args.value)
        elseif cmd_args.cmd == "skills_chakra_remove" then
            cmd_args.value = util.StringToType(cmd_args.value, "int")
            local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
            if (skills_info.Chakra - cmd_args.value) < 0 then
                skills_info.Chakra = 0
            else
                skills_info.Chakra = skills_info.Chakra - cmd_args.value
            end
            cmd_args.target:SetNWInt("BCMaxMana", skills_info.Chakra)
            cmd_args.target:SetNWInt("BCMana", cmd_args.target:GetNWInt("BCMana") - cmd_args.value)
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez perdu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = " de Chakra."}
            skills_message(cmd_args.target, message)
            naruto_notif(ply, "Vous avez enlever " .. cmd_args.value .. " de Chakra a " .. cmd_args.target:Nick(), 0, 4)
            hook.Run("learn_skills_chakra_remove", ply, cmd_args.target, cmd_args.value)
        elseif cmd_args.cmd == "skills_chakra_reset" then
            local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
            skills_info.Chakra = math.random(Learn_Skills.Config.Random_Chakra_Min, Learn_Skills.Config.Random_Chakra_Max)
            cmd_args.target:SetNWInt("BCMaxMana", skills_info.Chakra)
            cmd_args.target:SetNWInt("BCMana", skills_info.Chakra)
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez perdu tout votre Chakra."}
            skills_message(cmd_args.target, message)
            naruto_notif(ply, "Vous avez enlever tout le Chakra de " .. cmd_args.target:Nick(), 0, 4)
            hook.Run("learn_skills_chakra_reset", ply, cmd_args.target)
        elseif cmd_args.cmd == "skills_chakra_set" then
            cmd_args.value = util.StringToType(cmd_args.value, "int")
            local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
            cmd_args.target:SetNWInt("BCMaxMana", cmd_args.value)
            cmd_args.target:SetNWInt("BCMana", cmd_args.value)
            skills_info.Chakra = cmd_args.value
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez étais set a ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = " de Chakra."}
            skills_message(cmd_args.target, message)
            naruto_notif(ply, "Vous avez donné " .. cmd_args.value .. " de Chakra a " .. cmd_args.target:Nick(), 0, 4)
            hook.Run("learn_skills_chakra_set", ply, cmd_args.target, cmd_args.value)
        elseif Learn_Skills.Config.Admin_Group[ply:GetUserGroup()] then
            if cmd_args.cmd == "skills_nature_set" then
                local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
                if Learn_Skills.Config.Natures[cmd_args.value] then
                    skills_info.Nature = cmd_args.value
                    file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
                    local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez reçu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = " de Nature."}
                    skills_message(cmd_args.target, message)
                    naruto_notif(ply, "Vous avez donné " .. cmd_args.value .. " de Nature a " .. cmd_args.target:Nick(), 0, 4)
                    hook.Run("learn_skills_nature_set", ply, cmd_args.target, cmd_args.value)
                else
                    naruto_notif(ply, "Impossible de définir la nature de " .. cmd_args.target:Nick() .. " a " .. cmd_args.value, 0, 4)
                    local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Impossible de définir la nature de ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.target:Nick(), ["color_3"] = Color(255, 255, 255), ["string_3"] = " a ", ["color_4"] = Color(255, 100, 0), ["string_4"] = cmd_args.value}
                    skills_message(ply, message)
                end
            elseif cmd_args.cmd == "skills_reroll_give" then
                cmd_args.value = util.StringToType(cmd_args.value, "int")
                local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
                skills_info.Reroll = skills_info.Reroll + cmd_args.value
                file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
                local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez reçu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = " de Reroll."}
                skills_message(cmd_args.target, message)
                naruto_notif(ply, "Vous avez donné " .. cmd_args.value .. " de Reroll a " .. cmd_args.target:Nick(), 0, 4)
                hook.Run("learn_skills_reroll_give", ply, cmd_args.target, cmd_args.value)
            elseif cmd_args.cmd == "skills_reroll_set" then
                cmd_args.value = util.StringToType(cmd_args.value, "int")
                local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
                skills_info.Reroll = cmd_args.value
                file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
                local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez reçu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = " de Reroll."}
                skills_message(cmd_args.target, message)
                naruto_notif(ply, "Vous avez donné " .. cmd_args.value .. " de Reroll a " .. cmd_args.target:Nick(), 0, 4)
                hook.Run("learn_skills_reroll_set", ply, cmd_args.target, cmd_args.value)
            elseif cmd_args.cmd == "skills_reroll_reset" then
                local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
                skills_info.Reroll = 2
                file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
                local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez reçu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = " de Reroll."}
                skills_message(cmd_args.target, message)
                naruto_notif(ply, "Vous avez donné " .. cmd_args.value .. " de Reroll a " .. cmd_args.target:Nick(), 0, 4)
                hook.Run("learn_skills_reroll_set", ply, cmd_args.target, cmd_args.value)
            elseif cmd_args.cmd == "skills_reroll_remove" then
                cmd_args.value = util.StringToType(cmd_args.value, "int")
                local skills_info = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", "DATA"))
                if (skills_info.Reroll - cmd_args.value) < 0 then
                    skills_info.Reroll = 0
                else
                    skills_info.Reroll = skills_info.Reroll - cmd_args.value
                end
                file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
                local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez reçu ", ["color_2"] = Color(255, 100, 0), ["string_2"] = cmd_args.value, ["color_3"] = Color(255, 255, 255), ["string_3"] = " de Reroll."}
                skills_message(cmd_args.target, message)
                naruto_notif(ply, "Vous avez donné " .. cmd_args.value .. " de Reroll a " .. cmd_args.target:Nick(), 0, 4)
                hook.Run("learn_skills_reroll_remove", ply, cmd_args.target, cmd_args.value)
            end
        else
            naruto_notif(ply, "Commande Invalide", 1, 4)
        end
    else
        naruto_notif(ply, "Permission Insufisante", 1, 4)
    end
end)