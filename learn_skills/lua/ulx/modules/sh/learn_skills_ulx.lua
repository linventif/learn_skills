function ulx.food( calling_ply, target_plys )
	for i=1, #target_plys do
        local skills_info = {
            ["Nature"] = skills_nature(),
            ["Chakra"] = math.random(600, 1000),
            ["Reroll"] = 2
        }
        file.Write("linventif/learn_skills/players/" .. target_plys:SteamID64() .. ".json", util.TableToJSON(skills_info))
        local message = {["color_1"] = Color(255, 255, 255), ["string_1"] = Learn_Skills.Language.Ad_Reset}
        skills_message(target_plys, message)
        local message = {
            ["color_1"] = Color(255, 255, 255), ["string_1"] = Learn_Skills.Language.Ad_New_Adventure_P1,
            ["color_2"] = Color(255, 100, 0), ["string_2"] = skills_info.Nature,
            ["color_3"] = Color(255, 255, 255), ["string_3"] = Learn_Skills.Language.Ad_New_Adventure_P2,
        }
        skills_message(target_plys, message, 4)
        naruto_notif(calling_ply, "Vous avez Role PLay Kill " .. target_plys:Nick(), 0, 4)
        target_plys:KillSilent()
        target_plys:Spawn()
        hook.Run("learn_skills_reste", calling_ply, target_plys)
	end
	ulx.fancyLogAdmin( calling_ply, Learn_Skills.Language.ULX_Reset_All_Log, target_plys )
end

local ls_reset_all = ulx.command( "Learn Skills", "ulx ls_reset_all", ulx.food, "!ls_reset" )
ls_reset_all:addParam{ type=ULib.cmds.PlayersArg }
ls_reset_all:defaultAccess( ULib.ACCESS_SUPERADMIN )
--ls_reset_all:help(Learn_Skills.Language.ULX_Reset_All)