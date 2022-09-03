print(" ")
print(" ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" -                                                           - ")
print(" -                       Learn Skills                        - ")
print(" -                                                           - ")
print(" -                   Create by Linventif                     - ")
print(" -        Join my discord : https://dsc.gg/linventif         - ")
print(" -         Watch my website : https://linventif.org          - ")
print(" -                                                           - ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" ") 
print(" ")

local folder = "learn_skills"

AddCSLuaFile(folder .. "/sh_config.lua")
include(folder .. "/sh_config.lua")

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
	end

	for k, v in ipairs(file.Find(folder .. "/client/*.lua", "LUA")) do
		AddCSLuaFile(folder .. "/client/" .. v)
	end
else
	for k, v in ipairs(file.Find(folder .. "/server/*.lua", "LUA")) do
		include(folder .. "/server/" .. v)
	end

	for k, v in ipairs(file.Find(folder .. "/client/*.lua", "LUA")) do
		include(folder .. "/client/" .. v)
	end
end