DRICore = nil

Citizen.CreateThread(function()
	while DRICore == nil do
		TriggerEvent('DRICore:GetObject', function(obj) DRICore = obj end)
		Citizen.Wait(0)
	end
end)


isLoggedIn = false
local PlayerJob = {}

local vineyardblip = nil


RegisterNetEvent('DRICore:Client:OnPlayerLoaded')
AddEventHandler('DRICore:Client:OnPlayerLoaded', function()
    DRICore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerJob.name == "vineyard" then
        vineyardblip = AddBlipForCoord(Config.Vineyard["start"].coords.x, Config.Vineyard["start"].coords.y, Config.Vineyard["start"].coords.z)
        SetBlipSprite(vineyardblip, 492)
        SetBlipDisplay(vineyardblip, 4)
        SetBlipScale(vineyardblip, 0.6)
        SetBlipAsShortRange(vineyardblip, true)
        SetBlipColour(vineyardblip, 75)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Vineyard["start"].label)
        EndTextCommandSetBlipName(vineyardblip)
		
		grapejuiceblip = AddBlipForCoord(Config.Vineyard["grapejuice"].coords.x, Config.Vineyard["grapejuice"].coords.y, Config.Vineyard["grapejuice"].coords.z)
        SetBlipSprite(grapejuiceblip, 238)
        SetBlipDisplay(grapejuiceblip, 4)
        SetBlipScale(grapejuiceblip, 0.6)
        SetBlipAsShortRange(grapejuiceblip, true)
        SetBlipColour(grapejuiceblip, 58)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Vineyard["grapejuice"].label)
        EndTextCommandSetBlipName(grapejuiceblip)
		
		wineblip = AddBlipForCoord(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z)
        SetBlipSprite(wineblip, 238)
        SetBlipDisplay(wineblip, 4)
        SetBlipScale(wineblip, 0.6)
        SetBlipAsShortRange(wineblip, true)
        SetBlipColour(wineblip, 58)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Vineyard["wine"].label)
        EndTextCommandSetBlipName(wineblip)
    end
    end)
end)


RegisterNetEvent('DRICore:Client:OnJobUpdate')
AddEventHandler('DRICore:Client:OnJobUpdate', function(JobInfo)

	if PlayerJob.name == "vineyard" then
        if vineyardblip ~= nil then
            RemoveBlip(vineyardblip)
        end
    end
	
	if JobInfo.name == "vineyard" then
        vineyardblip = AddBlipForCoord(Config.Vineyard["start"].coords.x, Config.Vineyard["start"].coords.y, Config.Vineyard["start"].coords.z)
        SetBlipSprite(vineyardblip, 492)
        SetBlipDisplay(vineyardblip, 4)
        SetBlipScale(vineyardblip, 0.6)
        SetBlipAsShortRange(vineyardblip, true)
        SetBlipColour(vineyardblip, 75)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Vineyard["start"].label)
        EndTextCommandSetBlipName(vineyardblip)
		
		grapejuiceblip = AddBlipForCoord(Config.Vineyard["grapejuice"].coords.x, Config.Vineyard["grapejuice"].coords.y, Config.Vineyard["grapejuice"].coords.z)
        SetBlipSprite(grapejuiceblip, 238)
        SetBlipDisplay(grapejuiceblip, 4)
        SetBlipScale(grapejuiceblip, 0.6)
        SetBlipAsShortRange(grapejuiceblip, true)
        SetBlipColour(grapejuiceblip, 58)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Vineyard["grapejuice"].label)
        EndTextCommandSetBlipName(grapejuiceblip)
		
		wineblip = AddBlipForCoord(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z)
        SetBlipSprite(wineblip, 238)
        SetBlipDisplay(wineblip, 4)
        SetBlipScale(wineblip, 0.6)
        SetBlipAsShortRange(wineblip, true)
        SetBlipColour(wineblip, 58)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Vineyard["wine"].label)
        EndTextCommandSetBlipName(wineblip)
    end
	
	PlayerJob = JobInfo
	grapeJuicemaking()
	wineprcessing()
	
end)

print("I made it fucking here")


local tasking = false
local startVineyard = false
local random = 0
local pickedGrapes = 0
local blip = 0

-- Process
local winetimer = Config.wineTimer
local loadIngredients = false
local wineStarted = false
local finishedWine = false
local winemaking = false
local grapemaking = false

local grapeLocations = {
	[1] = {["x"] = -1875.41,["y"] = 2100.37,["z"] = 138.86},
	[2] = {["x"] = -1908.69,["y"] = 2107.48,["z"] = 131.31},
	[3] = {["x"] = -1866.04,["y"] = 2112.64,["z"] = 134.41},
	[4] = {["x"] = -1907.76,["y"] = 2125.35,["z"] = 124.03},
	[5] = {["x"] = -1850.31,["y"] = 2142.95,["z"] = 122.30},
	[6] = {["x"] = -1888.22,["y"] = 2164.51,["z"] = 114.81},
	[7] = {["x"] = -1835.52,["y"] = 2180.59,["z"] = 104.88},
	[8] = {["x"] = -1891.98,["y"] = 2208.35,["z"] = 94.56},
	[9] = {["x"] = -1720.37,["y"] = 2182.03,["z"] = 106.18},
	[10] = {["x"] = -1808.52,["y"] = 2173.14,["z"] = 107.63},
	[11] = {["x"] = -1784.22,["y"] = 2222.80,["z"] = 92.86},
	[12] = {["x"] = -1889.13,["y"] = 2250.05,["z"] = 79.63},
	[13] = {["x"] = -1861.16,["y"] = 2254.32,["z"] = 81.04},
	[14] = {["x"] = -1886.75,["y"] = 2272.45,["z"] = 70.81},
	[15] = {["x"] = -1845.49,["y"] = 2274.63,["z"] = 73.33},
	[16] = {["x"] = -1687.28,["y"] = 2195.76,["z"] = 97.87},
	[17] = {["x"] = -1741.18,["y"] = 2173.22,["z"] = 114.39},
	[18] = {["x"] = -1743.17,["y"] = 2141.11,["z"] = 121.18},
	[19] = {["x"] = -1813.84,["y"] = 2089.57,["z"] = 134.21},
	[20] = {["x"] = -1698.71,["y"] = 2150.65,["z"] = 110.41},
}

DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
	while true do

			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)

			Vineyard = false
			
			local nearlocation = #(pos - vector3(Config.Vineyard["start"].coords.x, Config.Vineyard["start"].coords.y, Config.Vineyard["start"].coords.z))

				if nearlocation <= 15 then
					Vineyard = true
					if nearlocation <= 3 then
						if not startVineyard then
							DrawText3Ds(-1928.81, 2059.53, 140.84, "[E] Start Picking Grapes") 
							
								if IsControlJustReleased(0,38) then
									if PlayerJob.name == "vineyard" then
										startVineyard = true
									else
										DRICore.Functions.Notify("I dont think I work here...", "error")
									end
								end
						end
					end

				end
				
				
				if PlayerJob.name == "vineyard" then
				local vehDist = GetDistanceBetweenCoords(pos, -1921.845, 2066.439, 140.5638)
				
                    if vehDist < 30 then
                        inRange = true

                        DrawMarker(2, -1921.845, 2066.439, 140.5638, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.3, 0.5, 0.2, 200, 0, 0, 222, false, false, false, true, false, false, false)

                        if vehDist < 1.5 then
                            if whitelistedVehicle() then
                                DrawText3Ds(-1921.845, 2066.439, 140.5638, '[E] Vehicle Parking')
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                        DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                    end
                                end
                            else
                                DrawText3Ds(-1921.845, 2066.439, 140.5638, '[E] Work Garage')
                                if IsControlJustReleased(0, 38) then
								local vehcoords = {x= -1921.845, y= 2066.439, z= 140.5638}
									DRICore.Functions.SpawnVehicle("Kalahari", function(veh)
										--SetEntityHeading(veh, 19.362)
										exports['LegacyFuel']:SetFuel(veh, 100.0)
										TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
										SetEntityAsMissionEntity(veh, true, true)
										TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
										SetVehicleEngineOn(veh, true, true)
									end, vehcoords, true)
                                end
                            end
                        end
                    end
				end
		
			if not Vineyard then
				Citizen.Wait(5000)
			end
			
			Citizen.Wait(5)
				
    end

end)

Citizen.CreateThread(function()
	while true do
		if startVineyard then
			if tasking then
				Citizen.Wait(5000)
			else
				TriggerEvent("dri-vineyard:client:startVineyard")
				pickedGrapes = pickedGrapes + 1
				print(pickedGrapes)
				if pickedGrapes == Config.PickAmount then
					TriggerEvent("dri-vineyard:client:startVineyard")
					Citizen.Wait(2000)
					startVineyard = false
				end

			end
		end
		Citizen.Wait(5)
	end
end)

RegisterNetEvent('dri-vineyard:client:startVineyard')
AddEventHandler('dri-vineyard:client:startVineyard', function()

	if tasking then
		return
	end

	random = math.random(1, #grapeLocations)

	tasking = true
	CreateBlip()
	while tasking do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local nearpicking = #(pos - vector3(grapeLocations[random]["x"], grapeLocations[random]["y"], grapeLocations[random]["z"]))
		if nearpicking <= 150 then
			DrawMarker(32, grapeLocations[random]["x"], grapeLocations[random]["y"], grapeLocations[random]["z"] + 2.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 1.0, 0.4, 255, 223, 0, 255, true, false, false, false, false, false, false)
			if nearpicking <= 1.5 then
				DrawMarker(2, grapeLocations[random]["x"], grapeLocations[random]["y"], grapeLocations[random]["z"] + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
				DrawText3Ds(grapeLocations[random]["x"], grapeLocations[random]["y"], grapeLocations[random]["z"], "Pick Grapes[E]") 
				if not IsPedInAnyVehicle(PlayerPedId()) and IsControlJustReleased(0,38) then
					PickAnim()
					pickProcess()
				end
			end
		end
	end
end)

function pickgrapes()
	local success = true
	
	if success then
		TriggerServerEvent("dri-vineyard:server:getGrapes")
		tasking = false
	end
end

function CreateBlip()
	DeleteBlip()
	if tasking then
		blip = AddBlipForCoord(grapeLocations[random]["x"],grapeLocations[random]["y"],grapeLocations[random]["z"])
	end
    
    SetBlipSprite(blip, 465)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("pick grapes")
    EndTextCommandSetBlipName(blip)
end

function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

function pickProcess()
    DRICore.Functions.Progressbar("pick_grape", "Picking Grapes ..", math.random(6000,8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        pickgrapes()
        ClearPedTasks(PlayerPedId())

    end, function() -- Cancel

        ClearPedTasks(PlayerPedId())
        DRICore.Functions.Notify("Process Canceled", "error")
    end)
end

function PickAnim()
    local ped = PlayerPedId()
    LoadAnim('amb@prop_human_bum_bin@idle_a')
    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@idle_a', 'idle_a', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
end

-- Process Grapes

Citizen.CreateThread(function()
	while true do
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			winemaking = false
			local nearlocation = #(pos - vector3(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z))
				if nearlocation <= 15 then
					winemaking = true
					if nearlocation <= 3 then	
						if not wineStarted then
							if not loadIngredients then
								if #(pos - vector3(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z)) < 3 then
									DrawText3Ds(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y,  Config.Vineyard["wine"].coords.z + 0.2, '[E] Load Ingredients')
									if IsControlJustPressed(0, 38) then
										if PlayerJob.name == "vineyard" then
											TriggerServerEvent("dri-vineyard:server:loadIngredients")
										else
											DRICore.Functions.Notify("I dont think I work here...", "error")
										end
									end
								end
							else
								if not finishedWine then
									if #(pos - vector3(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z)) < 3 then
										DrawText3Ds(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z + 0.2, '[E] Start WineProcess')
										if IsControlJustPressed(0, 38) then
											if PlayerJob.name == "vineyard" then
												StartWineProcess()
											else
												DRICore.Functions.Notify("I dont think I work here...", "error")
											end
										end
									end
								else
									if #(pos - vector3(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z)) < 3 then
										DrawText3Ds(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z + 0.2, '[E] Get Wine')
										if IsControlJustPressed(0, 38) then
											if PlayerJob.name == "vineyard" then
												TriggerServerEvent("dri-vineyard:server:receiveWine")
												finishedWine = false
												loadIngredients = false
												wineStarted = false
											else
												DRICore.Functions.Notify("I dont think I work here...", "error")
											end
										end
									end
								end
							end
						else
							DrawText3Ds(Config.Vineyard["wine"].coords.x, Config.Vineyard["wine"].coords.y, Config.Vineyard["wine"].coords.z - 0.4, 'Ready over '..winetimer..'s')
						end
					end
				end
				
		
			if not winemaking then
				Citizen.Wait(5000)
			end
        
        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		
		grapemaking = false
		local nearlocation = #(pos - vector3(Config.Vineyard["grapejuice"].coords.x, Config.Vineyard["grapejuice"].coords.y, Config.Vineyard["grapejuice"].coords.z))
			if nearlocation <= 15 then
				grapemaking = true
				if nearlocation <= 3 then	
					
					if #(pos - vector3(Config.Vineyard["grapejuice"].coords.x, Config.Vineyard["grapejuice"].coords.y, Config.Vineyard["grapejuice"].coords.z)) < 1 then
						DrawText3Ds(Config.Vineyard["grapejuice"].coords.x, Config.Vineyard["grapejuice"].coords.y,  Config.Vineyard["grapejuice"].coords.z + 0.2, '[E] Make Grape Juice')
						if IsControlJustPressed(0, 38) then
							if PlayerJob.name == "vineyard" then
								TriggerServerEvent("dri-vineyard:server:grapeJuice")
							else
								DRICore.Functions.Notify("I dont think I work here...", "error")
							end
						end
					end
					
				end
			end
			
	
		if not grapemaking then
			Citizen.Wait(5000)
		end
        
        Citizen.Wait(5)
    end
end)

RegisterNetEvent('dri-vineyard:client:grapeJuice')
AddEventHandler('dri-vineyard:client:grapeJuice', function()
	PrepareAnim()
	grapeJuiceProcess()
end)

RegisterNetEvent('dri-vineyard:client:loadIngredients')
AddEventHandler('dri-vineyard:client:loadIngredients', function()
	loadIngredients = true
end)

function StartWineProcess()
    Citizen.CreateThread(function()
        wineStarted = true
        while winetimer > 0 do
            winetimer = winetimer - 1
            Citizen.Wait(1000)
		end
		
		wineStarted = false
		finishedWine = true
		winetimer = Config.wineTimer
    end)
end

function grapeJuiceProcess()
    DRICore.Functions.Progressbar("grape_juice", "Processing Grapes ..", math.random(15000,20000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("dri-vineyard:server:receiveGrapeJuice")
        ClearPedTasks(PlayerPedId())

    end, function() -- Cancel

        ClearPedTasks(PlayerPedId())
        DRICore.Functions.Notify("Process Canceled", "error")
    end)
end

function PrepareAnim()
    local ped = PlayerPedId()
    LoadAnim('amb@code_human_wander_rain@male_a@base')
    TaskPlayAnim(ped, 'amb@code_human_wander_rain@male_a@base', 'static', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function wineprcessing()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local inleverpunt = Config.Vineyard["wine"]

    EndBlip = AddBlipForCoord(inleverpunt.coords.x, inleverpunt.coords.y, inleverpunt.coords.z)
    SetBlipSprite(EndBlip, 1)
    SetBlipDisplay(EndBlip, 274)
    SetBlipScale(EndBlip, .9)
    SetBlipAsShortRange(EndBlip, false)
    SetBlipColour(EndBlip, 58)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Vineyard["wine"].name)
    EndTextCommandSetBlipName(EndBlip)
end

function grapeJuicemaking()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local inleverpunt = Config.Vineyard["grapejuice"]

    EndBlip = AddBlipForCoord(inleverpunt.coords.x, inleverpunt.coords.y, inleverpunt.coords.z)
    SetBlipSprite(EndBlip, 1)
    SetBlipDisplay(EndBlip, 274)
    SetBlipScale(EndBlip, .9)
    SetBlipAsShortRange(EndBlip, false)
    SetBlipColour(EndBlip, 58)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Vineyard["grapejuice"].name)
    EndTextCommandSetBlipName(EndBlip)
end

function whitelistedVehicle()
    local ped = GetPlayerPed(-1)
    local veh = GetEntityModel(GetVehiclePedIsIn(ped))
    local retval = false

		if veh == GetHashKey("Kalahari") then
            retval = true
        end
    return retval
end
