surface.CreateFont( "Custom_Font_I", {
	font = "Open Sans", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont( "Custom_Font_II", {
	font = "Open Sans", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont( "Custom_Font_III", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 16,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont( "Custom_Font_IV", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 14,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

net.Receive("naruto_message", function()
    local table = net.ReadTable()
    naruto_notif(table)
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
    --Naruto_Info:SetTitle("Naruto Skills by Linventif")
    Naruto_Info:SetTitle(" ")
    Naruto_Info:MakePopup()
    Naruto_Info:SetDraggable(true)
    Naruto_Info:ShowCloseButton(false)
    Naruto_Info.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        --draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
        draw.SimpleText("Vos Informations", "Custom_Font_II", 800/2, 30, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Chakra : " .. table_ply.Chakra, "Custom_Font_I", 30, 80, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Nature : " .. table_ply.Nature, "Custom_Font_I", 230, 80, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        if Learn_Skills.BoostGroup[LocalPlayer():GetUserGroup()] then
            draw.SimpleText("Boost Chakra : Actif", "Custom_Font_I", 430, 80, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Boost Chakra : Non Actif", "Custom_Font_I", 430, 80, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
        draw.SimpleText("Reroll Restant : " .. table_ply.Reroll, "Custom_Font_I", 630, 80, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    local Close = vgui.Create("DButton", Naruto_Info)
    Close:SetText("")
    Close:SetPos(800-35, 10)
    Close:SetSize(25, 25)
    Close:SetIcon("icon16/cross.png")
    Close.DoClick = function()
        Naruto_Info:Close()
    end
    Close.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
    end

    local ply_list = vgui.Create("DFrame", Naruto_Info)
    ply_list:SetSize(240, 250)
    ply_list:SetTitle(" ")
    ply_list:SetPos(30, 120)
    ply_list:ShowCloseButton(false)
    ply_list:SetDraggable(false)
    ply_list.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
        draw.RoundedBox(4, 0, 0, w, 25, Learn_Skills.UI_Color.Other_I)
        draw.SimpleText("Technique Aprise", "Custom_Font_III", 5, 12, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
    
    local DScrollPanel = vgui.Create("DScrollPanel", ply_list)
    DScrollPanel:Dock(FILL)
    DScrollPanel.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end

    if table_ply.Weapons then
        DScrollPanel:Clear()
        for b, n in ipairs(table_ply.Weapons) do
            local DLabelx = DScrollPanel:Add("DLabel")
            DLabelx:SetText(n)
            DLabelx:Dock(TOP)
            DLabelx:SetFont("Custom_Font_IV")
            DLabelx:SetColor(Color(255, 255, 255))  
            DLabelx:DockMargin(0, 0, 0, 5)
        end
    else
        DScrollPanel:Clear()
        local DLabelx = DScrollPanel:Add("DLabel")
        DLabelx:SetText("Aucune Technique Aprise !")
        DLabelx:SetColor(Color(255, 255, 255))  
        DLabelx:Dock(TOP)
        DLabelx:SetFont("Custom_Font_IV")
        DLabelx:DockMargin(0, 0, 0, 5)
    end

    local ply_listi = vgui.Create("DFrame", Naruto_Info)
    ply_listi:SetSize(240, 250)
    ply_listi:SetTitle(" ")
    ply_listi:SetPos(300, 120)
    ply_listi:ShowCloseButton(false)
    ply_listi:SetDraggable(false)
    ply_listi.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
        draw.RoundedBox(4, 0, 0, w, 25, Learn_Skills.UI_Color.Other_I)
        draw.SimpleText("Techniques Aprenable", "Custom_Font_III", 5, 12, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
    
    local DScrollPanela = vgui.Create("DScrollPanel", ply_listi)
    DScrollPanela:Dock(FILL)
    DScrollPanela.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end

    if Learn_Skills.Technical.Commun then
        for k, v in pairs(table.GetKeys(Learn_Skills.Technical.Commun)) do
            local DLabelx = DScrollPanela:Add("DLabel")
            DLabelx:SetText(v)
            DLabelx:SetFont("Custom_Font_IV")
            DLabelx:SetColor(Color(255, 255, 255))
            DLabelx:Dock(TOP)
            DLabelx:DockMargin(0, 0, 0, 5)
        end
    end

    if Learn_Skills.Technical[table_ply.Nature] then
        for k, v in pairs(table.GetKeys(Learn_Skills.Technical[table_ply.Nature])) do
            local DLabelx = DScrollPanela:Add("DLabel")
            DLabelx:SetColor(Color(255, 255, 255))
            DLabelx:SetText(v)
            DLabelx:SetFont("Custom_Font_IV")
            DLabelx:Dock(TOP)
            DLabelx:DockMargin(0, 0, 0, 5)
        end
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

    

    local Button_1 = vgui.Create("DButton", Naruto_Info) 
    Button_1:SetText("Utuliser un Reroll")
    Button_1:SetFont("Custom_Font_III")
    Button_1:SetPos(570, 120)
    Button_1:SetSize(200, 40)
    Button_1:SetColor(Color(255,255,255))
    Button_1.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    Button_1.DoClick = function()
        if table_ply.Reroll > 0 then
            net.Start("naruto_reroll")
            net.SendToServer()
            Naruto_Info:Close()
            RunConsoleCommand("naruto_skills")
        else
            local table_notif = {
                ["string"] = "Vous n'avez pas assez de reroll !",
                ["notif"] = 1,
                ["time"] = 4
            }
            naruto_notif(table_notif)
        end
    end

    local Button_2 = vgui.Create("DButton", Naruto_Info) 
    Button_2:SetText("Bientôt")
    Button_2:SetFont("Custom_Font_III")
    Button_2:SetPos(570, 190)
    Button_2:SetSize(200, 40)
    Button_2:SetColor(Color(255,255,255))
    Button_2.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    --Button_2.DoClick = function()
    --end

    local Button_3 = vgui.Create("DButton", Naruto_Info) 
    Button_3:SetText("Bientôt")
    Button_3:SetFont("Custom_Font_III")
    Button_3:SetPos(570, 260)
    Button_3:SetSize(200, 40)
    Button_3:SetColor(Color(255,255,255))
    Button_3.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    --Button_3.DoClick = function()
    --end
    
    local Button_4 = vgui.Create("DButton", Naruto_Info) 
    Button_4:SetText("Bientôt")
    Button_4:SetFont("Custom_Font_III")
    Button_4:SetPos(570, 330)
    Button_4:SetSize(200, 40)
    Button_4:SetColor(Color(255,255,255))
    Button_4.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    --Button_4.DoClick = function()
    --end
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

concommand.Add("naruto_skills", function(ply, cmd, args)
    net.Start("naruto_cmd")
    net.SendToServer()
end)