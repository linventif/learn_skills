local Kuro = Kuro or {}

function Kuro:RespX(x) return x/1920*ScrW() end
function Kuro:RespY(y) return y/1080*ScrH() end
function Kuro:Resp(x, y) return Kuro:RespX(x), Kuro:RespY(y) end

surface.CreateFont( "Zuk", {
  font = "Lato Light",
  size = Kuro:RespX(45),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuk2", {
  font = "Lato Regular",
  size = Kuro:RespX(27),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuk28", {
  font = "Caviar Dreams",
  size = Kuro:RespX(21),
  weight = 1350,
  antialias = true,
} )


surface.CreateFont( "Zuk3", {
  font = "Lato Light",
  size = Kuro:RespX(19),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuk5", {
  font = "Lato Light",
  size = Kuro:RespX(20),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuk4", {
  font = "lazer84",
  size = Kuro:RespX(60),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuk8", {
  font = "lazer84",
  size = Kuro:RespX(60),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuk9", {
  font = "lazer84",
  size = Kuro:RespX(26),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuk11", {
  font = "lazer84",
  size = Kuro:RespX(30),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Degat", {
  font = "Lato Light",
  size = Kuro:RespX(30),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Degat1", {
  font = "Lato Light",
  size = Kuro:RespX(16),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Degat2", {
  font = "lazer84",
  size = Kuro:RespX(34),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuka", {
  font = "Lato Light",
  size = Kuro:RespX(45),
  weight = 1350,
  antialias = true,
} )

surface.CreateFont( "Zuk10", {
  font = "lazer84",
  size = Kuro:RespX(23),
  weight = 1000,
  antialias = true,
} )
local OldXP = 0
local HUD15 = Material("lddshudnextgen/ldds_hud.png")
local TRUC = Material("lddshudnextgen/truc.png")
local HUD16 = Material("lddshudnextgen/ldds_hud_chakra.png")
local barvie = Material("lddshudnextgen/barre_rouge.png")
local bararmur = Material("lddshudnextgen/barre_bleue.png")
local barfood = Material("lddshudnextgen/barre_orange_.png")

local function H(s)
    return ScrH() / 1080 * s
end

local function W(s)
    return ScrW() / 1910 * s
end

function MakeDmodel()

    local DPanel = vgui.Create( "DPanel" )
    DPanel:SetPos( Kuro:Resp(60, 0.75 )) 
    DPanel:SetSize( Kuro:Resp(220, 200 ))
	DPanel.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
		end

    local icon = vgui.Create("DModelPanel")
    icon:SetSize(Kuro:Resp(70,70))
    icon:SetPos(Kuro:Resp(57,980))
    icon:SetModel(LocalPlayer():GetModel())
    function icon:LayoutEntity(Entity) return end
    function icon.Entity:GetPlayerColor() return LocalPlayer():GetPlayerColor() end
    icon:SetFOV(12)
    icon:SetCamPos(Vector(85,-20,65))
    icon:SetLookAt(Vector(0,0,62))
    icon.Entity:SetEyeTarget(Vector(200, 200, 100))

        timer.Create("UpdateIcon",0.5, 0,function()
        if icon:IsValid() and LocalPlayer():GetModel() != icon.Entity:GetModel() then
            icon:SetModel(LocalPlayer():GetModel())
        end
    end)
    return icon
end

local Health = 0
local smoothxp = 0

local ketsutern = "models/props_combine/tprings_globe"
local pattern = Material("pp/texturize/plain.png")

hook.Add( "HUDPaint", "HudLogique", function()
	if LocalPlayer():GetNWBool("ketsuryugan") then
		DrawMaterialOverlay( ketsutern, 0.08 )
	elseif LocalPlayer():GetNWBool("byakugan") then
		DrawTexturize( 10, pattern )
	end
	
	if LocalPlayer():Alive() && IsValid(LocalPlayer()) then
        local ply = LocalPlayer()
		local name = LocalPlayer():GetName()
		local money = LocalPlayer():getDarkRPVar( "money" )
        local chakra = ply:GetNWInt("BCMana", 1000)
        local chakra_max = ply:GetNWInt("BCMaxMana", 1000)		
		local coef = chakra / chakra_max
		
		local maxHealth = LocalPlayer():GetMaxHealth()
		local myHealth = LocalPlayer():Health()
		Health = math.min(maxHealth, (Health == myHealth and Health) or Lerp(0.1, Health, myHealth))
		local healthRatio = math.Min(Health / maxHealth, 1)
        
        
		surface.SetDrawColor(96, 25, 4, 255 )
		surface.DrawRect(  Kuro:RespX(141),  Kuro:RespY(1043), Kuro:RespX(156),  Kuro:RespY(8) )
		
		surface.SetDrawColor( 96, 25, 4, 255 )
		surface.DrawRect(  Kuro:RespX(145),  Kuro:RespY(1023), Kuro:RespX(201),  Kuro:RespY(10) )
		
		surface.SetDrawColor( 96, 25, 4, 255 )
		surface.DrawRect(  Kuro:RespX(148),  Kuro:RespY(989), Kuro:RespX(299),  Kuro:RespY(15) )
		
		surface.SetDrawColor( 225, 69, 69, 255 )
		surface.DrawRect(  Kuro:RespX(148),  Kuro:RespY(990.5), Kuro:RespX(299) * healthRatio,  Kuro:RespY(15) )
		
		local armor = math.Clamp(LocalPlayer():Armor(), 0, 200)
		if armor ~= 0 then
			surface.SetDrawColor( 68, 160, 232, 255 )
			surface.DrawRect(  Kuro:RespX(145),  Kuro:RespY(1024), Kuro:RespX(1.008) * armor,  Kuro:RespY(8) )
		end
		
		local food = math.Clamp(LocalPlayer():getDarkRPVar( "Energy" ), 0, 100)
		if food ~= 0 then
			surface.SetDrawColor(240, 139, 11, 255 )
			surface.DrawRect(  Kuro:RespX(138),  Kuro:RespY(1043), Kuro:RespX(0.8) * food,  Kuro:RespY(9) )
		end
		
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( HUD15	)
		surface.DrawTexturedRect( Kuro:RespX(20), Kuro:RespY(920), Kuro:RespX(450), Kuro:RespY(165) )

		draw.SimpleTextOutlined( "Faim: " .. math.floor(LocalPlayer():getDarkRPVar( "Energy" )) .." / ".. 100 , "Degat1", ScrW()*0.085,ScrH()*0.961 , Color(250, 181, 79, 255),0,0,1,Color( 0, 0, 0, 255 ))
		draw.SimpleTextOutlined( "HP: " .. LocalPlayer():Health() .. " / " .. LocalPlayer():GetMaxHealth(), "Zuk5", ScrW()*0.115, ScrH()*0.913, Color( 248, 121, 121, 255 ),TEXT_ALIGN_LEFT,0,1.2,Color( 0, 0, 0, 255 ))
		draw.SimpleTextOutlined( "AP: " .. LocalPlayer():Armor() .. " / 200", "Degat1", ScrW()*0.098, ScrH()*0.942, Color( 54, 170, 214, 255 ),TEXT_ALIGN_LEFT,0,1,Color( 0, 0, 0, 255 ))
		draw.SimpleTextOutlined( name, "Zuk9", ScrW()*0.215,ScrH()*0.879 , Color(191, 189, 189, 255),TEXT_ALIGN_RIGHT,0,1,Color( 0, 0, 0, 255 ))
		draw.SimpleTextOutlined( money .. " Yen", "Zuk2", Kuro:RespX(360), Kuro:RespY(1015), Color(225, 209, 20, 255),TEXT_ALIGN_LEFT,0,1,Color( 0, 0, 0, 255 ))
	
		if !IsValid(icon) then icon = MakeDmodel() end

		surface.SetDrawColor( 0, 0, 0, 200 )
		surface.DrawRect( Kuro:RespX(1468),Kuro:RespY(1010), Kuro:RespX(404), Kuro:RespY(27))
		
		surface.SetDrawColor( 62, 139, 188, 255)
		surface.DrawRect( Kuro:RespX(1468 + (450 * (1-coef) )),  Kuro:RespY(1009), Kuro:RespX(404 * coef), Kuro:RespY(27))
		
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( HUD16	)
		surface.DrawTexturedRect(  Kuro:RespX(1450), Kuro:RespY(970), Kuro:RespX(450), Kuro:RespY(108) )
		
		if IsValid( LocalPlayer():GetActiveWeapon() ) then
			local weapons = LocalPlayer():GetActiveWeapon():GetPrintName()
			draw.SimpleTextOutlined ( weapons, "Zuk10", ScrW()*0.872,ScrH()*0.963 , Color(238, 217, 158, 255),TEXT_ALIGN_RIGHT,0,1,Color( 0, 0, 0, 255 ))
		end
		
		draw.SimpleTextOutlined( math.floor(chakra) .." / "..math.floor(chakra_max), "Degat", ScrW()*0.81,ScrH()*0.9315 , Color(255, 255, 255, 255),0,0,1,Color( 0, 0, 0, 255 ))
	end
end)

hook.Add( "HUDShouldDraw", "DefautHUD", function( name ) 
    if ( name == "CHudAmmo" or name == "CHudHealth" or name == "CHudBattery" or name == "DarkRP_HUD" or name == "DarkRP_Hungermod" ) then return false end -- pour enlever l'hud de base
end )