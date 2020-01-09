local mark_minion = UnitNetworkHandler.mark_minion

function UnitNetworkHandler:mark_minion(unit, minion_owner_peer_id, convert_enemies_health_multiplier_level, passive_convert_enemies_health_multiplier_level, sender, owner)
mark_minion(self, unit, minion_owner_peer_id, convert_enemies_health_multiplier_level, passive_convert_enemies_health_multiplier_level, sender)	
	if unit then
		local color_id = minion_owner_peer_id and managers.network:session():peer(minion_owner_peer_id).unit and managers.criminals:character_color_id_by_unit(managers.network:session():peer(minion_owner_peer_id):unit()) or 1
			unit:contour():add("joker", nil, 1)
			unit:contour():change_color("joker", tweak_data.peer_vector_colors[color_id])		
		unit:base().owner_peer_id = minion_owner_peer_id
	end
end
	
local hostage_trade = UnitNetworkHandler.hostage_trade
function UnitNetworkHandler:hostage_trade(unit, enable, trade_success, skip_hint)
	if unit then
		unit:contour():remove("joker")
	end
	hostage_trade(self, unit, enable, trade_success, skip_hint)
end
