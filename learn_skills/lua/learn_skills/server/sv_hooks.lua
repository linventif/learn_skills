hook.Add("PlayerSpawn", "Naruto_Perma_Weapons", function(ply)
    if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") then
        local table_data = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
        if table_data.Weapons then
            local weapons_learn = Learn_Skills.Technical[table_data.Nature] or {}
            local weapons_cant_give = 0
            table.Merge(weapons_learn, Learn_Skills.Technical.Commun)
            for k, v in ipairs(table_data.Weapons) do
                if weapons_learn[v] then
                    ply:Give(v)
                else
                    weapons_cant_give = weapons_cant_give + 1
                end
            end
            if weapons_cant_give > 0 then
                naruto_notif(ply, "Votre nature n'est pas compatible avec " .. tostring(weapons_cant_give) .. " techniques que vous avez apris !", 1, 4)
            end
        end
    else
        local table = {
            ["Nature"] = math.random(1, 200),
            ["Chakra"] = math.random(600, 1000),
            ["Reroll"] = 2,
        }        
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
        naruto_table(ply, table)
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

--  hook.Add("Skills_Use_Chakra", "Skills_Use_Chakra", function(ply, value)
--      if ply:IsValid() and value:IsValid() then
--          local table_data = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
--  
--      end
--  end)