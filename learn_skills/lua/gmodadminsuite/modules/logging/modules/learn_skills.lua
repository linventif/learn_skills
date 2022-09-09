local MODULE = GAS.Logging:MODULE()

MODULE.Category = "Linventif"
MODULE.Name = "Learn Skills"
MODULE.Colour = Color(255,110,0)

MODULE:Setup(function()
	MODULE:Hook("learn_skills_logs", "learn_skills_logs", function(ply, wep, time, instructor)
		MODULE:Log("{1} fait apprendre {2} à {3} pendant " .. time, GAS.Logging:FormatPlayer(instructor), GAS.Logging:FormatEntity(wep), GAS.Logging:FormatPlayer(ply))
	end)
end)

GAS.Logging:AddModule(MODULE)