AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_lab/binderblue.mdl")
	--self:SetModel("models/props_promos/book_normal.mdl")
    --self:SetSkin(4)
    self:SetAngles(Angle(-90, 90, -90))
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:PhysicsInit(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:Use(ply, caller)
    naruto_skills(ply, caller)
end