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

    local Main_Frame = vgui.Create("DFrame")
    Main_Frame:SetSize(Learn_Skills.Size.x, Learn_Skills.Size.y)
    Main_Frame:Center()
    Main_Frame:SetTitle("Naruto Skills by Linventif")
    Main_Frame:MakePopup()
    Main_Frame:SetDraggable(true)
    Main_Frame:ShowCloseButton(false)
    Main_Frame.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
        draw.RoundedBox(0, 0, 0, w, 23, Learn_Skills.UI_Color.Other)
    end

    local Button_Close = vgui.Create("DButton", Main_Frame)
    Button_Close:SetText("")
    Button_Close:SetPos(Learn_Skills.Size.x-25, 0)
    Button_Close:SetSize(25, 25)
    Button_Close:SetIcon("icon16/cross.png")
    Button_Close.DoClick = function()
    	Main_Frame:Close()
    end
    Button_Close.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Transparent)
    end
    
    local Second_Frame = vgui.Create("DFrame", Main_Frame )
    Second_Frame:SetSize(300, 600)
    Second_Frame:SetPos(10, 35)
    Second_Frame:SetTitle("Armes")
    Second_Frame:SetDraggable(false)
    Second_Frame:ShowCloseButton(false)
    Second_Frame.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Learn_Skills.UI_Color.Other)
    end

    local AppList = vgui.Create( "DListView", Second_Frame )
    AppList:Dock( FILL )
    AppList:SetMultiSelect( false )
    AppList:AddColumn( "Technique" )
    AppList:AddColumn( "Temps Nécésaire" )
    
    for k, v in pairs(table.Weapons) do 
        AppList:AddLine(v)
    end

    AppList.OnRowSelected = function( lst, index, pnl )
    	print( "Selected " .. pnl:GetColumnText( 1 ) .. " ( " .. pnl:GetColumnText( 2 ) .. " ) at index " .. index )
    end
end)