Config = {}

Config.UseInventory = false; -- true: If your inventory supports secondary inventory. Needs to put the trigger in "trigger_inventario"
                             -- false: You need esx_addoninventory
                             
Config.Jobs = {
  AllowedJobs = { -- Put here your jobs
    'job',
    'job2'
  } 
}

Config.Job = {
  ["job"] = {
    ["inventario"] = vector3(-304.54, 6269.79, 31.53), -- Inventory
    ["trigger_inventario"] = "inventory:yourinventory", -- Put here the trigger to your inventory
    ["bossmenu"] = {["grado"] = 0, ["pos"] = vector3(-293.62, 6266.23, 31.54)} -- Bossmenu
  },
}