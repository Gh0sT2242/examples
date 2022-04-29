-- Load DRiCore and get permissions --
DRiCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1)
        if DRiCore == nil then
            TriggerEvent("DRiCore:GetObject", function(obj) DRiCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

local group = Config.Group

-- Check if is decorating --

local IsDecorating = false

RegisterNetEvent('dri-anticheat:client:ToggleDecorate')
AddEventHandler('dri-anticheat:client:ToggleDecorate', function(bool)
  IsDecorating = bool
end)

-- Few frequently used locals --

local flags = 0 
local player = PlayerId()
local ped = GetPlayerPed(-1)

local isLoggedIn = false

RegisterNetEvent('DRiCore:Client:OnPlayerLoaded')
AddEventHandler('DRiCore:Client:OnPlayerLoaded', function()
    DRiCore.Functions.TriggerCallback('dri-anticheat:server:GetPermissions', function(UserGroup)
        group = UserGroup
    end)
    isLoggedIn = true
end)

-- Superjump --

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(500)
 
        local ped = GetPlayerPed(-1)
        local pedId = PlayerPedId()

        if group == Config.Group and isLoggedIn then 
            if IsPedJumping(pedId) then
                local firstCoord = GetEntityCoords(ped)
  
                while IsPedJumping(pedId) do
                    Citizen.Wait(0)
                end
        
                local secondCoord = GetEntityCoords(ped)
                local lengthBetweenCoords = GetDistanceBetweenCoords(firstCoord, secondCoord, false)

                if (lengthBetweenCoords > Config.SuperJumpLength) then
                    flags = flags + 1      
                    TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Cheat detected!", "orange", "** @everyone " ..GetPlayerName(player).. "** has been plagged by the anti-cheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Superjump)**")         
                end
            end
        end
    end
end)

-- Speedhack --

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(500)

        local ped = GetPlayerPed(-1)
        local speed = GetEntitySpeed(ped) 
        local inveh = IsPedInAnyVehicle(ped, false)
        local ragdoll = IsPedRagdoll(ped)
        local jumping = IsPedJumping(ped)
        local falling = IsPedFalling(ped)
 
        if group == Config.Group and isLoggedIn then 
            if not inveh then
                if not ragdoll then 
                    if not falling then 
                        if not jumping then 
                            if speed > Config.MaxSpeed then 
                                flags = flags + 1 
                                TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Cheat detected!", "orange", "** @everyone " ..GetPlayerName(player).. "** has been plagged by the anti-cheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Speedhack)**")   
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Invisibility --

Citizen.CreateThread(function()
    while true do      
        Citizen.Wait(10000)

        local ped = GetPlayerPed(-1)

        if group == Config.Group and isLoggedIn then 
            if not IsDecorating then 
                if not IsEntityVisible(ped) then
                    SetEntityVisible(ped, 1, 0)
                    TriggerEvent('DRiCore:Notify', "DRI-ANTICHEAT: You were invisible and made visible again!")
                    TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Made player visible", "green", "** @everyone " ..GetPlayerName(player).. "** was invisible and has been made visible again by DRI-Anticheat")            
                end 
            end
        end
    end
end)

-- Nightvision --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        local ped = GetPlayerPed(-1)

        if group == Config.Group and isLoggedIn then 
            if GetUsingnightvision(true) then 
                if not IsPedInAnyHeli(ped) then
                    flags = flags + 1 
                    TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Cheat detected!", "orange", "** @everyone " ..GetPlayerName(player).. "** has been plagged by the anti-cheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Nightvision)**")
                end
            end
        end
    end
end)

-- Thermalvision --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        local ped = GetPlayerPed(-1)

        if group == Config.Group and isLoggedIn then 
            if GetUsingseethrough(true) then 
                if not IsPedInAnyHeli(ped) then
                    flags = flags + 1
                    TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Cheat detected!", "orange", "** @everyone " ..GetPlayerName(player).. "** has been plagged by the anti-cheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Thermalvision)**") 
                end
            end
        end
    end
end)

-- Spawned car --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped)
        local DriverSeat = GetPedInVehicleSeat(veh, -1)
        local plate = GetVehicleNumberPlateText(veh)

        if isLoggedIn then
            if group == Config.Group then
                if IsPedInAnyVehicle(ped, true) then
                    for _, BlockedPlate in pairs(Config.BlacklistedPlates) do
                        if plate == BlockedPlate then
                            if DriverSeat == ped then 
                                DeleteVehicle(veh)               
                                TriggerServerEvent("dri-anticheat:server:banPlayer", "Cheating")
                                TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Cheat detected!", "red", "** @everyone " ..GetPlayerName(player).. "** has been banned for cheating (Sat as a driver in a spawned vehicle with license plate **"..BlockedPlate.."**")         
                            end   
                        end
                    end
                end
            end
        end
    end
end)

-- Check if ped has weapon in inventory --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        if isLoggedIn then

            local PlayerPed = GetPlayerPed(-1)
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = DRiCore.Shared.Weapons[CurrentWeapon]

            if WeaponInformation["name"] ~= "weapon_unarmed" then
                DRiCore.Functions.TriggerCallback('dri-anticheat:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Weapon removed!", "orange", "** @everyone " ..GetPlayerName(player).. "** had a weapon in itself that he didn't have in his inventory. DRI Anticheat removed the weapon.")  
                    end
                end, WeaponInformation)
            end

        end
    end
end)

-- Max flags reached = ban, log, explosion & break --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local coords = GetEntityCoords(ped, true)
        
        if flags >= Config.FlagsForBan then
            -- TriggerServerEvent("dri-anticheat:server:banPlayer", "Cheating")
            -- AddExplosion(coords, EXPLOSION_GRENADE, 1000.0, true, false, false, true)
            TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Banned player! (Not really, of course, this is a test, duuuhhhh)", "red", "** @everyone " ..GetPlayerName(player).. "** flagged to many times by anti-cheat and has been permantily banned!!")  
            flags = 0 
        end
    end
end)

RegisterNetEvent('dri-anticheat:client:NonRegisteredEventCalled')
AddEventHandler('dri-anticheat:client:NonRegisteredEventCalled', function(reason, CalledEvent)
    local player = PlayerId()
    local ped = GetPlayerPed(-1)

    TriggerServerEvent('dri-anticheat:server:banPlayer', reason)
    TriggerServerEvent("dri-log:server:CreateLog", "anticheat", "Banned player! (Not really, of course, this is a test, duuuhhhh)", "red", "** @everyone " ..GetPlayerName(player).. "** has event **"..CalledEvent.."tried to trigger (LUA injector!)")  
end)