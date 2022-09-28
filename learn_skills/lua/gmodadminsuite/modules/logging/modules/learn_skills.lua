local MODULE = GAS.Logging:MODULE()
MODULE.Category = "Learn Skills"
MODULE.Name = "Learn"
MODULE.Colour = Color(255,110,0)

MODULE:Hook("learn_skills_learn", "learn_skills_learn", function(ply, wep, time, instructor)
    MODULE:Log("{1} fait apprendre {2} à {3} pendant " .. time, GAS.Logging:FormatPlayer(instructor), GAS.Logging:FormatEntity(wep), GAS.Logging:FormatPlayer(ply))
end)

GAS.Logging:AddModule(MODULE)

-----------------------------------------------------------------

local MODULE = GAS.Logging:MODULE()
MODULE.Category = "Learn Skills"
MODULE.Name = "Reroll"
MODULE.Colour = Color(255,110,0)

MODULE:Hook("learn_skills_reroll", "learn_skills_reroll", function(ply, nature)
    MODULE:Log("{1} est devenue un " .. nature, GAS.Logging:FormatPlayer(ply))
end)

GAS.Logging:AddModule(MODULE)

-----------------------------------------------------------------

local MODULE = GAS.Logging:MODULE()
MODULE.Category = "Learn Skills"
MODULE.Name = "Admin"
MODULE.Colour = Color(255,110,0)

MODULE:Hook("learn_skills_reste", "learn_skills_reste", function(ply, target)
    MODULE:Log("{1} a reset le skills de {2}", GAS.Logging:FormatPlayer(ply), GAS.Logging:FormatPlayer(target))
end)

GAS.Logging:AddModule(MODULE)