--insert tech
if data.raw.lab['lab'] then
    table.insert(data.raw.lab['lab'].inputs, 'fu_space_probe_science_item')
    table.insert(data.raw.lab['lab'].inputs, 'fi_ki_science')
    table.insert(data.raw.lab['lab'].inputs, 'fu_ki_science')
end
--krastorio2
if mods["Krastorio2"] then
    require('scripts/krastorio2/data-final-fixes')
end
--ind2
if mods["IndustrialRevolution"] then
    require('scripts/ind2/data-final-fixes')
end
--SE
if mods["space-exploration"] then
    require('scripts/SE/data-final-fixes')
end
