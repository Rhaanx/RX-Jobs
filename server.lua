ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Register your society here
TriggerEvent('esx_society:registerSociety', 'job', 'Job Label', 'society_job', 'society_job', 'society_job', {type = 'public'})
