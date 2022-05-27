local function sprite(name)
    return '__248k__/ressources/grenade/'..name
end

local el_explosion = table.deepcopy(data.raw['explosion']['grenade-explosion'])
el_explosion.name = 'el_grenade-explosion'
local el_grenade = table.deepcopy(data.raw['projectile']['grenade'])
el_grenade.name = 'el_grenade'

el_grenade.action = {
  {
    type = 'direct',
    action_delivery = {
      type = 'instant',
      target_effects = {
        {
          type = 'create-entity',
          entity_name = 'el_grenade-explosion',
          trigger_created_entity = true
        }
      }
    }
  },
  ---note here
  {
    type = 'cluster',
    cluster_count = 16,
    distance = 7.5,
    distance_deviation = 1,
    action_delivery = {
        {
            type = 'beam',
            add_to_shooter = false,
            duration = 15,
            beam = 'electric-beam-no-sound',
            max_length = 16,
            source_offset = {0, -0.5}
        }
    }
  },
  {
    type = 'area',
    radius = 7.5,
    force = 'not-same',
    action_delivery = {
      {
        type = 'instant',
        target_effects = {
          {
            type = 'damage',
            damage = {
              amount = 40,
              type = 'explosion'
            }
          },
          {
            type = 'create-sticker',
            sticker = 'stun-sticker'
          },
          {
            type = "push-back",
            distance = 4
          }
        }
      }
    }
  }
}
local el_capsule = table.deepcopy(data.raw['capsule']['grenade'])
el_capsule.name = 'el_grenade'
el_capsule.icon_size = 64
el_capsule.icon = sprite("el_grenade.png")

el_capsule.capsule_action.attack_parameters.ammo_type.action[3] = {
    type = "direct",
    action_delivery =
    {
      type = "projectile",
      projectile = "el_grenade",
      starting_speed = 0.3
    }
}

data:extend{el_explosion, el_grenade, el_capsule}

local fi_explosion = table.deepcopy(data.raw['explosion']['grenade-explosion'])
fi_explosion.name = 'fi_grenade-explosion'
local fi_grenade = table.deepcopy(data.raw['projectile']['grenade'])
fi_grenade.name = 'fi_grenade'

fi_grenade.action = {
    {
      type = 'direct',
      action_delivery = {
        type = 'instant',
        target_effects = {
          {
            type = 'create-entity',
            entity_name = 'fi_grenade-explosion',
            trigger_created_entity = true
          }
        }
      }
    },
    ---note here
    {
      type = 'cluster',
      cluster_count = 24,
      distance = 9,
      distance_deviation = 1,
      action_delivery = {
          {
              type = 'beam',
              add_to_shooter = false,
              duration = 15,
              beam = 'electric-beam-no-sound',
              max_length = 16,
              source_offset = {0, -0.5}
          }
      }
    },
    {
      type = 'area',
      radius = 9,
      force = 'not-same',
      action_delivery = {
        {
          type = 'instant',
          target_effects = {
            {
              type = 'damage',
              damage = {
                amount = 200,
                type = 'explosion'
              }
            },
            {
              type = 'create-sticker',
              sticker = 'stun-sticker'
            },
            {
              type = "push-back",
              distance = 4
            }
          }
        }
      }
    }
  }
  local fi_capsule = table.deepcopy(data.raw['capsule']['grenade'])
  fi_capsule.name = 'fi_grenade'
  fi_capsule.icon_size = 64
  fi_capsule.icon = sprite("fi_grenade.png")
  
  fi_capsule.capsule_action.attack_parameters.ammo_type.action[3] = {
      type = "direct",
      action_delivery =
      {
        type = "projectile",
        projectile = "fi_grenade",
        starting_speed = 0.3
      }
  }
  
data:extend{fi_explosion, fi_grenade, fi_capsule}

local fu_explosion = table.deepcopy(data.raw['explosion']['grenade-explosion'])
fu_explosion.name = 'fu_grenade-explosion'
local fu_grenade = table.deepcopy(data.raw['projectile']['grenade'])
fu_grenade.name = 'fu_grenade'

fu_grenade.action = {
    {
      type = 'direct',
      action_delivery = {
        type = 'instant',
        target_effects = {
          {
            type = 'create-entity',
            entity_name = 'fu_grenade-explosion',
            trigger_created_entity = true
          }
        }
      }
    },
    ---note here
    {
      type = 'cluster',
      cluster_count = 32,
      distance = 12,
      distance_deviation = 1,
      action_delivery = {
          {
              type = 'beam',
              add_to_shooter = false,
              duration = 15,
              beam = 'electric-beam-no-sound',
              max_length = 16,
              source_offset = {0, -0.5}
          }
      }
    },
    {
      type = 'area',
      radius = 12,
      force = 'not-same',
      action_delivery = {
        {
          type = 'instant',
          target_effects = {
            {
              type = 'damage',
              damage = {
                amount = 1000,
                type = 'explosion'
              }
            },
            {
              type = 'create-sticker',
              sticker = 'stun-sticker'
            },
            {
              type = "push-back",
              distance = 6
            }
          }
        }
      }
    }
  }
  local fu_capsule = table.deepcopy(data.raw['capsule']['grenade'])
  fu_capsule.name = 'fu_grenade'
  fu_capsule.icon_size = 64
  fu_capsule.icon = sprite("fu_grenade.png")
  
  fu_capsule.capsule_action.attack_parameters.ammo_type.action[3] = {
      type = "direct",
      action_delivery =
      {
        type = "projectile",
        projectile = "fu_grenade",
        starting_speed = 0.3
      }
  }
  
  data:extend{fu_explosion, fu_grenade, fu_capsule}