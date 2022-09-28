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

            local job_limit = Learn_Skills.Chakra_Limit_Job[team.GetName(ply:Team())]
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
    if Learn_Skills.UserGroup[ply:GetUserGroup()] then
        cmd_args.target = net.ReadEntity()
        if cmd_args.cmd == "skills_reset" && cmd_args.target:IsValid() then
            local skills_info = {
                ["Nature"] = skills_nature(),
                ["Chakra"] = math.random(600, 1000),
                ["Reroll"] = 2
            }
            file.Write("linventif/learn_skills/players/" .. cmd_args.target:SteamID64() .. ".json", util.TableToJSON(skills_info))
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez étais Role Play Kill, une nouvelle aventure commence pour vous."}
            skills_message(cmd_args.target, message)
            local message = {
                ["color_1"] = Color(255, 255, 255), ["string_1"] = "Votre aventure commence en temps que ",
                ["color_2"] = Color(255, 100, 0), ["string_2"] = skills_info.Nature,
                ["color_3"] = Color(255, 255, 255), ["string_3"] = " plus d'info dans le /skills.",
            }
            skills_message(cmd_args.target, message, 4)
            naruto_notif(ply, "Vous avez Role PLay Kill " .. cmd_args.target:Nick(), 0, 4)
            cmd_args.target:KillSilent()
            cmd_args.target:Spawn()
            print(cmd_args.target)
            hook.Run("learn_skills_reste", ply, cmd_args.target)
        else
            naruto_notif(ply, "Commande Invalide", 1, 4)
        end
    else
        naruto_notif(ply, "Permission Insufisante", 1, 4)
    end
end)