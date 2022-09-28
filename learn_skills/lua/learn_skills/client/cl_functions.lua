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

surface.CreateFont( "Custom_Font_V", {
	font = "Open Sans", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 26,
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

function skills_client_notif(string, notif, time)
    local table = {
        ["string"] = string,
        ["notif"] = notif,
        ["time"] = time
    }
    naruto_notif(table)
end

function naruto_notif(notif)
    PrintTable(notif)
    notification.AddLegacy(notif.string, notif.notif, notif.time)
    print(notif.string)
end

function skills_message(message, delay)
    timer.Simple(delay, function()
        chat.AddText(Color(255, 100, 0), "Learn Skills | ", message.color_1, message.string_1, message.color_2, message.string_2, message.color_3, message.string_3, message.color_4, message.string_4, message.color_5, message.string_5)
    end)
end

function net_to_server(info, target)
    net.Start("skills_cmd")
    net.WriteString(util.TableToJSON(info))
    net.WriteEntity(target)
    net.SendToServer()
end

function naruto_info()
    local Naruto_Info = vgui.Create("DFrame")
    Naruto_Info:SetSize(800, 510)
    Naruto_Info:Center()
    Naruto_Info:SetTitle("Naruto Skills by Linventif")
    Naruto_Info:MakePopup()
    Naruto_Info:SetDraggable(true)
    Naruto_Info:ShowCloseButton(false)
    Naruto_Info.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        draw.SimpleText("Informations", "Custom_Font_II", 800/2, 30, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Chakra : Votre force, quand vous n'en avais plus vous ne pouvez plus utuliser de capacité / technique", "Custom_Font_I", 30, 80, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Nature : Définit les capacité / technique que vous pouvez apprendre et utuliser", "Custom_Font_I", 30, 120, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Boost : Augemente le chakra gagnier automatiquement ", "Custom_Font_I", 30, 160, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Reroll : Permet de changer aléatoirement de Nature", "Custom_Font_I", 30, 200, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        draw.SimpleText("Probabilité : Nature Pure", "Custom_Font_V", 800/2, 260, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.SimpleText("Futon : 19.2 %", "Custom_Font_I", 30, 310, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Doton : 19.2 %", "Custom_Font_I", 180, 310, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Katon : 19.2 %", "Custom_Font_I", 350, 310, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Suiton : 19.2 %", "Custom_Font_I", 480, 310, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Raiton : 19.2 %", "Custom_Font_I", 650, 310, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)


        draw.SimpleText("Probabilité : Nature Hybride", "Custom_Font_V", 800/2, 380, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.SimpleText("Futton : 0.5 %", "Custom_Font_I", 30, 430, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Jinton : 0.5 %", "Custom_Font_I",  230, 430, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Jiton Dorée : 0.5 %", "Custom_Font_I", 430, 430, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Shoton : 0.5 %", "Custom_Font_I", 630, 430, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        draw.SimpleText("Bakuton : 0.5 %", "Custom_Font_I", 30, 470, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Shakuton : 0.5 %", "Custom_Font_I",  230, 470, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Ranton : 0.5 %", "Custom_Font_I", 430, 470, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("Puple Raiton : 0.5 %", "Custom_Font_I", 630, 470, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

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
end