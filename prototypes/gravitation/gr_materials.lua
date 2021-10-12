--local functions
local function config(name)
    return settings.startup['gr_materials_'..name].value
end

local function sprite(name)
    return '__248k__/ressources/gravitation/gr_materials/gr_materials_'..name
end

--item
data:extend({
    {
        name = 'gr_materials_fusion_cell_item',
        type = 'item',
        icon = sprite('fusion_cell_item.png'),
        icon_size = 64,
        stack_size = 10,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-c-c',
    },
    {
        name = 'gr_materials_stack_down_item',
        type = 'item',
        icon = sprite('stack_down_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-c-b',
    },
    {
        name = 'gr_materials_stack_up_item',
        type = 'item',
        icon = sprite('stack_up_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-c-a',
    },
    {
        name = 'gr_materials_cooked_crystal_item',
        type = 'item',
        icon = sprite('cooked_crystal_item.png'),
        icon_size = 64,
        stack_size = 10,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-d',
    },
    {
        name = 'gr_materials_refined_crystal_item',
        type = 'item',
        icon = sprite('refined_crystal_item.png'),
        icon_size = 64,
        stack_size = 10,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-e',
    },
    {
        name = 'gr_materials_crushed_exotic_item',
        type = 'item',
        icon = sprite('crushed_exotic_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-f',
    },
    {
        name = 'gr_materials_stabilizer_item',
        type = 'item',
        icon = sprite('stabilizer_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-g',
    },



    {
        name = 'gr_materials_red_item',
        type = 'item',
        icon = sprite('red_item.png'),
        icon_size = 64,
        stack_size = 2,
        subgroup = 'gr_item_subgroup_f',
        order = 'c-a',
    },
    {
        name = 'gr_materials_red_data_item',
        type = 'item',
        icon = sprite('red_data_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'b-a',
    },
    {
        name = 'gr_materials_green_item',
        type = 'item',
        icon = sprite('green_item.png'),
        icon_size = 64,
        stack_size = 2,
        subgroup = 'gr_item_subgroup_f',
        order = 'c-b',
    },
    {
        name = 'gr_materials_green_data_item',
        type = 'item',
        icon = sprite('green_data_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'b-b',
    },
    {
        name = 'gr_materials_blue_item',
        type = 'item',
        icon = sprite('blue_item.png'),
        icon_size = 64,
        stack_size = 2,
        subgroup = 'gr_item_subgroup_f',
        order = 'c-c',
    },
    {
        name = 'gr_materials_blue_data_item',
        type = 'item',
        icon = sprite('blue_data_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'b-c',
    },
    {
        name = 'gr_materials_purple_item',
        type = 'item',
        icon = sprite('purple_item.png'),
        icon_size = 64,
        stack_size = 2,
        subgroup = 'gr_item_subgroup_f',
        order = 'c-d',
    },
    {
        name = 'gr_materials_purple_data_item',
        type = 'item',
        icon = sprite('purple_data_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'b-d',
    },
    {
        name = 'gr_materials_yellow_item',
        type = 'item',
        icon = sprite('yellow_item.png'),
        icon_size = 64,
        stack_size = 2,
        subgroup = 'gr_item_subgroup_f',
        order = 'c-e',
    },
    {
        name = 'gr_materials_yellow_data_item',
        type = 'item',
        icon = sprite('yellow_data_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'b-e',
    },
    {
        name = 'gr_materials_grey_item',
        type = 'item',
        icon = sprite('grey_item.png'),
        icon_size = 64,
        stack_size = 2,
        subgroup = 'gr_item_subgroup_f',
        order = 'c-f',
    },
    {
        name = 'gr_materials_grey_data_item',
        type = 'item',
        icon = sprite('grey_data_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'b-f',
    },
    {
        name = 'gr_materials_white_item',
        type = 'item',
        icon = sprite('white_item.png'),
        icon_size = 64,
        stack_size = 1,
        subgroup = 'gr_item_subgroup_f',
        order = 'c-g',
    },
    {
        name = 'gr_materials_white_data_item',
        type = 'item',
        icon = sprite('white_data_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'b-g',
    },


    {
        name = 'gr_materials_data_item',
        type = 'item',
        icon = sprite('data_item.png'),
        icon_size = 64,
        stack_size = 500,
        subgroup = 'gr_item_subgroup_a',
        order = 'f-a',
    },
    {
        name = 'gr_materials_stacked_data_item',
        type = 'item',
        icon = sprite('data_stacked_item.png'),
        icon_size = 64,
        stack_size = 100,
        subgroup = 'gr_item_subgroup_a',
        order = 'f-b',
    },

    {
        name = 'gr_materials_red_pack_item',
        type = 'tool',
        durability = 1,
        icon = sprite('red_pack_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'f-a',
    },
    {
        name = 'gr_materials_green_pack_item',
        type = 'tool',
        durability = 1,
        icon = sprite('green_pack_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'f-b',
    },
    {
        name = 'gr_materials_blue_pack_item',
        type = 'tool',
        durability = 1,
        icon = sprite('blue_pack_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'f-c',
    },
    {
        name = 'gr_materials_purple_pack_item',
        type = 'tool',
        durability = 1,
        icon = sprite('purple_pack_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'f-d',
    },
    {
        name = 'gr_materials_yellow_pack_item',
        type = 'tool',
        durability = 1,
        icon = sprite('yellow_pack_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'f-e',
    },
    {
        name = 'gr_materials_grey_pack_item',
        type = 'tool',
        durability = 1,
        icon = sprite('grey_pack_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'f-f',
    },
    {
        name = 'gr_materials_white_pack_item',
        type = 'tool',
        durability = 1,
        icon = sprite('white_pack_item.png'),
        icon_size = 64,
        stack_size = 10000,
        subgroup = 'gr_item_subgroup_f',
        order = 'f-g',
    },

    {
        name = 'gr_materials_charge_item',
        type = 'item',
        icon = sprite('charge_item.png'),
        icon_size = 64,
        stack_size = 20,
        subgroup = 'gr_item_subgroup_b',
        placed_as_equipment_result = 'gr_materials_charge_item',
        order = 'c-a',
    },
    {
        name = 'gr_materials_charge_item',
        type = 'active-defense-equipment',
        attack_parameters =
    {
      type = "projectile",
      ammo_category = "electric",
      damage_modifier = 1000,
      cooldown = 100,
      projectile_center = {0, 0},
      projectile_creation_distance = 0.6,
      range = 500,
      sound =
      {
         filename = "__base__/sound/fight/pulse.ogg",
         volume = 0.7
      },
      ammo_type =
      {
        type = "projectile",
        category = "electric",
        energy_consumption = "20MJ",
        action =
        {
          {
            type = "area",
            radius = 250,
            force = "enemy",
            action_delivery =
            {
             {
               type = "instant",
               target_effects =
               {
                {
                  type = "create-sticker",
                  sticker = "stun-sticker"
                },
                {
                  type = "push-back",
                  distance = 4
                }
               }
             },
             {
               type = "beam",
               beam = "electric-beam-no-sound",
               max_length = 500,
               duration = 60,
               source_offset = {0, -0.5},
               add_to_shooter = false
             }
            }
          }
        }
      }
    },
        automatic = false,
        ability_icon =
        {
            filename = "__base__/graphics/icons/discharge-defense-equipment-controller.png",
            flags = { "icon" },
            mipmap_count = 4,
            size = 64,
            priority = "extra-high-no-scale"
        },
        categories = {'armor'},
        sprite = {
            filename = sprite('charge_entity.png'),
            width = 256,
            height = 256,
            priority = 'medium',
        },
        shape = {
            width = 3,
            height = 3,
            type = "full",
        },
        energy_source = {
            type = 'electric',
			usage_priority = 'primary-input',
            buffer_capacity = "40MJ"
        },

    },
    {
        type = "capsule",
        name = "gr_materials_charge_remote",
        icon = "__base__/graphics/icons/discharge-defense-equipment-controller.png",
        icon_size = 64, icon_mipmaps = 4,
        capsule_action =
        {
          type = "equipment-remote",
          equipment = "gr_materials_charge_item"
        },
        subgroup = 'gr_item_subgroup_b',
        order = "c-b",
        stack_size = 1
    },
    {
        name = 'gr_materials_circuit',
        type = 'item',
        icon = sprite('circuit.png'),
        icon_size = 64,
        stack_size = 500,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-b',
    },
    {
        name = 'gr_materials_gold_wire',
        type = 'item',
        icon = sprite('gold_wire.png'),
        icon_size = 64,
        stack_size = 200,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-c',
    },
    {
        name = 'gr_materials_pcb',
        type = 'item',
        icon = sprite('pcb.png'),
        icon_size = 64,
        stack_size = 200,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-a',
    },
    {
        name = 'gr_materials_magnet',
        type = 'item',
        icon = sprite('magnet.png'),
        icon_size = 64,
        stack_size = 200,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-a',
    },
    {
        name = 'gr_materials_plasma_cube',
        type = 'item',
        icon = sprite('plasma_cube.png'),
        icon_size = 64,
        stack_size = 200,
        subgroup = 'gr_item_subgroup_a',
        order = 'a-a',
    },

})