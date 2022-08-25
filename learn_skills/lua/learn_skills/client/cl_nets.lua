net.Receive("learn_skill_open", function()
    LocalPlayer():ChatPrint("message")
end)

net.Receive("naruto_message", function()
    local table = net.ReadTable()
    notification.AddLegacy(table.string, table.notif, table.time)
    print(table.string)
end)

net.Receive("naruto_table", function()
    local table = net.ReadTable()
    if table.Weapons then
        PrintTable(table)
    else
        timer.Simple(2, function()
            chat.AddText(Color(255, 255, 255), "Votre aventure commence en temps que ", Color(108, 216, 216), table.Nature, Color(255, 255, 255), " ainsi qu'avec ", Color(108, 216, 216), util.TypeToString(table.Chakra), Color(255, 255, 255), " de chakra.")
        end)
    end
end)