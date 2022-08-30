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
end)

net.Receive("naruto_skills", function()
    
    local table_ply = net.ReadTable()

    local Naruto_Info = vgui.Create("DFrame")
    Naruto_Info:SetSize(800, 400)
    Naruto_Info:Center() 
    Naruto_Info:SetTitle("Naruto Skills by Linventif")
    Naruto_Info:MakePopup()
    Naruto_Info:SetDraggable(true)
    Naruto_Info:ShowCloseButton(false)
    Naruto_Info.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
        draw.SimpleText("Chakra : " .. table_ply.Chakra, "DermaDefault", 50, 50, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Nature : " .. table_ply.Nature, "DermaDefault", 50, 100, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        if Learn_Skills.BoostGroup[LocalPlayer():GetUserGroup()] then
            draw.SimpleText("Boost Chakra : Actif", "DermaDefault", 50, 150, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Boost Chakra : Non Actif", "DermaDefault", 50, 150, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    local Close = vgui.Create("DButton", Naruto_Info)
    Close:SetText("")
    Close:SetPos(800-25, 0)
    Close:SetSize(25, 25)
    Close:SetIcon("icon16/cross.png")
    Close.DoClick = function()
        Naruto_Info:Close()
    end
    Close.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
    end

    local ply_list = vgui.Create("DFrame", Naruto_Info)
    ply_list:SetSize(200, 200)
    ply_list:SetTitle("Technique Aprise")
    ply_list:SetPos(25, 180)
    ply_list:ShowCloseButton(false)
    ply_list:SetDraggable(false)
    
    local DScrollPanel = vgui.Create("DScrollPanel", ply_list)
    DScrollPanel:Dock(FILL)

    if table_ply.Weapons then
        DScrollPanel:Clear()
        for b, n in ipairs(table_ply.Weapons) do
            local DLabelx = DScrollPanel:Add("DLabel")
            DLabelx:SetText(n)
            DLabelx:Dock(TOP)
            DLabelx:DockMargin(0, 0, 0, 5)
        end
    else
        DScrollPanel:Clear()
        local DLabelsx = DScrollPanel:Add("DLabel")
        DLabelsx:SetText("Aucune Technique Aprise !")
        DLabelsx:Dock(TOP)
        DLabelsx:DockMargin(0, 0, 0, 5)
    end

    local ply_listi = vgui.Create("DFrame", Naruto_Info)
    ply_listi:SetSize(200, 200)
    ply_listi:SetTitle("Technique de Nature Aprenable")
    ply_listi:SetPos(250, 180)
    ply_listi:ShowCloseButton(false)
    ply_listi:SetDraggable(false)
    
    local DScrollPanela = vgui.Create("DScrollPanel", ply_listi)
    DScrollPanela:Dock(FILL)

    
    for k, v in ipairs(Learn_Skills.Technical.Commun) do
        PrintTable(v)
        --for l, b in ipairs(table.GetKeys( v )) do 
        --    local DLabelx = DScrollPanela:Add("DLabel")
        --    print(b)
        --    DLabelx:SetText(b)
        --    DLabelx:Dock(TOP)
        --    DLabelx:DockMargin(0, 0, 0, 5)
        --end
    end

--    local ply_listd = vgui.Create("DFrame", Naruto_Info)
--    ply_listd:SetSize(200, 200)
--    ply_listd:SetTitle("Technique Commun Aprenable")
--    ply_listd:SetPos(475, 180)
--    ply_listd:ShowCloseButton(false)
--    ply_listd:SetDraggable(false)
--    
--    local DScrollPanels = vgui.Create("DScrollPanel", ply_listd)
--    DScrollPanels:Dock(FILL)
--
--    if table_ply.Weapons then
--        DScrollPanels:Clear()
--        for b, n in ipairs(table_ply.Weapons) do
--            local DLabelx = DScrollPanels:Add("DLabel")
--            DLabelx:SetText(n)
--            DLabelx:Dock(TOP)
--            DLabelx:DockMargin(0, 0, 0, 5)
--        end
--    else
--        DScrollPanels:Clear()
--        local DLabelsx = DScrollPanels:Add("DLabel")
--        DLabelsx:SetText("n")
--        DLabelsx:Dock(TOP)
--        DLabelsx:DockMargin(0, 0, 0, 5)
--    end
end)

net.Receive("naruto_skills_admin", function()
    local table_ply = net.ReadTable()

    local Naruto_Info = vgui.Create("DFrame")
    Naruto_Info:SetSize(Learn_Skills.Size.x, Learn_Skills.Size.y)
    Naruto_Info:Center() 
    Naruto_Info:SetTitle("Naruto Skills by Linventif")
    Naruto_Info:MakePopup()
    Naruto_Info:SetDraggable(true)
    Naruto_Info:ShowCloseButton(false)
    Naruto_Info.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
    end

    local Close = vgui.Create("DButton", Naruto_Info)
    Close:SetText("")
    Close:SetPos(Learn_Skills.Size.x-25, 0)
    Close:SetSize(25, 25)
    Close:SetIcon("icon16/cross.png")
    Close.DoClick = function()
        Naruto_Info:Close()
    end
    Close.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
    end

    local ply_info = vgui.Create("DFrame", Naruto_Info)
    ply_info:SetSize(600, 500)
    ply_info:SetTitle("Joueurs")
    ply_info:SetPos(Learn_Skills.Size.x-627, 50)
    ply_info:ShowCloseButton(false)
    ply_info:SetDraggable(false)

    if Learn_Skills.UserGroup[LocalPlayer():GetUserGroup()] then
        local Closex = vgui.Create("DButton", ply_info)
        Closex:SetText("")
        Closex:SetPos(600-25, 0)
        Closex:SetSize(25, 25)
        Closex:SetIcon("icon16/wrench.png")
        Closex.DoClick = function()
            ply_info:Close()
        end
        Closex.Paint = function(s, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
        end
    end

    local DLabel = vgui.Create("DLabel", ply_info)
    DLabel:SetPos(40, 40)
    DLabel:SetText("Nature : Aucun Joueur Selectioner")
    DLabel:SizeToContents()

    local DLabeli = vgui.Create("DLabel", ply_info)
    DLabeli:SetPos(40, 80)
    DLabeli:SetText("Chakra : Aucun Joueur Selectioner")
    DLabeli:SizeToContents()
    
    local layout = vgui.Create("DListLayout", ply_info)
    layout:SetSize(100, 100)
    layout:SetPos(40, 120)

    local ply_wep = vgui.Create("DFrame", ply_info)
    ply_wep:SetSize(400, 300)
    ply_wep:SetTitle("Technique.s Aprise")
    ply_wep:SetPos(0, 150)
    ply_wep:ShowCloseButton(false)
    ply_wep:SetDraggable(false)
    
    local DScrollPanelx = vgui.Create("DScrollPanel", ply_wep)
    DScrollPanelx:Dock(FILL)

    local ply_list = vgui.Create("DFrame", Naruto_Info)
    ply_list:SetSize(300, 500)
    ply_list:SetTitle("Joueurs Connecter")
    ply_list:SetPos(27, 50)
    ply_list:ShowCloseButton(false)
    ply_list:SetDraggable(false)
    
    local DScrollPanel = vgui.Create("DScrollPanel", ply_list)
    DScrollPanel:Dock(FILL)

    for i, v in ipairs(player.GetAll()) do
    	local DButton = DScrollPanel:Add("DButton")
    	DButton:SetText(v:Nick())
    	DButton:Dock(TOP)
    	DButton:DockMargin(0, 0, 0, 5)
        DButton.DoClick = function()
            local ply_data_info = table_ply[v]
            PrintTable(ply_data_info)
            DLabel:SetText("Nature : " .. ply_data_info.Nature)
            DLabel:SizeToContents()
            DLabeli:SetText("Chakra : " .. ply_data_info.Chakra)
            DLabeli:SizeToContents()
            if ply_data_info.Weapons then
                DScrollPanelx:Clear()
                for b, n in ipairs(ply_data_info.Weapons) do
                    local DLabelx = DScrollPanelx:Add("DLabel")
                    DLabelx:SetText(n)
                    DLabelx:Dock(TOP)
                    DLabelx:DockMargin(0, 0, 0, 5)
                end
            else
                DScrollPanelx:Clear()
                local DLabelsx = DScrollPanelx:Add("DLabel")
                DLabelsx:SetText("n")
                DLabelsx:Dock(TOP)
                DLabelsx:DockMargin(0, 0, 0, 5)
            end
        end
    end
end)