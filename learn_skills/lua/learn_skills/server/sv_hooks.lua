hook.Add("PlayerInitialSpawn", "Learn_Skill_Player_Init", function(ply)
    if !file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") then
        local table = {
            ["Nature"] = math.random(1, 5),
            ["Chakra"] = math.random(600, 1000)
        }
        
        if file.Exists("lddschakra/" .. ply:SteamID64() .. ".txt", "data") then
            local table_import = util.JSONToTable(file.Read("lddschakra/" .. args[1] .. ".txt", "DATA"))
            table.CopyFromTo(table_import, table)
        end

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
                table.Nature = "Jinton"
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
    
        file.Write("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", util.TableToJSON(table))
        naruto_table(ply, table)
    end
end)

hook.Add("PlayerSpawn", "Naruto_Perma_Weapons", function(ply)
    if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") then
        local table_import = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
        if table_import.Weapons then
            for k, v in ipairs(table_import.Weapons) do
                ply:Give(v)
            end
        end
    else
        naruto_notif(ply, "Erreur Data Serveur", 1, 4)
    end    
end)

hook.Add( "PlayerSay", "naruto_skills", function(ply, text)
	if Learn_Skills.Commands_Chat[string.lower(text)] then
        naruto_skills(ply)
	end
end)

hook.Add( "PlayerSay", "naruto_skills_admin", function(ply, text)
	if Learn_Skills.Commands_Chat_Admin[string.lower(text)] and Learn_Skills.UserGroup[ply:GetUserGroup()] then
        naruto_skills_admin(ply)
	end
end)