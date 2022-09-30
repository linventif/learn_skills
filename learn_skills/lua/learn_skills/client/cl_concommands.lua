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
            if (args[1] == 17) then
                local cmd_args = {
                    ["cmd"] = cmd,
                    ["value"] = args[2] or nil
                }
                -- net_to_server(cmd_args, traget_ply)
                --  print(ply)
                --  print(cmd)
                --  PrintTable(arg)
                --  print(nb_arg)
            else
                print(player.GetBySteamID64(args[1]))
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
    concommand.Add("skills_chakra_add", function(ply, cmd, args)
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
    concommand.Add("skills_nature_reset", function(ply, cmd, args)
        cmd_args(ply, cmd, args, 2)
    end)
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
        end
        print(" -                                                           - ")
        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
        print(" ")
        print(" ")
    end)
--    concommand.Add("skills_infos", function()
--        print(" ")
--        print(" ")
--        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
--        print(" -                                                           - ")
--        print(" -                                                           - ")
--        
--        print(" -                                                           - ")
--        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
--        print(" ")
--        print(" ")
--    end)
end



/*

concommand.Add("naruto_chakra_add", function(ply, cmd, args)
    if args[1] == nil or args[2] == nil or !args[2]:IsValid(int) then
        message("Erreur Commande : " .. cmd .. " steamid64 valeur", 1, 4)
    else
        local traget_ply = player.GetBySteamID64(args[1])
        if traget_ply == false then
            error_player()
        else
            net_to_server(cmd, traget_ply, args[2])
            message("Vous avez augementez le chakra de " .. traget_ply:Nick() .. " de " .. util.TypeToString(args[2]), 0, 4)
        end
    end
end)


concommand.Add("naruto_chakra_set", function(ply, cmd, args)
    if args[1] == nil or args[2] == nil or !args[2]:IsValid(int) then
        message("Erreur Commande : " .. cmd .. " steamid64 valeur", 1, 4)
    else
        local traget_ply = player.GetBySteamID64(args[1])
        if traget_ply == false then
            error_player()
        else
            net_to_server(cmd, traget_ply, args[2])
            message("Vous avez augementez le chakra de " .. traget_ply:Nick() .. " de " .. util.TypeToString(args[2]), 0, 4)
        end
    end
end)

concommand.Add("naruto_chakra_reset", function(ply, cmd, args)
    if args[1] == nil then
        message("Erreur Commande : " .. cmd .. " steamid64", 1, 4)
    else
        local traget_ply = player.GetBySteamID64(args[1])
        if traget_ply == false then
            error_player()
        else
            net_to_server(cmd, traget_ply)
            message("Vous avez reset le chakra de " .. traget_ply:Nick(), 0, 4)
        end
    end
end)

concommand.Add("naruto_nature_set", function(ply, cmd, args)
    if args[1] == nil or args[2] == nil or !args[2]:IsValid(int) then
        message("Erreur Commande : " .. cmd .. " steamid64 valeur", 1, 4)
    else
        local traget_ply = player.GetBySteamID64(args[1])
        if traget_ply == false then
            error_player()
        else
            net_to_server(cmd, traget_ply, args[2])
            message("Vous avez augementez le chakra de " .. traget_ply:Nick() .. " de " .. util.TypeToString(args[2]), 0, 4)
        end
    end
end)

concommand.Add("naruto_nature_reset", function(ply, cmd, args)
    if args[1] == nil then
        message("Erreur Commande : " .. cmd .. " steamid64", 1, 4)
    else
        local traget_ply = player.GetBySteamID64(args[1])
        if traget_ply == false then
            error_player()
        else
            net_to_server(cmd, traget_ply)
            message("Vous avez reset le chakra de " .. traget_ply:Nick(), 0, 4)
        end
    end
end)

concommand.Add("naruto_info", function(ply, cmd, args)
    if args[1] == nil then
        message("Erreur Commande : " .. cmd .. " steamid64", 1, 4)
    else
        local traget_ply = player.GetBySteamID64(args[1])
        if traget_ply == false then
            error_player()
        else
            net_to_server(cmd, traget_ply)
        end
    end
end)

*/