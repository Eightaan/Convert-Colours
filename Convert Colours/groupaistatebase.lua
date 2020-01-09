local convert_hostage_to_criminal = GroupAIStateBase.convert_hostage_to_criminal
function GroupAIStateBase:convert_hostage_to_criminal(unit, peer_unit)
	convert_hostage_to_criminal(self, unit, peer_unit)
	if unit then
		local player_unit = peer_unit or managers.player:player_unit()
		local color_id = managers.criminals:character_color_id_by_unit(player_unit)
		unit:contour():add("joker", nil, 1)
		unit:contour():change_color("joker", tweak_data.peer_vector_colors[color_id])
		unit:base().owner_peer_id = player_unit:network():peer():id()
	end
end

local remove_minion = GroupAIStateBase.remove_minion
function GroupAIStateBase:remove_minion(minion_key, player_key)
	local minion_unit = self._converted_police[minion_key]
	if minion_unit then
		minion_unit:contour():remove("joker")
	end
	remove_minion(self, minion_key, player_key)
end
