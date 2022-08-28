net.Receive("naruto_message", function()
    local table = net.ReadTable()
    notification.AddLegacy(table.string, table.notif, table.time)
    print(table.string)
end)

net.Receive("naruto_table", function()
    local table = net.ReadTable()
    timer.Simple(2, function()
        chat.AddText(Color(255, 255, 255), "Votre aventure commence en temps que ", Color(108, 216, 216), table.Nature, Color(255, 255, 255), " ainsi qu'avec ", Color(108, 216, 216), util.TypeToString(table.Chakra), Color(255, 255, 255), " de chakra.")
    end)
--   if table.Weapons then
--       PrintTable(table)
--   else
--       timer.Simple(2, function()
--           chat.AddText(Color(255, 255, 255), "Votre aventure commence en temps que ", Color(108, 216, 216), table.Nature, Color(255, 255, 255), " ainsi qu'avec ", Color(108, 216, 216), util.TypeToString(table.Chakra), Color(255, 255, 255), " de chakra.")
--       end)
--   end
end)

net.Receive("naruto_skills", function()
    print("OK")
end)

net.Receive("naruto_skills_admin", function()
--    local Naruto_Info = vgui.Create("DFrame")
--    Naruto_Info:SetSize(Learn_Skills.Size.x, Learn_Skills.Size.y)
--    Naruto_Info:Center()
--    Naruto_Info:SetTitle("Naruto Skills by Linventif")
--    Naruto_Info:MakePopup()
--    Naruto_Info:SetDraggable(true)
--    Naruto_Info:ShowCloseButton(false)
--    Naruto_Info.Paint = function(s, w, h)
--        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
--        draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
--    end
--
--    local Close = vgui.Create("DButton", Naruto_Info)
--    Close:SetText("")
--    Close:SetPos(Learn_Skills.Size.x-25, 0)
--    Close:SetSize(25, 25)
--    Close:SetIcon("icon16/cross.png")
--    Close.DoClick = function()
--        Naruto_Info:Close()
--    end
--    Close.Paint = function(s, w, h)
--        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
--    end
--
--    local ply_list = vgui.Create("DFrame", Naruto_Info)
--    ply_list:SetSize(300, 500)
--    ply_list:SetTitle("Joueurs")
--    ply_list:SetPos(27, 50)
--    ply_list:ShowCloseButton(false)
--    ply_list:SetDraggable(false)
--
--    local DScrollPanel = vgui.Create("DScrollPanel", ply_list)
--    DScrollPanel:Dock(FILL)naruto_skills
--
--    local ply_info = vgui.Create( "DFrame", Naruto_Info)
--    ply_info:SetSize( 600, 500 )
--    ply_info:SetTitle("Joueurs")
--    ply_info:SetPos(Learn_Skills.Size.x-627, 50)
--    ply_info:ShowCloseButton(false)
--    ply_info:SetDraggable(false)
--
--    local Wang = vgui.Create("DNumberWang", ply_info)
--    Wang:SetPos(85, 25)
--    Wang:SetSize(45, 26)
--    Wang:SetMin(0)
--    Wang:SetMax(100)
--
--    Wang.OnValueChanged = function(self)
--    	print(self:GetValue())
--    end
--
PrintTable(net.ReadTable())
end)
