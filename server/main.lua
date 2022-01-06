ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

for k, v in pairs(Config.Jobs) do
    -- Register society
    TriggerEvent('esx_society:registerSociety', '' .. k, '' .. k, 'society_' .. k, 'society_' ..  k, 'society_'.. k, {type = 'public'})
end