/*
Learn_Skills.Config = {
    --[[ Main Configuration ]]--
    ["Language"] = "French",        --      French or English
    ["Advert"] = true,              --      Made advert when somone learn a skill
    ["Auto_Chakra"] = true,         --      Automatically give Chakra
    ["Auto_Points"] = true,         --      Automatically give Points Shop Points
    ["Chakra_Limit_Job"] = true,    --      Enable Chakra Limit by Job
    ["Chakra_Limit"] = 15000,       --      Set Chakra Limit
    ["Boost"] = true,               --      Enable Boost Chakra & Points
    ["BoostGroup"] = {
        ["superadmin"]      =   true,
        ["helper"]          =   true,
        ["super-admin"]     =   true,
        ["admin"]           =   true,
        ["mono"]            =   true,
        ["modo-test"]       =   true,
        ["premium"]         =   true,
        ["vip"]             =   true
    }
    --[[ Admin Configuration ]]--
}
*/
--[[ Main Configuration ]]--
Learn_Skills.Config = {
    ["Language"] = "French", -- French or English
    ["Advert"] = true, -- Made advert when somone learn a skill
    ["Model"] = ""
}

--[[ Mana Configuration ]]--
--[[
skills.config.mana = {
    ["limit"] = 15000,
    ["job_limit"] = true,
    ["boost"] = true,
    ["boost_group"] = {
        ["superadmin"] = true,
        ["helper"] = true,
        ["super-admin"] = true,
        ["admin"] = true,
        ["mono"] = true,
        ["modo-test"] = true,
        ["premium"] = true,
        ["vip"] = true
    }
}

]]--
Learn_Skills.Auto_Chakra = true -- Automatically give Chakra
Learn_Skills.Chakra_Limit = 15000 -- Set Chakra Limit
Learn_Skills.Chakra_Limit_Job = true -- Enable Chakra Limit by Job
Learn_Skills.Config.Chakra_Limit_By_Job = { -- Set Chakra Limit by Job
    ["Lobby"] = 2000,
    ["Staff"] = 20000
}
Learn_Skills.Config.Random_Chakra_Max = 1000 -- Maximum Chakra Random Give at the First Join or Admin Reset
Learn_Skills.Config.Random_Chakra_Min = 600 -- Minimum Chakra Random Give at the First Join or Admin Reset

--[[ Points Configuration ]]--
Learn_Skills.Auto_Points = true -- Automatically give Points Shop Point

--[[ Boost Configuration ]]--
Learn_Skills.Boost = true -- Enable Boost Chakra & Points
Learn_Skills.BoostGroup = {
    ["superadmin"]      =   true,
    ["helper"]          =   true,
    ["super-admin"]     =   true,
    ["admin"]           =   true,
    ["mono"]            =   true,
    ["modo-test"]       =   true,
    ["premium"]         =   true,
    ["vip"]             =   true
}

--[[ Admin Configuration ]]--
Learn_Skills.ULX_Commands = true -- Enable ULX Commands
Learn_Skills.SAM_Commands = false -- Enable SAM Commands
Learn_Skills.Consol_Commands = true -- Enable Consol Commands
Learn_Skills.GroupCanAcces = {
    ["superadmin"]      =   true,
    ["super-admin"]     =   true,
    ["admin"]           =   true,
    ["modo"]            =   true,
    ["modo-test"]       =   true
}
Learn_Skills.GroupCanEdit = {
    ["superadmin"]      =   true,
    ["super-admin"]     =   true,
    ["admin"]           =   true,
    ["modo"]            =   true
}
Learn_Skills.Config.Admin_Group = {
    ["superadmin"]      =   true,
    ["super-admin"]     =   true,
    ["admin"]           =   true,
    ["modo"]            =   false,
    ["modo-test"]       =   false
}
Learn_Skills.Config.Super_Admin_Group = {
    ["superadmin"]      =   true,
    ["super-admin"]     =   true
}

--[[ User Interface Configuration ]]--
Learn_Skills.UI_Color = {
    Background = Color(32, 32, 32),
    Other = Color(60, 90, 120),
    Other_I = Color(80, 110, 140),
    Danger = Color(200, 70, 70),
    Valid = Color(70, 200, 70),
    Transparent = Color(255, 255, 255, 0)
}
Learn_Skills.Size = {
    x = 1080,
    y = 720
}

--[[ Commands Configuration ]]--
Learn_Skills.Commands_Chat = {
    ["/skill"] = true,
    ["!skill"] = true,
    ["/skills"] = true,
    ["!skills"] = true,
    ["/techniques"] = true,
    ["!techniques"] = true,
    ["/technique"] = true,
    ["!technique"] = true
}
Learn_Skills.Commands_Chat_Admin = {
    ["/skill_admin"] = true,
    ["/Skill_Admin"] = true,
    ["!Skill_Admin"] = true,
    ["!skill_admin"] = true,
    ["/skills_admin"] = true,
    ["!skills_admin"] = true,
    ["/techniques_admin"] = true,
    ["!techniques_admin"] = true,
    ["/technique_admin"] = true,
    ["!technique_admin"] = true
}

Learn_Skills.Commands_Chat_New_Admin = {
    ["/skill_new_admin"] = true,
    ["!skill_new_admin"] = true,
}

Learn_Skills.Team = {
    ["Instructeur - Ko"]    =   true,
    ["Instructeur - Ki"]    =   true
}

--[[ Nature Configuration ]]--
Learn_Skills.Warning_Nature = {
    ["Futton"] = true,
    ["Bakuton"] = true,
    ["Jinton"] = true,
    ["Shakuton"] = true,
    ["Jinton Dorée"] = true,
    ["Ranton"] = true,
    ["Shoton"] = true,
    ["Purple Raiton"] = true
}
Learn_Skills.Config.Natures = {
    ["Futton"] = true,
    ["Bakuton"] = true,
    ["Jinton"] = true,
    ["Shakuton"] = true,
    ["Jinton Dorée"] = true,
    ["Ranton"] = true,
    ["Shoton"] = true,
    ["Purple Raiton"] = true,
    ["Futon"] = true,
    ["Doton"] = true,
    ["Katon"] = true,
    ["Suiton"] = true,
    ["Raiton"] = true
}
--[[ Technical Configuration ]]--
Learn_Skills.Technical = {
    ["Commun"] = {
        ["weapon_m42"] = true,
        ["technique_permutation"] = true,
        ["walk_on_water"] = true,
        ["chakra_charge"] = true,
        ["weapon_vitesse"] = true,
        ["weapon_vitesse_2"] = true,
        ["weapon_vitesse_3"] = true,
        ["weapon_vitesse_4"] = true,
        ["weapon_vitesse_5"] = true,
        ["chakra_charge_v2"] = true,
        ["commun_poignard1"] = true,
        ["commun_poignard2"] = true,
        ["commun_poignard3"] = true,
        ["commun_massu1"] = true,
        ["commun_massu2"] = true,
        ["commun_massu3"] = true,
        ["commun_poinglame1"] = true,
        ["commun_poinglame2"] = true,
        ["commun_poinglame3"] = true,
        ["commun_yamato1"] = true,
        ["commun_yamato2"] = true,
        ["commun_yamato3"] = true
    },
    ["Futton"] = {
        ["futton_vapeur"] = true,
        ["futton_nuage"] = true,
        ["futton_propulsion"] = true,
        ["futton_evaporation"] = true,
        ["katon_embr"] = true,
        ["katon_bombe_de_feu"] = true,
        ["poissonattaqueperso"] = true,
        ["katon_flamme_de_l'enfer"] = true,
        ["katon_cercle_de_flammes"] = true,
        ["katon_explosion_retarde"] = true,
        ["katon_prot1"] = true,
        ["katon_balsamine_boost"] = true,
        ["uchicha_lamedefeux"] = true,
        ["katon_boule_de_feu_supreme"] = true,
        ["katon_mur"] = true,
        ["katon_pluie_de_breze"] = true,
        ["katon_boule_de_feu"] = true,
        ["katon_flamme_de_katon"] = true,
        ["sfw_hellfire"] = true,
        ["katon_projectile_de_feu"] = true,
        ["katon_explosion_brulante"] = true,
        ["katon_tornade_de_feu"] = true,
        ["suiton_prison_aqueuse"] = true,
        ["suiton_perception_de_la_brume"] = true,
        ["suiton_vague_aqueuese"] = true,
        ["suiton_prot1"] = true,
        ["suiton_trombes_deau"] = true,
        ["suiton_vague_du_chaos"] = true,
        ["suiton_bombe_aqueuse"] = true,
        ["suiton_camouflage_dans_la_brume"] = true,
        ["suiton_canon_aqueu"] = true,
        ["suiton_mur"] = true,
        ["suiton_pluie_torencielle"] = true,
        ["suiton_projectiles_aqueux_"] = true,
        ["suiton_vague_de_bulles"] = true,
        ["suiton_cataracte"] = true,
        ["suiton_onde"] = true,
        ["weapon_sound_gun_07"] = true
    },
    ["Jiton Dorée"] = {
        ["jiton_protection_maternelle_2"] = true,
        ["jiton_suspension2"] = true,
        ["jiton_tombeau_du_desert_2"] = true,
        ["futon_lame"] = true,
        ["futon_balle_de_ventmulti"] = true,
        ["poke_ghost_mirrorcoat"] = true,
        ["futon_bourrasque_de_vent"] = true,
        ["futon_onde_de_choc"] = true,
        ["futon_fouet_de_vent"] = true,
        ["futon_prison_tourbionante"] = true,
        ["futon_tourbi"] = true,
        ["futon_vent_du_chaos"] = true,
        ["blink"] = true,
        ["futon_orbe_aerienne"] = true,
        ["sfw_zeala"] = true,
        ["futon_poing_comprime"] = true,
        ["futon_protection_du_vent"] = true,
        ["futon_tourbii"] = true,
        ["futon_controle_aerien"] = true,
        ["futon_disto"] = true,
        ["doton_montagne"] = true,
        ["doton_pillier"] = true,
        ["doton_rocher"] = true,
        ["doton_termitiere_de_boue"] = true,
        ["doton_avalanchetellurique"] = true,
        ["doton_grand_mur"] = true,
        ["doton_durcissement_partiel"] = true,
        ["doton_boule_de_roche"] = true,
        ["doton_pieux_de_roches"] = true,
        ["prison_de_roche"] = true,
        ["doton_camouflage_sous_terre"] = true,
        ["doton_jet_de_pierre"] = true,
        ["doton_fist"] = true,
        ["doton_mur"] = true,
        ["doton_silex_perforant"] = true,
        ["doton_lame"] = true,
        ["doton_sol_de_cadavre"] = true,
        ["doton_seisme"] = true
    },
    ["Jinton"] = {
        ["jinton_zone"] = true,
        ["jinton_detachement"] = true,
        ["jinton_detachement_primitif"] = true,
        ["jinton_retour"] = true,
        ["doton_montagne"] = true,
        ["doton_pillier"] = true,
        ["doton_rocher"] = true,
        ["doton_termitiere_de_boue"] = true,
        ["doton_avalanchetellurique"] = true,
        ["doton_grand_mur"] = true,
        ["doton_durcissement_partiel"] = true,
        ["doton_boule_de_roche"] = true,
        ["doton_pieux_de_roches"] = true,
        ["prison_de_roche"] = true,
        ["doton_camouflage_sous_terre"] = true,
        ["doton_jet_de_pierre"] = true,
        ["doton_fist"] = true,
        ["doton_mur"] = true,
        ["doton_silex_perforant"] = true,
        ["doton_lame"] = true,
        ["doton_sol_de_cadavre"] = true,
        ["doton_seisme"] = true,
        ["katon_embr"] = true,
        ["katon_bombe_de_feu"] = true,
        ["poissonattaqueperso"] = true,
        ["katon_flamme_de_l'enfer"] = true,
        ["katon_cercle_de_flammes"] = true,
        ["katon_explosion_retarde"] = true,
        ["katon_prot1"] = true,
        ["katon_balsamine_boost"] = true,
        ["uchicha_lamedefeux"] = true,
        ["katon_boule_de_feu_supreme"] = true,
        ["katon_mur"] = true,
        ["katon_pluie_de_breze"] = true,
        ["katon_boule_de_feu"] = true,
        ["katon_flamme_de_katon"] = true,
        ["sfw_hellfire"] = true,
        ["katon_projectile_de_feu"] = true,
        ["katon_explosion_brulante"] = true,
        ["katon_tornade_de_feu"] = true
    },
    ["Futon"] = {
        ["futon_lame"] = true,
        ["futon_balle_de_ventmulti"] = true,
        ["poke_ghost_mirrorcoat"] = true,
        ["futon_bourrasque_de_vent"] = true,
        ["futon_onde_de_choc"] = true,
        ["futon_fouet_de_vent"] = true,
        ["futon_prison_tourbionante"] = true,
        ["futon_tourbi"] = true,
        ["futon_vent_du_chaos"] = true,
        ["blink"] = true,
        ["futon_orbe_aerienne"] = true,
        ["sfw_zeala"] = true,
        ["futon_poing_comprime"] = true,
        ["futon_protection_du_vent"] = true,
        ["futon_tourbii"] = true,
        ["futon_controle_aerien"] = true,
        ["futon_disto"] = true
    },
    ["Bakuton"] = {
        ["bakuton_c3"] = true,
        ["bakuton_c4"] = true,
        ["bakuton_autodestruction"] = true,
        ["bakuton_c2"] = true,
        ["deidara_owl"] = true,
        ["bakuton_oiseau"] = true,
        ["bakuton_boom"] = true,
        ["bakuton_c1"] = true,
        ["bakuton_saut_explosif"] = true,
        ["bakuton_cercle"] = true,
        ["bakuton_c4_2"] = true,
        ["bakuton_cercle_explosif"] = true
    },
    ["Shoton"] = {
        ["shotonzone"] = true,
        ["shoton_piege_de_cristal"] = true,
        ["shoton_protection_de_cristal"] = true,
        ["shoton_pillier_de_cristal"] = true,
        ["shoton_passif"] = true
    },
    ["Doton"] = {
        ["doton_montagne"] = true,
        ["doton_pillier"] = true,
        ["doton_rocher"] = true,
        ["doton_termitiere_de_boue"] = true,
        ["doton_avalanchetellurique"] = true,
        ["doton_grand_mur"] = true,
        ["doton_durcissement_partiel"] = true,
        ["doton_boule_de_roche"] = true,
        ["doton_pieux_de_roches"] = true,
        ["prison_de_roche"] = true,
        ["doton_camouflage_sous_terre"] = true,
        ["doton_jet_de_pierre"] = true,
        ["doton_fist"] = true,
        ["doton_mur"] = true,
        ["doton_silex_perforant"] = true,
        ["doton_lame"] = true,
        ["doton_sol_de_cadavre"] = true,
        ["doton_seisme"] = true
    },
    ["Shakuton"] = {
        ["shakuton_desechement"] = true,
        ["shakuton_9"] = true,
        ["shakuton_balle"] = true,
        ["shakuton_vision"] = true,
        ["shakuton_prison"] = true,
        ["shakuton_prosimple"] = true,
        ["shakuton_tir"] = true,
        ["shakuton_tornade_2"] = true,
        ["shakuton_tornade"] = true
    },
    ["Katon"] = {
        ["katon_embr"] = true,
        ["katon_bombe_de_feu"] = true,
        ["poissonattaqueperso"] = true,
        ["katon_flamme_de_l'enfer"] = true,
        ["katon_cercle_de_flammes"] = true,
        ["katon_explosion_retarde"] = true,
        ["katon_prot1"] = true,
        ["katon_balsamine_boost"] = true,
        ["uchicha_lamedefeux"] = true,
        ["katon_boule_de_feu_supreme"] = true,
        ["katon_mur"] = true,
        ["katon_pluie_de_breze"] = true,
        ["katon_boule_de_feu"] = true,
        ["katon_flamme_de_katon"] = true,
        ["sfw_hellfire"] = true,
        ["katon_projectile_de_feu"] = true,
        ["katon_explosion_brulante"] = true,
        ["katon_tornade_de_feu"] = true
    },
    ["Ranton"] = {
        ["ranton_cond"] = true,
        ["ranton_foudre_du_ciel"] = true,
        ["ranton_prot"] = true,
        ["ranton_surcharge"] = true,
        ["ranton_prison"] = true,
        ["ranton_bombe"] = true,
        ["ranton_dragon"] = true,
        ["ranton_manif"] = true,
        ["ranton_temp"] = true,
        ["ranton_destruction_precise"] = true,
        ["chidori"] = true,
        ["raiton_boule_de_foudre"] = true,
        ["raiton_onde_detective"] = true,
        ["raiton_raisen"] = true,
        ["sfw_storm"] = true,
        ["raiton_division_condense"] = true,
        ["raiton_pression_foudroyante"] = true,
        ["raiton_prison"] = true,
        ["raiton_rayon_eclair"] = true,
        ["raiton_balle_eclair"] = true,
        ["sfw_hornet"] = true,
        ["raiton_charge"] = true,
        ["raiton_balle_eclair"] = true,
        ["sfw_hornet"] = true,
        ["raiton_tps"] = true,
        ["raiton_foudre_divine"] = true,
        ["raiton_explosion_tourbillonante"] = true,
        ["raiton_mode_chakra"] = true,
        ["suiton_prison_aqueuse"] = true,
        ["suiton_perception_de_la_brume"] = true,
        ["suiton_vague_aqueuese"] = true,
        ["suiton_prot1"] = true,
        ["suiton_trombes_deau"] = true,
        ["suiton_vague_du_chaos"] = true,
        ["suiton_bombe_aqueuse"] = true,
        ["suiton_camouflage_dans_la_brume"] = true,
        ["suiton_canon_aqueu"] = true,
        ["suiton_mur"] = true,
        ["suiton_pluie_torencielle"] = true,
        ["suiton_projectiles_aqueux_"] = true,
        ["suiton_vague_de_bulles"] = true,
        ["suiton_cataracte"] = true,
        ["suiton_onde"] = true,
        ["weapon_sound_gun_07"] = true
    },
    ["Suiton"] = {
        ["suiton_prison_aqueuse"] = true,
        ["suiton_perception_de_la_brume"] = true,
        ["suiton_vague_aqueuese"] = true,
        ["suiton_prot1"] = true,
        ["suiton_trombes_deau"] = true,
        ["suiton_vague_du_chaos"] = true,
        ["suiton_bombe_aqueuse"] = true,
        ["suiton_camouflage_dans_la_brume"] = true,
        ["suiton_canon_aqueu"] = true,
        ["suiton_mur"] = true,
        ["suiton_pluie_torencielle"] = true,
        ["suiton_projectiles_aqueux_"] = true,
        ["suiton_vague_de_bulles"] = true,
        ["suiton_cataracte"] = true,
        ["suiton_onde"] = true,
        ["weapon_sound_gun_07"] = true
    },
    ["Purple Raiton"] = {
        ["purple_orbe_pourpre"] = true,
        ["purple_explosion_violette"] = true,
        ["purple_impulsion"] = true
    },
    ["Raiton"] = {
        ["chidori"] = true,
        ["raiton_boule_de_foudre"] = true,
        ["raiton_onde_detective"] = true,
        ["raiton_raisen"] = true,
        ["sfw_storm"] = true,
        ["raiton_division_condense"] = true,
        ["raiton_pression_foudroyante"] = true,
        ["raiton_prison"] = true,
        ["raiton_rayon_eclair"] = true,
        ["raiton_balle_eclair"] = true,
        ["sfw_hornet"] = true,
        ["raiton_charge"] = true,
        ["raiton_balle_eclair"] = true,
        ["sfw_hornet"] = true,
        ["raiton_tps"] = true,
        ["raiton_foudre_divine"] = true,
        ["raiton_explosion_tourbillonante"] = true,
        ["raiton_mode_chakra"] = true
    }
}



--[[ Permission Group Configuration ]]--
Learn_Skills.UserGroup = {
    ["superadmin"]      =   true,
    ["helper"]          =   true,
    ["super-admin"]     =   true,
    ["admin"]           =   true,
    ["modo"]            =   true,
    ["modo-test"]       =   true
}

Learn_Skills.Commands_Chat_New_Admin = {
    ["/skill_new_admin"] = true,
    ["!skill_new_admin"] = true,
}