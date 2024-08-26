Config = Config or {}

Config.menu = 'qb-menu' -- keep-menu (recommended) / qb-menu

Config.model_loading = {
     timeout = 1500, --ms
     dealy = 50,     --ms
}

Config.MagicTouch = false

Config.categories = {
     ['misc'] = {
          key = 'misc',
          label = 'Misc',
          icon = 'fa-solid fa-tags',
          jobs = {},
     },
     ['robberyitems'] = {
          key = 'robberyitems',
          label = 'Robbery Items',
          icon = 'fa-solid fa-tags',
          jobs = {},
     },
     ['weapons'] = {
          key = 'weapons',
          label = 'Weapons',
          icon = 'fa-solid fa-gun',
          jobs = {},
          sub_categories = {
               ['pistol'] = {
                    label = 'Pistol',
               },
               ['smg'] = {
                    label = 'SMG',
               },
               ['rifle'] = {
                    label = 'Rifle',
               },
          }
     },
     ['medical'] = {
          key = 'medical',
          label = 'Medical',
          icon = 'fa-solid fa-hand-holding-medical',
          jobs = {}
     },
     ['blueprints'] = {
          key = 'blueprints',
          label = 'Blueprints Craft',
          icon = 'fa-solid fa-file',
          jobs = {}
     },
}

Config.permanent_items = {
     ['weapon_wrench'] = true
}

local misc_recipe = {
     ['cryptopaper'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'CryptoPaper [Soon]',
               -- icon = 'fa-solid fa-gun',
               object = {
                    name = 'prop_tool_box_04', -- <-- this model can fail to load
                    rotation = vector3(45.0, 0.0, -45.0)
               },
               image = 'cryptopaper', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 70,
               amount = 1, -- crafted amount
               duration = 45,
               materials = {
                    ["metalscrap"] = 1000,
                    ["steel"] = 1000,
                    ["plastic"] = 1000,
                    ["rubber"] = 1000,
               },
               exp_per_craft = 15
          }
     },
     -- ['radio'] = {
     --      categories = {
     --           main = 'misc',
     --      },
     --      item_settings = {
     --           label = 'Radio - [200XP] - 125 Steel, 125 Plastic',
     --           image = 'radio', -- use inventory's images
     --           object = {
     --                name = 'v_serv_radio',
     --                rotation = vector3(0.0, 0.0, 0.0)
     --           },
     --           level = 0,
     --           job = {
     --                allowed_list = {},
     --                allowed_grades = {}
     --           }
     --      },
     --      crafting = {
     --           success_rate = 100,
     --           amount = 1, -- crafted amount
     --           duration = 60,
     --           materials = {
     --                ["steel"] = 125,
     --                ["plastic"] = 125,
     --           },
     --           exp_per_craft = 15
     --      }
     -- },
     -- ['lockpick'] = {
     --      categories = {
     --           main = 'misc',
     --      },
     --      item_settings = {
     --           label = 'Lockpick - [75XP]',
     --           image = 'lockpick', -- use inventory's images
     --           object = {
     --                name = 'prop_tool_screwdvr01',
     --                rotation = vector3(0.0, 0.0, 0.0)
     --           },
     --           level = 0,
     --           job = {
     --                allowed_list = {},
     --                allowed_grades = {}
     --           },

     --      },
     --      crafting = {
     --           show_level_in_mail = true,
     --           success_rate = 100,
     --           amount = 1, -- crafted amount
     --           duration = 5,
     --           materials = {
     --                ["steel"] = 85,
     --                ["rubber"] = 30,
     --                -- ["weapon_wrench"] = 1,
     --           },
     --           exp_per_craft = 10
     --      }
     -- },
     -- ['advancedlockpick'] = {
     --      categories = {
     --           main = 'misc',
     --      },
     --      item_settings = {
     --           label = 'AdvancedLockpick - [120XP]',
     --           image = 'advancedlockpick', -- use inventory's images
     --           object = {
     --                name = 'prop_tool_screwdvr01',
     --                rotation = vector3(0.0, 0.0, 0.0)
     --           },
     --           level = 0,
     --           job = {
     --                allowed_list = {},
     --                allowed_grades = {}
     --           },

     --      },
     --      crafting = {
     --           show_level_in_mail = true,
     --           success_rate = 100,
     --           amount = 1, -- crafted amount
     --           duration = 5,
     --           materials = {
     --                ["steel"] = 150,
     --                ["rubber"] = 100,
     --                -- ["weapon_wrench"] = 1,
     --           },
     --           exp_per_craft = 15
     --      }
     -- },
}

local medial = {
     ['bandage'] = {
          categories = {
               main = 'medical',
          },
          item_settings = {
               label = 'Bandage - 1 Plastic',
               image = 'bandage', -- use inventory's images
               level = 125,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["plastic"] = 1,
               },
               exp_per_craft = 5
          }
     },
}

local robberyitems = {
     ['cutter'] = {
          categories = {
               main = 'robberyitems',
          },
          item_settings = {
               label = 'Cutter',
               image = 'cutter', -- use inventory's images
               object = {
                    name = 'prop_cs_gascutter_1',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 100,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["plastic"] = 50,
                    ["rubber"] = 70,
                    ["steel"] = 200,
               },
               exp_per_craft = 10
          }
     },
     ['c4_bomb'] = {
          categories = {
               main = 'robberyitems',
          },
          item_settings = {
               label = 'C4 Bomb',
               image = 'c4_bomb', -- use inventory's images
               object = {
                    name = 'prop_c4_final_green',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 200,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["plastic"] = 250,
                    ["rubber"] = 100,
                    ["steel"] = 300,
               },
               exp_per_craft = 20
          }
     },
}

local weapons_recipe = {
     ['pistol_suppressor'] = {
          categories = {
               sub = 'pistol',
          },
          item_settings = {
               label = 'Pistol Suppressor',
               image = 'pistol_suppressor', -- use inventory's images
               object = {
                    name = 'w_at_pi_supp',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 500,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 30,
               },
               exp_per_craft = 5
          }
     },
     ['pistol_extendedclip'] = {
          categories = {
               sub = 'pistol',
          },
          item_settings = {
               label = 'Pistol Extended Clip',
               image = 'pistol_extendedclip', -- use inventory's images
               object = {
                    name = 'w_pi_vintage_pistol_mag2',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 150,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 30,
               },
               exp_per_craft = 5
          }
     },
     ['pistol_flashlight'] = {
          categories = {
               sub = 'pistol',
          },
          item_settings = {
               label = 'Pistol Flashlight',
               image = 'pistol_flashlight', -- use inventory's images
               object = {
                    name = 'w_at_pi_flsh',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 100,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 80,
                    ["steel"] = 70,
                    ["rubber"] = 30,
               },
               exp_per_craft = 30
          }
     },
     ['smg_flashlight'] = {
          categories = {
               sub = 'smg',
          },
          item_settings = {
               label = 'Smg Flashlight',
               image = 'smg_flashlight', -- use inventory's images
               object = {
                    name = 'w_at_pi_flsh',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 100,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 100,
                    ["steel"] = 90,
                    ["rubber"] = 50,
               },
               exp_per_craft = 40
          }
     },
     ['smg_extendedclip'] = {
          categories = {
               sub = 'smg',
          },
          item_settings = {
               label = 'Smg Extendedclip',
               image = 'smg_extendedclip', -- use inventory's images
               object = {
                    name = 'w_pi_vintage_pistol_mag2',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 500,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 130,
                    ["steel"] = 120,
                    ["rubber"] = 70,
               },
               exp_per_craft = 50
          }
     },
     ['smg_suppresor'] = {
          categories = {
               sub = 'smg',
          },
          item_settings = {
               label = 'Smg Suppressor',
               image = 'smg_suppresor', -- use inventory's images
               object = {
                    name = 'w_at_pi_supp',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 500,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 130,
                    ["steel"] = 120,
                    ["rubber"] = 70,
               },
               exp_per_craft = 50
          }
     },
     ['rifle_flashlight'] = {
          categories = {
               sub = 'rifle',
          },
          item_settings = {
               label = 'Rifle Flashlight',
               image = 'rifle_flashlight', -- use inventory's images
               object = {
                    name = 'w_at_pi_flsh',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 110,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 100,
                    ["steel"] = 90,
                    ["rubber"] = 50,
               },
               exp_per_craft = 40
          }
     },
     ['rifle_extendedclip'] = {
          categories = {
               sub = 'rifle',
          },
          item_settings = {
               label = 'Rifle Extendedclip',
               image = 'rifle_extendedclip', -- use inventory's images
               object = {
                    name = 'w_pi_vintage_pistol_mag2',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 500,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 130,
                    ["steel"] = 120,
                    ["rubber"] = 70,
               },
               exp_per_craft = 50
          }
     },
     ['rifle_suppresor'] = {
          categories = {
               sub = 'rifle',
          },
          item_settings = {
               label = 'Rifle Suppressor',
               image = 'rifle_suppresor', -- use inventory's images
               object = {
                    name = 'w_at_pi_supp',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 500,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["aluminum"] = 130,
                    ["steel"] = 120,
                    ["rubber"] = 70,
               },
               exp_per_craft = 50
          }
     },
     -- ['pistol_suppressor'] = {
     --      categories = {
     --           sub = 'smg',
     --      },
     --      item_settings = {
     --           label = 'Pistol suppressor',
     --           image = 'pistol_suppressor', -- use inventory's images
     --           object = {
     --                name = 'w_at_ar_supp_02',
     --                rotation = vector3(45.0, 0.0, 0.0)
     --           },
     --           level = 5,
     --           hide_until_reaches_level = true,
     --           job = {
     --                allowed_list = {},
     --                allowed_grades = {}
     --           }
     --      },
     --      crafting = {
     --           success_rate = 100,
     --           amount = 1, -- crafted amount
     --           duration = 60,
     --           materials = {
     --                ["metalscrap"] = 50,
     --                ["steel"] = 60,
     --                ["rubber"] = 30,
     --           },
     --           exp_per_craft = 5
     --      }
     -- },
}

Config.workbench_default_model = 'gr_prop_gr_bench_04a'

Config.workbenches = {
     -- -- items
     {
          table_model = "gr_prop_gr_bench_04b",
          coords = vector3(1997.202, 3027.0193, 46.05635),
          item_show_case_offset = vector3(0.0, 0.0, 1.3),
          rotation = vector3(0.0, 0.0, 597),
          -- just use either job or gang using both at same time won't work.
          job = {
               allowed_list = {},
               allowed_grades = {}
          },
          -- gang = {
          --      allowed_list = { 'ballas' },
          --      allowed_grades = { ['ballas'] = { 1, 2, 3, 4 } }
          -- },
          categories = { Config.categories.misc },
          recipes = { misc_recipe, medial },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(174.04873, 467.38674, 140.90742),
          item_show_case_offset = vector3(0.0, 0.0, 1.2),
          rotation = vector3(0.0, 0.0, 180),
          job = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.robberyitems },
          recipes = { robberyitems },
          radius = 3.0
     },
     -- {
     --      table_model = 'gr_prop_gr_bench_04b',
     --      coords = vector3(-59.5, 6388.77, 30.49),
     --      rotation = vector3(0.0, 0.0, 225.0),
     --      job = {
     --           allowed_list = {},
     --           allowed_grades = {}
     --      },
     --      categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical },
     --      recipes = { misc_recipe, medial },
     --      radius = 3.0
     -- },
     -- {
     --      table_model = 'gr_prop_gr_bench_02b',
     --      coords = vector3(2407.7949, 4031.8488, 35.43827),
     --      item_show_case_offset = vector3(0.0, 0.0, 1.2),
     --      rotation = vector3(0.0, 0.0,250),
     --      job = {
     --           allowed_list = {},
     --           allowed_grades = {}
     --      },
     --      categories = { Config.categories.weapons },
     --      recipes = { weapons_recipe },
     --      radius = 3.0
     -- },
}

--gr_prop_gr_jailer_keys_01a

-- gr_prop_gr_missle_long
-- gr_prop_gr_missle_short
-- gr_int02_generator_01
-- gr_prop_gr_hammer_01

-- w_sr_heavysnipermk2_mag2
-- w_sb_smgmk2_mag2
-- w_sb_smgmk2_mag1
-- w_pi_pistolmk2_mag1
-- w_mg_combatmgmk2_mag1
-- w_ar_carbineriflemk2_mag1
-- w_ar_assaultriflemk2_mag1
-- w_ex_vehiclemissile_3
-- w_ex_vehiclemissile_1
-- w_ex_vehiclemissile_2
-- w_ex_vehiclemortar

-- w_sg_pumpshotgunmk2_mag1
-- w_sg_pumpshotgunh4_mag1
-- gr_prop_gr_adv_case

-- w_at_pi_flsh_2
-- w_at_afgrip_2
-- w_at_muzzle_1
-- w_at_muzzle_3
-- w_at_muzzle_2
-- w_at_muzzle_5
-- w_at_muzzle_6
-- w_at_muzzle_7
-- w_at_muzzle_8
-- w_at_muzzle_9

-- w_at_pi_comp_1
-- w_at_pi_rail_1
-- w_at_scope_macro_2_mk2
-- w_at_scope_small_mk2
-- w_at_scope_medium_2
-- w_at_scope_nv
-- w_at_sights_1
-- w_at_sights_smg
-- w_at_sr_supp3


-- gr_prop_gr_drill_01a

-- gr_prop_gr_driver_01a
-- gr_prop_gr_pliers_01
-- gr_prop_gr_pliers_02
-- gr_prop_gr_rasp_01
-- gr_prop_gr_rasp_02
-- gr_prop_gr_rasp_03
-- gr_prop_gr_sdriver_01
-- gr_prop_gr_sdriver_02
-- gr_prop_gr_sdriver_03

-- gr_prop_gr_vice_01a
