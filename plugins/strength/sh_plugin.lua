PLUGIN.name = "Strength"
PLUGIN.author = "Chessnut"
PLUGIN.description = "Adds a strength attribute."

if (SERVER) then
	function PLUGIN:GetPlayerPunchDamage(client, damage, context)
		if (client:GetCharacter()) then
			-- Add to the total fist damage.
			context.damage = context.damage + (client:GetCharacter():GetAttribute("str", 0) * ix.config.Get("strengthMultiplier"))
		end
	end

	function PLUGIN:PlayerThrowPunch(client, trace)
		if (client:GetCharacter() and IsValid(trace.Entity)) then
			client:GetCharacter():UpdateAttrib("str", 0.1)
		end
		print("punch thrown at entity")
	end
end

-- Configuration for the plugin
ix.config.Add("strengthMultiplier", 0.3, "The strength multiplier scale", nil, {
	data = {min = 0, max = 1.0, decimals = 1},
	category = "Strength"
})
