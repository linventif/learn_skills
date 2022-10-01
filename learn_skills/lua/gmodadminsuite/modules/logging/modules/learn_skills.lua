local MODULE = GAS.Logging:MODULE()
MODULE.Category = "Learn Skills"
MODULE.Name = Learn_Skills.Language.Logs_Categorie_Learn
MODULE.Colour = Color(255,110,0)

MODULE:Hook("learn_skills_learn", "learn_skills_learn", function(student, weapon, time, teacher)
    MODULE:Log(Learn_Skills.Language.Logs_Learn, GAS.Logging:FormatPlayer(teacher), GAS.Logging:FormatEntity(weapon), GAS.Logging:FormatPlayer(student), GAS.Logging:Highlight(time))
end)

GAS.Logging:AddModule(MODULE)

-----------------------------------------------------------------

local MODULE = GAS.Logging:MODULE()
MODULE.Category = "Learn Skills"
MODULE.Name = Learn_Skills.Language.Logs_Categorie_Reroll
MODULE.Colour = Color(255,110,0)

MODULE:Hook("learn_skills_reroll", "learn_skills_reroll", function(admin, nature)
    MODULE:Log(Learn_Skills.Language.Logs_Reroll, GAS.Logging:FormatPlayer(admin), GAS.Logging:Highlight(nature))
end)

GAS.Logging:AddModule(MODULE)

-----------------------------------------------------------------

local MODULE = GAS.Logging:MODULE()
MODULE.Category = "Learn Skills"
MODULE.Name = Learn_Skills.Language.Logs_Categorie_Admin
MODULE.Colour = Color(255,110,0)

MODULE:Hook("learn_skills_reset", "learn_skills_reset", function(admin, target)
    MODULE:Log(Learn_Skills.Language.Logs_Reset, GAS.Logging:FormatPlayer(admin), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_nature_set", "learn_skills_nature_set", function(admin, target, nature)
    MODULE:Log(Learn_Skills.Language.Logs_Nature_Set, GAS.Logging:FormatPlayer(admin), GAS.Logging:Highlight(nature), GAS.Logging:FormatPlayer(target))
end)

-- Weapon

MODULE:Hook("learn_skills_weapon_reset", "learn_skills_weapon_reset", function(admin, target)
    MODULE:Log(Learn_Skills.Language.Logs_Weapon_Reset, GAS.Logging:FormatPlayer(admin), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_weapon_give", "learn_skills_weapon_give", function(admin, target, weapon)
    MODULE:Log(Learn_Skills.Language.Logs_Weapon_Give, GAS.Logging:FormatPlayer(admin), GAS.Logging:FormatEntity(weapon), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_weapon_remove", "learn_skills_weapon_remove", function(admin, target, weapon)
    MODULE:Log(Learn_Skills.Language.Logs_Weapon_Remove, GAS.Logging:FormatPlayer(admin), GAS.Logging:FormatEntity(weapon), GAS.Logging:FormatPlayer(target))
end)

-- Chakra

MODULE:Hook("learn_skills_chakra_reset", "learn_skills_chakra_reset", function(admin, target)
    MODULE:Log(Learn_Skills.Language.Logs_Chakra_Reset, GAS.Logging:FormatPlayer(admin), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_chakra_give", "learn_skills_chakra_give", function(admin, target, value)
    MODULE:Log(Learn_Skills.Language.Logs_Chakra_Give, GAS.Logging:FormatPlayer(admin), GAS.Logging:Highlight(value), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_chakra_remove", "learn_skills_chakra_remove", function(admin, target, value)
    MODULE:Log(Learn_Skills.Language.Logs_Chakra_Remove, GAS.Logging:FormatPlayer(admin), GAS.Logging:Highlight(value), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_chakra_set", "learn_skills_chakra_set", function(admin, target, value)
    MODULE:Log(Learn_Skills.Language.Logs_Chakra_Set, GAS.Logging:FormatPlayer(admin), GAS.Logging:Highlight(value), GAS.Logging:FormatPlayer(target))
end)

-- Reroll

MODULE:Hook("learn_skills_reroll_reset", "learn_skills_reroll_reset", function(admin, target)
    MODULE:Log(Learn_Skills.Language.Logs_Reroll_Reset, GAS.Logging:FormatPlayer(admin), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_reroll_give", "learn_skills_reroll_give", function(admin, target, value)
    MODULE:Log(Learn_Skills.Language.Logs_Reroll_Give, GAS.Logging:FormatPlayer(admin), GAS.Logging:Highlight(value), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_reroll_remove", "learn_skills_reroll_remove", function(admin, target, value)
    MODULE:Log(Learn_Skills.Language.Logs_Reroll_Remove, GAS.Logging:FormatPlayer(admin), GAS.Logging:Highlight(value), GAS.Logging:FormatPlayer(target))
end)

MODULE:Hook("learn_skills_reroll_set", "learn_skills_reroll_set", function(admin, target, value)
    MODULE:Log(Learn_Skills.Language.Logs_Reroll_Set, GAS.Logging:FormatPlayer(admin), GAS.Logging:Highlight(value), GAS.Logging:FormatPlayer(target))
end)

GAS.Logging:AddModule(MODULE)