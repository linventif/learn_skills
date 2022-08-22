AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
util.AddNetworkString("learn_skill_open")

function ENT:Initialize()
    self:SetModel("models/superalchemisttable.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:Use(activator, caller)
	if not IsValid(caller) or not caller:IsPlayer() then
		return
	end

	net.Start("learn_skill_open")
	net.Send(caller)
end