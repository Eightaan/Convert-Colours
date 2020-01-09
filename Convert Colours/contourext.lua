if RequiredScript == "lib/units/contourext" then
	table.insert(ContourExt._types, "joker")
	ContourExt._types["joker"] = {priority = 1, material_swap_required = true} 
end