-- replace jokers

local _interact_blocked_original = IntimitateInteractionExt._interact_blocked
function IntimitateInteractionExt:_interact_blocked(...)
    if self.tweak_data == "hostage_convert" and managers.player:chk_minion_limit_reached() then
        while #GroupAIStateBase.PLAYER_JOKERS > 0 do
            local unit = table.remove(GroupAIStateBase.PLAYER_JOKERS, 1)            
            if alive(unit) then
                unit:character_damage():damage_mission({ damage = unit:character_damage()._HEALTH_INIT + 1 })
                break
            end
        end
    end       
    return _interact_blocked_original(self, ...)
end