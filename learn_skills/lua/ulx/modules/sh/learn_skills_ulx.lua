/*

function ulx.food( calling_ply, target_plys, amount )
	for i=1, #target_plys do
		target_plys[ i ]:setSelfDarkRPVar( "Energy", amount )
	end
	ulx.fancyLogAdmin( calling_ply, "#A set the food for #T to #i", target_plys, amount )
end

local food = ulx.command( "Linventif", "ulx food", ulx.food, "!food" )
food:addParam{ type=ULib.cmds.PlayersArg }
food:addParam{ type=ULib.cmds.NumArg, min=0, max=255, hint="food", ULib.cmds.round }
food:defaultAccess( ULib.ACCESS_ADMIN )
food:help( "Sets the food for target(s)." )

*/