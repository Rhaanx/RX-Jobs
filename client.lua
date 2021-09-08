ESX = nil
local PlayerData

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	Citizen.Wait(5000)
end)


Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)
			
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		
        for k, v in pairs(Config.Job) do 	
	  
		
		-- BOSS MENU	
		if GetDistanceBetweenCoords(coords, v.bossmenu.pos, true) < 2.0 then 
			if ESX.PlayerData.job and ESX.PlayerData.job.name == k and (ESX.PlayerData.job.grade_name == 'boss' or  ESX.PlayerData.job.grade_name == 'viceboss' ) then
			 DrawMarker(20, v.bossmenu.pos.x,v.bossmenu.pos.y,v.bossmenu.pos.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.6, 0.6, 0.6, 66, 135, 245, 50, false, true, 2, nil, nil, false)
			 ESX.ShowHelpNotification("Premi ~INPUT_PICKUP~ per aprire la gestione dell\'attività.") 
				if IsControlJustReleased(1, 51) then
					TriggerEvent('esx_society:openBossMenu', k, function(data, menu)
						menu.close()
					end, { wash = false })
				end
			end		
		end
	  
		-- INVENTORY | You need to add related triggers to your inventory
		if GetDistanceBetweenCoords(coords, v.inventario, true) < 2.0 and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == k then	
			if ESX.PlayerData.job.grade >= v.bossmenu.grado then 		
				DrawMarker(20, v.inventario.x,v.inventario.y,v.inventario.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.6, 0.6, 0.6, 66, 135, 245, 50, false, true, 2, nil, nil, false)
				ESX.ShowHelpNotification("Premi ~INPUT_PICKUP~ per aprire l\'inventario.")
				if IsControlJustReleased(1, 51) then
					--[[ EXAMPLE

					if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'JOB1' then
						TriggerEvent('myinventory:openJOB1')
					elseif ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'JOB2' then
						TriggerEvent('myinventory:openJOB2')
					end

					]]
				end
			end
		end
		

		-- F6 MENU
		if IsControlJustReleased(1, 167) then
			if CanDoJob() then
				fattura(ESX.PlayerData.job.name)			
			end
	 	end 
	end			
end
end)

-- DON'T TOUCH!
function CanDoJob()
    for k, v in pairs(Config.Jobs.AllowedJobs) do
        if v == ESX.PlayerData.job.name then
            return true
        end
    end
    return false
end


-- F6 MENU
function fattura(fazione)
	local elements = {
		{label = "Menù fattura", value = 'billing'}
		-- YOU CAN ADD SOME OTHER FUNCTIONS
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fattura',
		{
			title    = 'Billing',
		  	elements = elements
		}, function(data, menu)
		local val = data.current.value
				
		if val == 'billing' then	
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer ~= -1 and closestDistance <= 3.0 then	
				menu.close()
				-- Put here the trigger to your Billing Script
			else
				ESX.ShowNotification('No players nearby')
			end
	 	end
		 
	end, function(data, menu)
		menu.close()
	end)
end
