local clbk_death = HuskCopBrain.clbk_death

function HuskCopBrain:clbk_death(my_unit, damage_info)
if self._unit then self._unit:contour():remove("joker") end
   
   clbk_death(self, my_unit, damage_info)
end