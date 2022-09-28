net.Receive("lean_skills_new_admin", function()
    local frame_main = vgui.Create("DFrame")
    frame_main:SetSize(800, 400)
    frame_main:Center()
    frame_main:SetTitle(" ")
    frame_main:MakePopup()
    frame_main:SetDraggable(true)
    frame_main:ShowCloseButton(false)
    frame_main.Paint = function(s, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Learn_Skills.UI_Color.Background)
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
end)