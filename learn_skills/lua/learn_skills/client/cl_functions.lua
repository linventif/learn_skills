function naruto_skills_admin(table)
    print("é")
end

function naruto_skills()
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
end