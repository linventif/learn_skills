hook.Add("PlayerInitialSpawn", "Naruto_Perma_Weapons", function(ply)
    if !file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") && ply:IsValid() && !ply:IsBot() then
        local skills_info = {
            ["Nature"] = skills_nature(),
            ["Chakra"] = math.random(Learn_Skills.Config.Random_Chakra_Min, Learn_Skills.Config.Random_Chakra_Max),
            ["Reroll"] = 2
        }
        file.Write("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", util.TableToJSON(skills_info))
        local message = {
            ["color_1"] = Color(255, 255, 255), ["string_1"] = "Votre aventure commence en temps que ",
            ["color_2"] = Color(255, 100, 0), ["string_2"] = skills_info.Nature,
            ["color_3"] = Color(255, 255, 255), ["string_3"] = " plus d'info dans le /skills.",
        }
        skills_message(ply, message, 4)
    end
end)
hook.Add("PlayerSpawn", "Naruto_Perma_Weapons", function(ply)
    if file.Exists("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "data") && ply:IsValid() && !ply:IsBot() then
        local table_data = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
        if table_data.Weapons then
            local weapons_learn = Learn_Skills.Technical[table_data.Nature] or {}
            local weapons_cant_give = 0
            table.Merge(weapons_learn, Learn_Skills.Technical.Commun)
            for k, v in ipairs(table_data.Weapons) do
                if weapons_learn[v] && weapons.Get(v) then
                    ply:Give(v)
                else
                    weapons_cant_give = weapons_cant_give + 1
                end
            end
            if weapons_cant_give > 0 then
                naruto_notif(ply, "Votre nature n'est pas compatible avec " .. tostring(weapons_cant_give) .. " techniques que vous avez apris !", 1, 4)
            end
        end
        local job_limit = Learn_Skills.Config.Chakra_Limit_By_Job[team.GetName(ply:Team())]
        if job_limit && (table_data.Chakra > job_limit) then
            ply:SetNWInt("BCMana", job_limit)
            ply:SetNWInt("BCMaxMana", job_limit)
            local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous avez atteit la limite maximale de chakra pour ce métier."}
            skills_message(ply, message)
        else
            ply:SetNWInt("BCMana", table_data.Chakra)
            ply:SetNWInt("BCMaxMana", table_data.Chakra)
        end
    end
end)
hook.Add("PlayerSay", "naruto_skills", function(ply, text)
	if Learn_Skills.Commands_Chat[string.lower(text)] then
        naruto_skills(ply)
	end
end)
hook.Add( "PlayerSay", "naruto_skills_admin", function(ply, text)
	if Learn_Skills.Commands_Chat_Admin[string.lower(text)] and Learn_Skills.UserGroup[ply:GetUserGroup()] then
        naruto_skills_admin(ply)
	end
end)
hook.Add("StartCommand", "BCSkillsUse", function(ply, cmd)
    if ply:Alive() then
        if ply:KeyDown(IN_ATTACK) or ply:KeyDown(IN_USE) or ply:KeyDown(IN_ATTACK2) or ply:KeyDown(IN_ZOOM) or ply:KeyDown(IN_RELOAD) then
			timer.Simple(1, function()
				if ply:GetNWInt("BCMana") < 0 then
					if ply:Alive() then
						ply:Kill()
                        local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = "Vous êtes mort d'epuisement !"}
                        skills_message(ply, message)
					end
				end
			end)
        end
    end
end)