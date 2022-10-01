if Learn_Skills.Consol_Commands then
    local function cmd_args(ply, cmd, args, nb_arg)
        local cmd_error = false
        for i = nb_arg, 1, -1 do
            if !args[i] then
                if !cmd_error then
                    cmd_error = true
                end
            end
        end
        if cmd_error then
            local value_error = ""
            for i = nb_arg, 1, -1 do
                value_error = value_error .. " <value>"
            end
            skills_client_notif("Erreur Commande : " .. cmd .. " <steamid64>", 1, 4)
        else
            if (string.len(tostring(args[1])) == 17) && player.GetBySteamID64(args[1]) then
                local cmd_args = {
                    ["cmd"] = cmd,
                    ["value"] = args[2] or nil
                }
                net_to_server(cmd_args, player.GetBySteamID64(args[1]))
            else
                skills_client_notif("Joueur Invalide", 1, 4)
            end
        end
    end
    concommand.Add("skills_reset", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 1)
    end)
    concommand.Add("skills_weapon_give", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_weapon_remove", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_weapon_reset", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 1)
    end)
    concommand.Add("skills_chakra_give", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_chakra_remove", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_chakra_set", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_chakra_reset", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 1)
    end)
    concommand.Add("skills_nature_set", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_reroll_give", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_reroll_set", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_reroll_remove", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
    concommand.Add("skills_reroll_reset", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 1)
    end)
    concommand.Add("skills_info", function()
        print(" ")
        print(" ")
        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
        print(" -                                                           - ")
        print(" -              skills_weapon_reset <steamid64>              - ")
        print(" -           skills_weapon_give <steamid64> <weapon>         - ")
        print(" -          skills_weapon_remove <steamid64> <weapon>        - ")
        print(" -                                                           - ")
        print(" -              skills_reroll_reset <steamid64>              - ")
        print(" -          skills_reroll_remove <steamid64> <value>         - ")
        print(" -            skills_reroll_set <steamid64> <value>          - ")
        print(" -            skills_reroll_give <steamid64> <value>         - ")
        print(" -                                                           - ")
        print(" -            skills_nature_set <steamid64> <value>          - ")
        print(" -                                                           - ")
        print(" -              skills_chakra_reset <steamid64>              - ")
        print(" -          skills_chakra_remove <steamid64> <value>         - ")
        print(" -            skills_chakra_set <steamid64> <value>          - ")
        print(" -            skills_chakra_give <steamid64> <value>         - ")
        print(" -                                                           - ")
        print(" -                  skills_reset <steamid64>                 - ")
        print(" -                                                           - ")
        print(" -                         skills_info                       - ")
        print(" -                                                           - ")
        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
        print(" -                                                           - ")
        print(" -    Nom                                       steamid64    - ")
        print(" -                                                           - ")
        for _, v in ipairs(player.GetAll()) do
            if !v:IsBot() && v:IsValid() then
                local space = ""
                for i = (32-string.len(v:Nick())),1,-1 do
                    space = space .. "-"
                end
                print(" -    " .. v:Nick() .. " " .. space .. " " .. v:SteamID64() .. "    - ")
            end
        end
        print(" -                                                           - ")
        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
        print(" ")
        print(" ")
    end)
end