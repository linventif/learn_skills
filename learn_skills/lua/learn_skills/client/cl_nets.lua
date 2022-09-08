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
    local frame_main = vgui.Create("DFrame")
    frame_main:SetSize(800, 400)
    frame_main:Center() 
    frame_main:SetTitle(" ")
    frame_main:MakePopup()
    frame_main:SetDraggable(true)
    frame_main:ShowCloseButton(false)
    frame_main.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
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

    local Close = vgui.Create("DButton", frame_main)
    Close:SetText("")
    Close:SetPos(800-35, 10)
    Close:SetSize(25, 25)
    Close:SetIcon("icon16/cross.png")
    Close.DoClick = function()
        frame_main:Close()
    end
    Close.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
    end

    local ply_list = vgui.Create("DFrame", frame_main)
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

    local ply_listi = vgui.Create("DFrame", frame_main)
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

    local Button_1 = vgui.Create("DButton", frame_main) 
    Button_1:SetText("Utuliser un Reroll")
    Button_1:SetFont("Custom_Font_III")
    Button_1:SetPos(570, 190)
    Button_1:SetSize(200, 40)
    Button_1:SetColor(Color(255,255,255))
    Button_1.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    Button_1.DoClick = function()
        if table_ply.Reroll > 0 then
            net.Start("naruto_reroll")
            net.SendToServer()
            frame_main:Close()
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

    local Button_2 = vgui.Create("DButton", frame_main) 
    Button_2:SetText("Informations")
    Button_2:SetFont("Custom_Font_III")
    Button_2:SetPos(570, 120)
    Button_2:SetSize(200, 40)
    Button_2:SetColor(Color(255,255,255))
    Button_2.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    Button_2.DoClick = function()
        frame_main()
    end

    local Button_3 = vgui.Create("DButton", frame_main) 
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
    
    local Button_4 = vgui.Create("DButton", frame_main) 
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



    local frame_main = vgui.Create("DFrame")
    frame_main:SetSize(930, 620)
    frame_main:Center() 
    frame_main:SetTitle("Naruto Skills by Linventif")
    frame_main:MakePopup()
    frame_main:SetDraggable(true)
    frame_main:ShowCloseButton(false)
    frame_main.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
    end



    local button_close = vgui.Create("DButton", frame_main)
    button_close:SetText("")
    button_close:SetPos(930-25, 0)
    button_close:SetSize(25, 25)
    button_close:SetIcon("icon16/cross.png")
    button_close.DoClick = function()
        frame_main:Close()
    end
    button_close.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
    end

    if Learn_Skills.UserGroup[LocalPlayer():GetUserGroup()] then
        local button_seting = vgui.Create("DButton", frame_main)
        button_seting:SetText("")
        button_seting:SetPos(930-50, 0)
        button_seting:SetSize(25, 25)
        button_seting:SetIcon("icon16/wrench.png")
        button_seting.DoClick = function()
            ply_info:Close()
        end
        button_seting.Paint = function(s, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
        end
    end



    local label_ply_info = vgui.Create("DLabel", frame_main)
    label_ply_info:SetPos(490, 50)
    label_ply_info:SetColor(Color(255, 255, 255))
    label_ply_info:SetText("Informations Joueur")
    label_ply_info:SetFont("Custom_Font_II")
    label_ply_info:SizeToContents()

    local label_ply = vgui.Create("DLabel", frame_main)
    label_ply:SetPos(300, 110)
    label_ply:SetColor(Color(255, 255, 255))
    label_ply:SetText("Joueur : Non Selectioner")
    label_ply:SetFont("Custom_Font_I")
    label_ply:SizeToContents()

    local label_nature = vgui.Create("DLabel", frame_main)
    label_nature:SetPos(550, 110)
    label_nature:SetColor(Color(255, 255, 255))
    label_nature:SetText("Nature : X")
    label_nature:SetFont("Custom_Font_I")
    label_nature:SizeToContents()

    local label_chakra = vgui.Create("DLabel", frame_main)
    label_chakra:SetPos(750, 110)
    label_chakra:SetColor(Color(255, 255, 255))
    label_chakra:SetText("Chakra : X")
    label_chakra:SetFont("Custom_Font_I")
    label_chakra:SizeToContents()

    local label_ply_aprend = vgui.Create("DLabel", frame_main)
    label_ply_aprend:SetPos(465, 430)
    label_ply_aprend:SetColor(Color(255, 255, 255))
    label_ply_aprend:SetText("Enseigniez une Technique")
    label_ply_aprend:SetFont("Custom_Font_II")
    label_ply_aprend:SizeToContents()
    

    
    local ply_list = vgui.Create("DFrame", frame_main)
    ply_list:SetSize(240, 540)
    ply_list:SetTitle(" ")
    ply_list:SetPos(30, 50)
    ply_list:ShowCloseButton(false)
    ply_list:SetDraggable(false)
    ply_list.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
        draw.RoundedBox(4, 0, 0, w, 25, Learn_Skills.UI_Color.Other_I)
        draw.SimpleText("Joueurs Connecter", "Custom_Font_III", 240/2, 12, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local ply_lean = vgui.Create("DFrame", frame_main)
    ply_lean:SetSize(285, 250)
    ply_lean:SetTitle(" ")
    ply_lean:SetPos(615, 160)
    ply_lean:ShowCloseButton(false)
    ply_lean:SetDraggable(false)
    ply_lean.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
        draw.RoundedBox(4, 0, 0, w, 25, Learn_Skills.UI_Color.Other_I)
        draw.SimpleText("Techniques Aprenable", "Custom_Font_III", 285/2, 12, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local ply_wep = vgui.Create("DFrame", frame_main)
    ply_wep:SetSize(285, 250)
    ply_wep:SetTitle(" ")
    ply_wep:SetPos(300, 160)
    ply_wep:ShowCloseButton(false)
    ply_wep:SetDraggable(false)
    ply_wep.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
        draw.RoundedBox(4, 0, 0, w, 25, Learn_Skills.UI_Color.Other_I)
        draw.SimpleText("Techniques Aprise", "Custom_Font_III", 285/2, 12, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end



    local combo_wep = vgui.Create( "DComboBox", frame_main )
    combo_wep:SetPos(300, 480)
    combo_wep:SetSize( 200, 40 )
    combo_wep:SetValue("Technique")
    combo_wep.OnSelect = function( self, index, value )
    	print( value .. " was selected at index " .. index )
    end

    local combo_time = vgui.Create( "DComboBox", frame_main )
    combo_time:SetPos(550, 480)
    combo_time:SetSize( 100, 40 )
    combo_time:SetValue("Temps")
    combo_time:AddChoice("z")
    combo_time.OnSelect = function( self, index, value )
    	print( value .. " was selected at index " .. index )
    end



    local scroll_ply_wep = vgui.Create("DScrollPanel", ply_lean)
    scroll_ply_wep:Dock(FILL)
    
    local scroll_ply_wep_learn = vgui.Create("DScrollPanel", ply_wep)
    scroll_ply_wep_learn:Dock(FILL)
    
    local scroll_ply = vgui.Create("DScrollPanel", ply_list)
    scroll_ply:Dock(FILL)



    for i, v in ipairs(player.GetAll()) do
    	local button_ply = scroll_ply:Add("DButton")
    	button_ply:SetText(v:Nick())
    	button_ply:Dock(TOP)
    	button_ply:DockMargin(0, 0, 0, 5)
        
        ply_list.Paint = function(s, w, h)
            draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
            draw.RoundedBox(4, 0, 0, w, 25, Learn_Skills.UI_Color.Other_I)
            draw.SimpleText("Joueurs Connecter", "Custom_Font_III", 240/2, 12, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        button_ply.DoClick = function()
            local ply_data_info = table_ply[v]

            label_nature:SetText("Nature : " .. ply_data_info.Nature)
            label_nature:SizeToContents()
            label_chakra:SetText("Chakra : " .. ply_data_info.Chakra)
            label_chakra:SizeToContents()
            label_ply:SetText("Joueurs : " .. v:Nick())
            label_ply:SizeToContents()

            scroll_ply_wep:Clear()
            combo_wep:Clear()
            
            if Learn_Skills.Technical.Commun then
                for k, v in pairs(table.GetKeys(Learn_Skills.Technical.Commun)) do
                    combo_wep:AddChoice(v)
                    local label_wep_com = scroll_ply_wep:Add("DLabel")
                    label_wep_com:SetText(v)
                    label_wep_com:SetFont("Custom_Font_IV")
                    label_wep_com:SetColor(Color(255, 255, 255))
                    label_wep_com:Dock(TOP)
                    label_wep_com:DockMargin(0, 0, 0, 5)
                end
            end

            if Learn_Skills.Technical[ply_data_info.Nature] then
                for k, v in pairs(table.GetKeys(Learn_Skills.Technical[ply_data_info.Nature])) do
                    combo_wep:AddChoice(v)
                    local label_wep_nat = scroll_ply_wep:Add("DLabel")
                    label_wep_nat:SetColor(Color(255, 255, 255))
                    label_wep_nat:SetText(v)
                    label_wep_nat:SetFont("Custom_Font_IV")
                    label_wep_nat:Dock(TOP)
                    label_wep_nat:DockMargin(0, 0, 0, 5)
                end
            end

            if ply_data_info.Weapons then
                scroll_ply_wep_learn:Clear()
                for b, n in ipairs(ply_data_info.Weapons) do
                    local label_wep_learn = scroll_ply_wep_learn:Add("DLabel")
                    label_wep_learn:SetText(n)
                    label_wep_learn:SetColor(Color(255, 255, 255))
                    label_wep_learn:SetFont("Custom_Font_IV")
                    label_wep_learn:Dock(TOP)
                    label_wep_learn:DockMargin(0, 0, 0, 5)
                end
            else
                scroll_ply_wep_learn:Clear()
                local label_wep_learn = scroll_ply_wep_learn:Add("DLabel")
                label_wep_learn:SetText("Aucune Techniques Aprise")
                label_wep_learn:SetFont("Custom_Font_IV")
                label_wep_learn:SetColor(Color(255, 255, 255))
                label_wep_learn:Dock(TOP)
                label_wep_learn:DockMargin(0, 0, 0, 5)
            end
        end
    end
    
end)

concommand.Add("naruto_skills", function(ply, cmd, args)
    net.Start("naruto_cmd")
    net.SendToServer()
end)