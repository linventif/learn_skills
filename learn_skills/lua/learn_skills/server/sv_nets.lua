util.AddNetworkString("naruto_skills")
util.AddNetworkString("naruto_skills_admin")
util.AddNetworkString("naruto_message")
util.AddNetworkString("naruto_table")
util.AddNetworkString("naruto_skills_learn_server")
util.AddNetworkString("naruto_skills_learn_client")
util.AddNetworkString("naruto_skills_learn_a")
util.AddNetworkString("skills_learning")
util.AddNetworkString("skills_teatching")
util.AddNetworkString("skills_teatching_end")
util.AddNetworkString("skills_advert")
util.AddNetworkString("skills_auto")
util.AddNetworkString("skills_init")
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
                ply:SetNWInt("BCMaxMana", table.Chakra)
                ply:SetNWInt("BCMana", ply:GetNWInt("BCMana") + chakra)
                message.color_3 = Color(255, 255, 255)
                message.string_3 = " ainsi que "
                message.color_4 = Color(255, 100, 0)
                message.string_4 = chakra .. " Points de Chakra"
                message.color_5 = Color(255, 255, 255)
                message.string_5 = " pour avoir joué sur le serveur."
                file.Write("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", util.TableToJSON(table))   
            end
        end
        skills_message(ply, message)
    end
end)

/*
for k, ply in pairs(player.GetAll()) do   
    if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA") then
        local table = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
        ply:SetNWInt("BCMaxMana", table.Chakra)
        ply:SetNWInt("BCMana", table.Chakra)
        --ply:GetNWInt("BCMana", table.Chakra)
        ply:ChatPrint("TEST CHAKRA")
    end
end
*/

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
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = ply_data.ply:Nick() .. " a appris avec succes ", ["color_2"] = Color(108, 216, 216), ["string_2"] = data_table.wep }
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


util.AddNetworkString("naruto_cmd")
net.Receive("naruto_cmd", function(len, ply)
    naruto_skills(ply)
end)