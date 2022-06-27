--fix upgradeables bounding boxes
require('scripts/upgrades')
--legacy icons
require('scripts/legacy_icons')

--insert tech
if data.raw.lab['lab'] then
    table.insert(data.raw.lab['lab'].inputs, 'fi_ki_science')
    table.insert(data.raw.lab['lab'].inputs, 'fu_ki_science')
    if not settings.startup['overhaul_science'].value then
        table.insert(data.raw.lab['lab'].inputs, 'fu_space_probe_science_item')
    end
end
--krastorio2
if mods["Krastorio2"] then
    require('scripts/krastorio2/data-final-fixes')
    require('scripts/krastorio2/overhaul')
end
--ind2
if mods["IndustrialRevolution"] then
    require('scripts/ind2/data-final-fixes')
end
--SE
if mods["space-exploration"] then
    require('scripts/SE/data-final-fixes')
end
--overhaul with realistic reactors
if mods["RealisticReactors"] then
    for i,v in ipairs(data.raw.technology["nuclear-power"].prerequisites) do
        if v == "effectivity-module-2" then data.raw.technology["nuclear-power"].prerequisites[i] = nil end
    end

    if settings.startup['overhaul_realistic_reactors'].value then
        require('scripts/realisticreactors/overhaul')
    end
end
