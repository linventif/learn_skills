/*


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
            --print(string.len(v:Nick()))
        end
        print(" -                                                           - ")
        print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
        print(" ")
        print(" ")
    end)*/