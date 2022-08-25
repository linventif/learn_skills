local function net_to_server(cmd, traget_ply, value)
    net.Start("naruto_cmd")
    net.WriteString(cmd)
    net.WriteEntity(traget_ply)
    if value then 
        if isstring(value) then
            net.WriteBool(true)
            net.WriteString(value)
        else
            net.WriteBool(false)
            net.WriteInt(value, 32)
        end
    end
    net.SendToServer()
end

local function message(string, notif, time)
    notification.AddLegacy(string, notif, time)
    print(string)
end
 
concommand.Add("naruto_reset", function(ply, cmd, args)
    if args[1] == nil then
        message("Erreur Commande : " .. cmd .. " steamid64", 1, 4)
    else
        local traget_ply = player.GetBySteamID64(args[1])
        if traget_ply == false then
            error_player()
        else
            net_to_server(cmd, traget_ply)
            message("Vous avez Role PLay Kill " .. traget_ply:Nick(), 0, 4)
        end
    end
end)
  
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

concommand.Add("naruto_weapons_add", function(ply, cmd, args)
    if args[1] == nil or args[2] == nil then
        message("Erreur Commande : " .. cmd .. " steamid64 valeur", 1, 4)
    else
        local traget_ply = player.GetBySteamID64(args[1])
        if traget_ply == false then
            error_player()
        else
            net_to_server(cmd, traget_ply, args[2])
            message("Vous avez donner un.e " .. util.TypeToString(args[2]) .. " a " .. traget_ply:Nick() .. " de manière permanantes.u", 0, 4)
        end
    end
end)

concommand.Add("naruto_weapons_reset", function(ply, cmd, args)
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

concommand.Add("mon_steamid", function(ply, cmd, args)
    ply:ChatPrint("Steam ID : " .. ply:SteamID() .. "         Steam ID 64 : " .. ply:SteamID64())
    print("Steam ID : " .. ply:SteamID() .. "         Steam ID 64 : " .. ply:SteamID64())
end)