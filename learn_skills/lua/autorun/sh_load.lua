print(" ")
print(" ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" -                                                           - ")
print(" -                       Learn Sk ills                        - ")
print(" -                                                           - ")
print(" -                   Create by Linventif                     - ")
print(" -        Join my discord : https://dsc.linventif.fr         - ")
print(" -                                                           - ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" ")

local folder = "learn_skills"
Learn_Skills = {}
Learn_Skills.Version = 1

// Load Config File
AddCSLuaFile(folder .. "/sh_config.lua")
include(folder .. "/sh_config.lua")

// Load Language File
AddCSLuaFile(folder .. "/languages/" .. string.lower(Learn_Skills.Config.Language) .. ".lua")
include(folder .. "/languages/" .. string.lower(Learn_Skills.Config.Language) .. ".lua")
print("| Learn Skills | File Load | addons/" .. folder .. "/lua/" .. folder .. "/languages/" .. string.lower(Learn_Skills.Config.Language) .. ".lua")

// Load Other Files
if SERVER then
    if !file.Exists("linventif", "data") then
        file.CreateDir("linventif")
        file.CreateDir("linventif/learn_skills")
        file.CreateDir("linventif/learn_skills/players")
    elseif !file.Exists("linventif/learn_skills", "data") then
        file.CreateDir("linventif/learn_skills")
    elseif !file.Exists("linventif/learn_skills/players", "data") then
        file.CreateDir("linventif/learn_skills/players")
    end

	for k, v in ipairs(file.Find(folder .. "/server/*.lua", "LUA")) do
		include(folder .. "/server/" .. v)
        print("| Learn Skills | File Load | addons/" .. folder .. "/lua/" .. folder .. "/server/" .. v)
	end

	for k, v in ipairs(file.Find(folder .. "/client/*.lua", "LUA")) do
        print("| Learn Skills | File Load | addons/" .. folder .. "/lua/" .. folder .. "/client/" .. v)
		AddCSLuaFile(folder .. "/client/" .. v)
	end
else
	for k, v in ipairs(file.Find(folder .. "/server/*.lua", "LUA")) do
		include(folder .. "/server/" .. v)
        print("| Learn Skills | File Load | addons/" .. folder .. "/lua/" .. folder .. "/server/" .. v)
	end

	for k, v in ipairs(file.Find(folder .. "/client/*.lua", "LUA")) do
		include(folder .. "/client/" .. v)
        print("| Learn Skills | File Load | addons/" .. folder .. "/lua/" .. folder .. "/client/" .. v)
	end
end

print(" ")
print(" ")