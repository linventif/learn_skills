local hud = {}

function hud:RespX(x) return x/1920*ScrW() end
function hud:RespY(y) return y/1080*ScrH() end
function hud:Resp(x, y) return hud:RespX(x), hud:RespY(y) end

surface.CreateFont( "Simple_Hud_Font", {
    font = "Arial",
    size = hud:RespX(19),
    weight = 500,
    antialias = true,
})

hook.Add("HUDPaint", "HudLogique", function()
    local ply = LocalPlayer()
    if ply:Alive() && IsValid(ply) then
        local name = ply:Nick()
        local money = ply:getDarkRPVar("money")
        if ply:getDarkRPVar("Energy") then
            local food = ply:getDarkRPVar("Energy")
        end
        local chakra = ply:GetNWInt("BCMana", 1000) / ply:GetNWInt("BCMaxMana", 1000)
        local health = ply:Health() / ply:GetMaxHealth()
        --local level = ((ply:getDarkRPVar("xp") or 0)/(((10+(((ply:getDarkRPVar("level") or 1)*((ply:getDarkRPVar("level") or 1)+1)*90))))*LevelSystemConfiguration.XPMult))

        if health > 1 then health = 1 end
        if chakra > 1 then chakra = 1 end


        surface.SetDrawColor(48, 48, 48, 255)
		surface.DrawRect(hud:RespX(40), hud:RespY(1080-124), hud:RespX(372), hud:RespY(84))
        surface.SetDrawColor(81, 81, 81, 255)
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-118), hud:RespX(360), hud:RespY(20))
        surface.SetDrawColor(137, 47, 42, 255)
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-92), hud:RespX(360), hud:RespY(20))
        surface.SetDrawColor(41, 76, 144, 255)
		--surface.DrawRect(hud:RespX(46), hud:RespY(1080-92), hud:RespX(360), hud:RespY(20))
        --surface.SetDrawColor(41, 76, 144, 255)
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-66), hud:RespX(360), hud:RespY(20))
        surface.SetDrawColor(202, 56, 56, 255 )
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-92), hud:RespX(360*health), hud:RespY(20))
        surface.SetDrawColor(56, 105, 202, 255 )
		--surface.DrawRect(hud:RespX(46), hud:RespY(1080-92), hud:RespX(360*level), hud:RespY(20))
        --surface.SetDrawColor(56, 105, 202, 255 )
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-66), hud:RespX(360*chakra), hud:RespY(20))
        draw.SimpleTextOutlined(ply:Nick(), "Simple_Hud_Font", hud:RespX(49), hud:RespY(1080-118), Color( 173, 173, 173, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color(0, 0, 0, 255))
        draw.SimpleTextOutlined((ply:getDarkRPVar("money") or "ERREUR") .. " ¥", "Simple_Hud_Font", hud:RespX(400), hud:RespY(1080-118), Color( 173, 173, 173, 255 ), TEXT_ALIGN_RIGHT, 0, 0, Color(0, 0, 0, 255))
        draw.SimpleTextOutlined(team.GetName(ply:Team()), "Simple_Hud_Font", hud:RespX(220), hud:RespY(1080-118), Color( 173, 173, 173, 255 ), TEXT_ALIGN_CENTER, 0, 0, Color(0, 0, 0, 255))
        draw.SimpleTextOutlined( "Santé : " .. ply:Health() .. " / " .. ply:GetMaxHealth(), "Simple_Hud_Font", hud:RespX(49), hud:RespY(1080-92), Color( 173, 173, 173, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color(0, 0, 0, 255))
        --draw.SimpleTextOutlined( "Level : " .. (ply:getDarkRPVar("level") or 0) .. " - " .. (math.floor(level * 100) or 0) .. " %", "Simple_Hud_Font", hud:RespX(49), hud:RespY(1080-92), Color( 173, 173, 173, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color(0, 0, 0, 255))
        draw.SimpleTextOutlined( "Chakra : " .. ply:GetNWInt("BCMana", 1000) .. " / " .. ply:GetNWInt("BCMaxMana", 1000), "Simple_Hud_Font", hud:RespX(49), hud:RespY(1080-66), Color( 173, 173, 173, 255 ), TEXT_ALIGN_LEFT, 0, 0, Color(0, 0, 0, 255))
    end
end)

hook.Add("HUDShouldDraw", "DefautHUD", function(name )
    if (name == "CHudAmmo" or name == "CHudHealth" or name == "CHudBattery" or name == "DarkRP_HUD" or name == "DarkRP_Hungermod") then
        return false
    end
end)