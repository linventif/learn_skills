include("shared.lua")

surface.CreateFont("TheDefaultSettings", {
	font = "ChatFont", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
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

function ENT:Draw()
	self:DrawModel()
    
    local ang = self:GetAngles()
    local pos = self:GetPos()

    pos = pos + Vector( 0, -20, math.cos( CurTime() / 2 ) + 70)

    ang:RotateAroundAxis(self:GetAngles():Right(), 180)
    ang:RotateAroundAxis(self:GetAngles():Forward(), 90)

    cam.Start3D2D(pos, ang, 0.20)
        draw.RoundedBox(15, -150, 0, 300, 60, Learn_Skills.UI_Color.Background)
        draw.SimpleText(Learn_Skills.Text, "TheDefaultSettings", 0, 30, Color(255, 255, 255), 1, 1)

    cam.End3D2D()
end