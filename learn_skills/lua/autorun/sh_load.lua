print(" ")
print(" ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" -                                                           - ")
print(" -                       Learn Skill                         - ")
print(" -                                                           - ")
print(" -                   Create by Linventif                     - ")
print(" -        Join my discord : https://dsc.gg/linventif         - ")
print(" -         Watch my website : https://linventif.org          - ")
print(" -                                                           - ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" ")
print(" ")

local folder = "learn_skills"
learn_skills = learn_skills or {}

AddCSLuaFile(folder .. "/sh_config.lua")
include(folder .. "/sh_config.lua")

print("| OK | addons/" .. folder .. "/lua/autorun/sh_" .. folder .. "_load.lua")
print("| OK | addons/" .. folder .. "/lua/" .. folder .. "/sh_config.lua")

if SERVER then
	for k, v in ipairs(file.Find(folder .. "/client/*.lua", "LUA")) do
		AddCSLuaFile(folder .. "/client/" .. v)
        print("| OK | addons/" .. folder .. "/lua/" .. folder .. "/client/" .. v)
	end

	for k, v in ipairs(file.Find(folder .. "/server/*.lua", "LUA")) do
		include(folder .. "/server/" .. v)
        print("| OK | addons/" .. folder .. "/lua/" .. folder .. "/server/" .. v)
	end
else
    if !file.Exists("linventif", "data") then
        file.CreateDir("linventif")
        file.Write("linventif/color_mode.json", util.TableToJSON(Color_Mode.Config))
    elseif !file.Exists("linventif/color_mode.json", "DATA") then
        file.Write("linventif/color_mode.json", util.TableToJSON(Color_Mode.Config))
    else
        local Config_Read = {}
        Config_Read = util.JSONToTable(file.Read("linventif/color_mode.json", "DATA"))
        if Color_Mode.Config.Version != Config_Read.Version then
            local version = Color_Mode.Config.Version
            table.CopyFromTo(Config_Read, Color_Mode.Config)
            Color_Mode.Config.Version = version
            file.Write("linventif/color_mode.json", util.TableToJSON(Color_Mode.Config))
        else
            Color_Mode.Config = Config_Read
        end
    end
    
    include(folder .. "/languages/" .. Color_Mode.Config.Language .. ".lua")
    print("| OK | addons/" .. folder .. "/lua/" .. folder .. "/languages/" .. string.lower(Color_Mode.Config.Language) .. ".lua")

	for k, v in ipairs(file.Find(folder .. "/client/*.lua", "LUA")) do
		include(folder .. "/client/" .. v)
        print("| OK | addons/" .. folder .. "/lua/" .. folder .. "/client/" .. v)
	end

	for k, v in ipairs(file.Find(folder .. "/server/*.lua", "LUA")) do
		include(folder .. "/server/" .. v)
        print("| OK | addons/" .. folder .. "/lua/" .. folder .. "/server/" .. v)
	end
end

print(" ")
print(" ")