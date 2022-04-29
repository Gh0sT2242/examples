DRICore = nil

TriggerEvent('DRICore:GetObject', function(obj) DRICore = obj end)

RegisterNetEvent('dri-vineyard:server:getGrapes')
AddEventHandler('dri-vineyard:server:getGrapes', function()
    local Player = DRICore.Functions.GetPlayer(source)

    Player.Functions.AddItem("grape", Config.GrapeAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, DRICore.Shared.Items['grape'], "add")
end)

RegisterServerEvent('dri-vineyard:server:loadIngredients') 
AddEventHandler('dri-vineyard:server:loadIngredients', function()
	local Player = DRICore.Functions.GetPlayer(tonumber(source))
    local grape = Player.Functions.GetItemByName('grape')

	if Player.PlayerData.items ~= nil then 
        if (grape ~= nil) then 
            if grape.amount >= 23 then 

                Player.Functions.RemoveItem("grape", 23, false)
                TriggerClientEvent('inventory:client:ItemBox', source, DRICore.Shared.Items['grape'], "remove")
                
                TriggerClientEvent("dri-vineyard:client:loadIngredients", source)

            else
                TriggerClientEvent('DRICore:Notify', source, "You do not have the correct items", 'error')   
            end
        else
            TriggerClientEvent('DRICore:Notify', source, "You do not have the correct items", 'error')   
        end
	else
		TriggerClientEvent('DRICore:Notify', source, "You Have Nothing...", "error")
	end 
	
end) 

RegisterServerEvent('dri-vineyard:server:grapeJuice') 
AddEventHandler('dri-vineyard:server:grapeJuice', function()
	local Player = DRICore.Functions.GetPlayer(tonumber(source))
    local grape = Player.Functions.GetItemByName('grape')

	if Player.PlayerData.items ~= nil then 
        if (grape ~= nil) then 
            if grape.amount >= 16 then 

                Player.Functions.RemoveItem("grape", 16, false)
                TriggerClientEvent('inventory:client:ItemBox', source, DRICore.Shared.Items['grape'], "remove")
                
                TriggerClientEvent("dri-vineyard:client:grapeJuice", source)

            else
                TriggerClientEvent('DRICore:Notify', source, "You do not have the correct items", 'error')   
            end
        else
            TriggerClientEvent('DRICore:Notify', source, "You do not have the correct items", 'error')   
        end
	else
		TriggerClientEvent('DRICore:Notify', source, "You Have Nothing...", "error")
	end 
	
end) 

RegisterServerEvent('dri-vineyard:server:receiveWine')
AddEventHandler('dri-vineyard:server:receiveWine', function()
	local Player = DRICore.Functions.GetPlayer(tonumber(source))

	Player.Functions.AddItem("wine", Config.WineAmount, false)
	TriggerClientEvent('inventory:client:ItemBox', source, DRICore.Shared.Items['wine'], "add")
end)

RegisterServerEvent('dri-vineyard:server:receiveGrapeJuice')
AddEventHandler('dri-vineyard:server:receiveGrapeJuice', function()
	local Player = DRICore.Functions.GetPlayer(tonumber(source))

	Player.Functions.AddItem("grapejuice", Config.GrapeJuiceAmount, false)
	TriggerClientEvent('inventory:client:ItemBox', source, DRICore.Shared.Items['grapejuice'], "add")
end)


-- Hire/Fire

--[[ DRICore.Commands.Add("hirevineyard", "Hire a player to the Vineyard!", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = DRICore.Functions.GetPlayer(tonumber(args[1]))
    local Myself = DRICore.Functions.GetPlayer(source)
    if Player ~= nil then 
        if (Myself.PlayerData.gang.name == "la_familia") then
            Player.Functions.SetJob("vineyard")
        end
    end
end)

DRICore.Commands.Add("firevineyard", "Fire a player to the Vineyard!", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = DRICore.Functions.GetPlayer(tonumber(args[1]))
    local Myself = DRICore.Functions.GetPlayer(source)
    if Player ~= nil then 
        if (Myself.PlayerData.gang.name == "la_familia") then
            Player.Functions.SetJob("unemployed")
        end
    end
end) ]]