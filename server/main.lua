ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Register your society here
TriggerEvent('esx_society:registerSociety', Config.Jobs.AllowedJobs, 'Job Label', 'society_' .. Config.Jobs.AllowedJobs, 'society_' ..  Config.Jobs.AllowedJobs, 'society_'.. Config.Jobs.AllowedJobs, {type = 'public'})
