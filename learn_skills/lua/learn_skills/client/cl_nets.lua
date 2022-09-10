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

local ply_selc = nil


local nb_apprend = 0
net.Receive("naruto_message", function()
    local table = net.ReadTable()
    naruto_notif(table)
end)

net.Receive("naruto_table", function()
    local table = net.ReadTable()
    timer.Simple(4, function()
        chat.AddText(Color(255, 255, 255), "Votre aventure commence en temps que ", Color(108, 216, 216), table.Nature, Color(255, 255, 255), " ainsi qu'avec ", Color(108, 216, 216), util.TypeToString(table.Chakra), Color(255, 255, 255), " de chakra.")
    end)
end)


net.Receive("skills_advert", function()
    local data_table = net.ReadTable()
    chat.AddText(Color(255, 100, 0), "Skills Learn | ", Color(255, 255, 255), data_table.ply:Nick() .. " a appris avec succes ", Color(108, 216, 216), data_table.wep)
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
        draw.SimpleText("Technique Apprise", "Custom_Font_III", 5, 12, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
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
        DLabelx:SetText("Aucune Technique Apprise !")
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
        draw.SimpleText("Techniques Apprenable", "Custom_Font_III", 5, 12, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
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
    Button_1:SetText("Utiliser un Reroll")
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
        naruto_info()
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
    frame_main:SetSize(930, 550)
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

--    if Learn_Skills.UserGroup[LocalPlayer():GetUserGroup()] then
--        local button_seting = vgui.Create("DButton", frame_main)
--        button_seting:SetText("")
--        button_seting:SetPos(930-50, 0)
--        button_seting:SetSize(25, 25)
--        button_seting:SetIcon("icon16/wrench.png")
--        button_seting.DoClick = function()
--            ply_info:Close()
--        end
--        button_seting.Paint = function(s, w, h)
--            draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
--        end
--    end



    local label_ply_info = vgui.Create("DLabel", frame_main)
    label_ply_info:SetPos(490, 50)
    label_ply_info:SetColor(Color(255, 255, 255))
    label_ply_info:SetText("Informations Joueur")
    label_ply_info:SetFont("Custom_Font_II")
    label_ply_info:SizeToContents()

    local label_ply = vgui.Create("DLabel", frame_main)
    label_ply:SetPos(300, 110)
    label_ply:SetColor(Color(255, 255, 255))
    label_ply:SetText("Joueur : Non Selectionné")
    label_ply:SetFont("Custom_Font_I")
    label_ply:SizeToContents()

    local label_nature = vgui.Create("DLabel", frame_main)
    label_nature:SetPos(550, 110)
    label_nature:SetColor(Color(255, 255, 255))
    label_nature:SetText("Nature : ")
    label_nature:SetFont("Custom_Font_I")
    label_nature:SizeToContents()

    local label_chakra = vgui.Create("DLabel", frame_main)
    label_chakra:SetPos(750, 110)
    label_chakra:SetColor(Color(255, 255, 255))
    label_chakra:SetText("Chakra : ")
    label_chakra:SetFont("Custom_Font_I")
    label_chakra:SizeToContents()

    local label_ply_aprend = vgui.Create("DLabel", frame_main)
    label_ply_aprend:SetPos(425, 430)
    label_ply_aprend:SetColor(Color(255, 255, 255))
    label_ply_aprend:SetText("Enseignez une Technique Apprise")
    label_ply_aprend:SetFont("Custom_Font_II")
    label_ply_aprend:SizeToContents()
    

    
    local ply_list = vgui.Create("DFrame", frame_main)
    ply_list:SetSize(240, 470)
    ply_list:SetTitle(" ")
    ply_list:SetPos(30, 50)
    ply_list:ShowCloseButton(false)
    ply_list:SetDraggable(false)
    ply_list.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
        draw.RoundedBox(4, 0, 0, w, 25, Learn_Skills.UI_Color.Other_I)
        draw.SimpleText("Joueurs Connectés", "Custom_Font_III", 240/2, 12, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
        draw.SimpleText("Techniques Apprenable", "Custom_Font_III", 285/2, 12, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
        draw.SimpleText("Techniques Apprise", "Custom_Font_III", 285/2, 12, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end



    local combo_wep = vgui.Create( "DComboBox", frame_main )
    combo_wep:SetPos(300, 480)
    combo_wep:SetColor(Color(255, 255, 255))
    combo_wep:SetFont("Custom_Font_III")
    combo_wep:SetSize( 240, 40 )
    combo_wep:SetValue("Technique Enseignable")
    combo_wep:SetSortItems(false)
    combo_wep.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end

    local combo_time = vgui.Create( "DComboBox", frame_main )
    combo_time:SetPos(600, 480)
    combo_time:SetFont("Custom_Font_III")
    combo_time:SetColor(Color(255, 255, 255))
    combo_time:SetSize( 120, 40 )
    combo_time:SetValue("Temps")
    combo_time:AddChoice("15 Minutes")
    combo_time:AddChoice("30 Minutes")
    combo_time:AddChoice("45 Minutes")
    combo_time:AddChoice("60 Minutes")
    combo_time:AddSpacer()
    combo_time:AddChoice("2 Heures")
    combo_time:AddChoice("6 Heures")
    combo_time:AddChoice("12 Heures")
    combo_time:AddChoice("24 Heures")
    combo_time:AddSpacer()
    combo_time:AddChoice("2 Jours")
    combo_time:AddChoice("4 Jours")
    combo_time:AddChoice("8 Jours")
    combo_time:SetSortItems(false)
    combo_time.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end



    local scroll_ply_wep = vgui.Create("DScrollPanel", ply_lean)
    scroll_ply_wep:Dock(FILL)
    
    local scroll_ply_wep_learn = vgui.Create("DScrollPanel", ply_wep)
    scroll_ply_wep_learn:Dock(FILL)
    
    local scroll_ply = vgui.Create("DScrollPanel", ply_list)
    scroll_ply:Dock(FILL)

    local ply_all_test = {}

    for i, v in ipairs(player.GetAll()) do
    	local button_ply = scroll_ply:Add("DButton")
    	button_ply:SetText(v:Nick())
    	button_ply:Dock(TOP)
    	button_ply:DockMargin(0, 0, 0, 5)
        
        ply_list.Paint = function(s, w, h)
            draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
            draw.RoundedBox(4, 0, 0, w, 25, Learn_Skills.UI_Color.Other_I)
            draw.SimpleText("Joueurs Connectés", "Custom_Font_III", 240/2, 12, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        button_ply.DoClick = function()
            local ply_data_info = table_ply[v]
            ply_all_test.ply = v

            label_nature:SetText("Nature : " .. ply_data_info.Nature)
            label_nature:SizeToContents()
            label_chakra:SetText("Chakra : " .. ply_data_info.Chakra)
            label_chakra:SizeToContents()
            label_ply:SetText("Joueurs : " .. v:Nick())
            label_ply:SizeToContents()

            scroll_ply_wep:Clear()
            combo_wep:Clear()
            combo_wep:SetValue("Technique Enseignable")
            
            if Learn_Skills.Technical.Commun then
                for k, v in pairs(table.GetKeys(Learn_Skills.Technical.Commun)) do
                    local label_wep_com = scroll_ply_wep:Add("DLabel")
                    label_wep_com:SetText(v)
                    label_wep_com:SetFont("Custom_Font_IV")
                    label_wep_com:SetColor(Color(255, 255, 255))
                    label_wep_com:Dock(TOP)
                    label_wep_com:DockMargin(0, 0, 0, 5)
                    if LocalPlayer():GetWeapon(v):IsValid() then
                        combo_wep:AddChoice(v)
                    end
                end
            end

            if Learn_Skills.Technical[ply_data_info.Nature] then
                for k, v in pairs(table.GetKeys(Learn_Skills.Technical[ply_data_info.Nature])) do
                    local label_wep_nat = scroll_ply_wep:Add("DLabel")
                    label_wep_nat:SetColor(Color(255, 255, 255))
                    label_wep_nat:SetText(v)
                    label_wep_nat:SetFont("Custom_Font_IV")
                    label_wep_nat:Dock(TOP)
                    label_wep_nat:DockMargin(0, 0, 0, 5)
                    if LocalPlayer():GetWeapon(v):IsValid() then
                        combo_wep:AddChoice(v)
                    end
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
                label_wep_learn:SetText("Aucune Techniques Apprise")
                label_wep_learn:SetFont("Custom_Font_IV")
                label_wep_learn:SetColor(Color(255, 255, 255))
                label_wep_learn:Dock(TOP)
                label_wep_learn:DockMargin(0, 0, 0, 5)
            end
        end
    end

    local button_teach = vgui.Create("DButton", frame_main) 
    button_teach:SetText("Enseignez")
    button_teach:SetPos(780, 480)
    button_teach:SetFont("Custom_Font_III")
    button_teach:SetSize(120, 40)
    button_teach:SetColor(Color(255,255,255))
    button_teach.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    local anti_spam = CurTime() + 2
    button_teach.DoClick = function()
        if anti_spam < CurTime() then
            anti_spam = CurTime() + 2
            if ply_all_test.ply then
                if LocalPlayer() != ply_all_test.ply then
                    if !combo_wep:GetSelected() or !combo_time:GetSelected() then
                        notification.AddLegacy("Vous avez oublié de mettre un temps ou une technique !", 1,4)
                    else
                        if nb_apprend > 2 then
                            notification.AddLegacy("Vous ne pouvez pas commencez plus d'apprentisage ! ", 1,4)
                        else
                            notification.AddLegacy("Proposition d'apprentisage envoyer !", 0, 4)
                            ply_all_test.wep = combo_wep:GetSelected()
                            ply_all_test.time = combo_time:GetSelected()
                            net.Start("naruto_skills_learn_server")
                            net.WriteTable(ply_all_test)
                            net.SendToServer()
                        end
                    end
                else
                    notification.AddLegacy("Vous ne pouvez pas vous ciblez !", 1,4)
                end
            else
                notification.AddLegacy("Vous n'avez pas selectionné de joueur !", 1,4)
            end
        else
            notification.AddLegacy("STOP SPAM FILS DE FLUTE", 1,4)
        end
    end
    
end)

net.Receive("naruto_skills_learn_client", function(len, ply)
    local ply_data = net.ReadTable()

    local DFrame = vgui.Create("DFrame")
    DFrame:SetPos(ScrW()-350, 50)
    DFrame:SetSize(300, 200)
    DFrame:SetTitle(" ")
    DFrame:SetDraggable(false)
    DFrame:ShowCloseButton(false)
    DFrame.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        --draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
        draw.SimpleText("Proposition d'Apprentisage", "Custom_Font_I", 300/2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local button_accept = vgui.Create("DButton", DFrame) 
    button_accept:SetText("Accepter")
    button_accept:SetPos(20 , 140)
    button_accept:SetFont("Custom_Font_III")
    button_accept:SetSize(120, 40)
    button_accept:SetColor(Color(255,255,255))
    button_accept.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    button_accept.DoClick = function()
        net.Start("naruto_skills_learn_a")
        net.WriteTable(ply_data)
        net.SendToServer()
        DFrame:Close()
    end

    local button_refuse = vgui.Create("DButton", DFrame) 
    button_refuse:SetText("Refuser")
    button_refuse:SetPos(160, 140)
    button_refuse:SetFont("Custom_Font_III")
    button_refuse:SetSize(120, 40)
    button_refuse:SetColor(Color(255,255,255))
    button_refuse.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    button_refuse.DoClick = function()
        DFrame:Close()
    end


    local label_ply = vgui.Create("DLabel", DFrame)
    label_ply:SetPos(40, 50)
    label_ply:SetColor(Color(255, 255, 255))
    label_ply:SetText("Technique : " .. ply_data.wep)
    label_ply:SetFont("Custom_Font_III")
    label_ply:SizeToContents()


    local label_plya = vgui.Create("DLabel", DFrame)
    label_plya:SetPos(40, 80)
    label_plya:SetColor(Color(255, 255, 255))
    label_plya:SetText("Temps Nécésaire  : " .. ply_data.time)
    label_plya:SetFont("Custom_Font_III")
    label_plya:SizeToContents()


    local label_plyz = vgui.Create("DLabel", DFrame)
    label_plyz:SetPos(40, 110)
    label_plyz:SetColor(Color(255, 255, 255))
    label_plyz:SetText("Instructeur : " .. ply_data.instructor:Nick())
    label_plyz:SetFont("Custom_Font_III")
    label_plyz:SizeToContents()
end)

net.Receive("skills_teatching", function()
    local ply_data = net.ReadTable()

    local DFrame = vgui.Create("DFrame")
    if nb_apprend == 0 then
        DFrame:SetPos(ScrW()-350, 50)
    elseif nb_apprend == 1 then
        DFrame:SetPos(ScrW()-350, 350)
    elseif nb_apprend == 2 then
        DFrame:SetPos(ScrW()-350, 650)
    end
    DFrame:SetSize(300, 240)
    DFrame:SetTitle(" ")
    DFrame:SetDraggable(false)
    DFrame:ShowCloseButton(false)
    DFrame.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        --draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
        draw.SimpleText("Apprentissage en Cours", "Custom_Font_I", 300/2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Terminer l'Apprentissage", "Custom_Font_I", 300/2, 155, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local button_accept = vgui.Create("DButton", DFrame) 
    button_accept:SetText("Réusit")
    button_accept:SetPos(20 , 180)
    button_accept:SetFont("Custom_Font_III")
    button_accept:SetSize(120, 40)
    button_accept:SetColor(Color(255,255,255))
    button_accept.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    button_accept.DoClick = function()
        ply_data.succes = true
        net.Start("skills_teatching_end")
        net.WriteTable(ply_data)
        net.SendToServer()
        DFrame:Close()
        nb_apprend = nb_apprend -1
    end

    local button_refuse = vgui.Create("DButton", DFrame) 
    button_refuse:SetText("Echec")
    button_refuse:SetPos(160, 180)
    button_refuse:SetFont("Custom_Font_III")
    button_refuse:SetSize(120, 40)
    button_refuse:SetColor(Color(255,255,255))
    button_refuse.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end
    button_refuse.DoClick = function()
        ply_data.succes = false
        net.Start("skills_teatching_end")
        net.WriteTable(ply_data)
        net.SendToServer()
        DFrame:Close()
        nb_apprend = nb_apprend -1
    end


    local label_ply = vgui.Create("DLabel", DFrame)
    label_ply:SetPos(40, 50)
    label_ply:SetColor(Color(255, 255, 255))
    label_ply:SetText("Technique : " .. ply_data.wep)
    label_ply:SetFont("Custom_Font_III")
    label_ply:SizeToContents()


    local label_plya = vgui.Create("DLabel", DFrame)
    label_plya:SetPos(40, 80)
    label_plya:SetColor(Color(255, 255, 255))
    label_plya:SetText("Temps Nécéssaire  : " .. ply_data.time)
    label_plya:SetFont("Custom_Font_III")
    label_plya:SizeToContents()


    local label_plyz = vgui.Create("DLabel", DFrame)
    label_plyz:SetPos(40, 110)
    label_plyz:SetColor(Color(255, 255, 255))
    label_plyz:SetText("Instructeur : " .. ply_data.instructor:Nick())
    label_plyz:SetFont("Custom_Font_III")
    label_plyz:SizeToContents()
    nb_apprend = nb_apprend + 1
end)


net.Receive("skills_learning", function()
    
    local ply_data = net.ReadTable()

    local DFrame = vgui.Create("DFrame")
    DFrame:SetPos(ScrW()-350, 50)
    DFrame:SetSize(300, 160)
    DFrame:SetTitle(" ")
    DFrame:SetDraggable(false)
    DFrame:ShowCloseButton(false)
    DFrame.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        --draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
        draw.SimpleText("Apprentisage en Cours", "Custom_Font_I", 300/2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local button_close = vgui.Create("DButton", DFrame)
    button_close:SetText("")
    button_close:SetPos(300-25, 0)
    button_close:SetSize(25, 25)
    button_close:SetIcon("icon16/cross.png")
    button_close.DoClick = function()
        DFrame:Close()
    end
    button_close.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
    end

    local label_ply = vgui.Create("DLabel", DFrame)
    label_ply:SetPos(40, 50)
    label_ply:SetColor(Color(255, 255, 255))
    label_ply:SetText("Technique : " .. ply_data.wep)
    label_ply:SetFont("Custom_Font_III")
    label_ply:SizeToContents()


    local label_plya = vgui.Create("DLabel", DFrame)
    label_plya:SetPos(40, 80)
    label_plya:SetColor(Color(255, 255, 255))
    label_plya:SetText("Temps Nécéssaire  : " .. ply_data.time)
    label_plya:SetFont("Custom_Font_III")
    label_plya:SizeToContents()


    local label_plyz = vgui.Create("DLabel", DFrame)
    label_plyz:SetPos(40, 110)
    label_plyz:SetColor(Color(255, 255, 255))
    label_plyz:SetText("Instructeur : " .. ply_data.instructor:Nick())
    label_plyz:SetFont("Custom_Font_III")
    label_plyz:SizeToContents()
end)

concommand.Add("naruto_skills", function(ply, cmd, args)
    net.Start("naruto_cmd")
    net.SendToServer()
end)