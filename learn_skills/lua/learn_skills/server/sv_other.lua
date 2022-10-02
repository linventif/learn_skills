/*


    concommand.Add("skills_steamid64", function()
        print(" ")
        print(" ")
        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
        print(" -                                                           - ")
        for _, v in ipairs(player.GetAll()) do
            local space = ""
            for i = (32-string.len(v:Nick())),1,-1 do
                space = space .. "-"
            end
            print(" -    " .. v:Nick() .. " " .. space .. " " .. v:SteamID64() .. "    - ")
            --print(string.len(v:Nick()))
        end
        print(" -                                                           - ")
        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
        print(" ")
        print(" ")
    end)*/

util.AddNetworkString("lean_skills_new_admin")
hook.Add("PlayerSay", "lean_skills_new_admin", function(ply, text)
	if Learn_Skills.Commands_Chat_New_Admin[string.lower(text)] && Learn_Skills.UserGroup[ply:GetUserGroup()] then
        net.Start("lean_skills_new_admin")
        net.Send(ply)
	end
end)

--      EMERGENCY CHAKRA DEBUG



for i, ply in ipairs( player.GetAll() ) do
	local table_data = util.JSONToTable(file.Read("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", "DATA"))
    table_data.Reroll = util.StringToType(table_data.Reroll, "int")
    file.Write("linventif/learn_skills/players/" .. ply:SteamID64() .. ".json", util.TableToJSON(table_data))
    ply:ChatPrint("REROLL DEBUG OK")
    ply:ChatPrint("REROLL DEBUG OK")
    ply:ChatPrint("REROLL DEBUG OK")
    ply:ChatPrint("REROLL DEBUG OK")
    ply:ChatPrint("REROLL DEBUG OK")
end
