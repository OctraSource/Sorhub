ITEM.name = "Adrenaline Shot"
ITEM.model = Model("models/props_c17/TrapPropeller_Lever.mdl")
ITEM.description = "A syringe that is labelled on the side, 'Adrenaline.' A green fluid sloshes inside."
ITEM.category = "Medical"
ITEM.sound = "items/medshot4.wav"

ITEM.functions.Inject = {
	icon =  "icon16/lightning.png",
	OnRun = function(itemTable)
		local ply = itemTable.player
		local char = ply:GetCharacter()

		char:RestoreStamina(40)
		ply:EmitSound(ITEM.sound)
		ply:SetHealth(math.min(client:Health() - 10, client:GetMaxHealth()))
		if ply:Health() <= 0 then
			ply:TakeDamage(100)
		end

		char:AddBoost(574, "stm", 40)
		char:AddBoost(328, "end", 20)
	end
}
