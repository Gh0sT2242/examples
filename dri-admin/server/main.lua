local DRICore = exports['dri-core']:GetCoreObject()

local permissions = {
    ["kick"] = "admin",
    ["ban"] = "admin",
    ["noclip"] = "admin",
    ["kickall"] = "admin",
}

RegisterServerEvent('dri-admin:server:togglePlayerNoclip')
AddEventHandler('dri-admin:server:togglePlayerNoclip', function(playerId, reason)
    local src = source
    if DRICore.Functions.HasPermission(src, permissions["noclip"]) then
        TriggerClientEvent("dri-admin:client:toggleNoclip", playerId)
    end
end)

RegisterServerEvent('dri-admin:server:killPlayer')
AddEventHandler('dri-admin:server:killPlayer', function(playerId)
    TriggerClientEvent('hospital:client:KillPlayer', playerId)
end)

RegisterServerEvent('dri-admin:server:kickPlayer')
AddEventHandler('dri-admin:server:kickPlayer', function(playerId, reason)
    local src = source
    if DRICore.Functions.HasPermission(src, permissions["kick"]) then
        Player(playerId, "You have been kicked out of the server:\n"..reason.."\n\n🔸 Check our discord for more information: https://discord.gg/sBB3n6r")
    end
end)

RegisterServerEvent('dri-admin:server:Freeze')
AddEventHandler('dri-admin:server:Freeze', function(playerId, toggle)
    TriggerClientEvent('dri-admin:client:Freeze', playerId, toggle)
end)

RegisterServerEvent('dri-admin:server:serverKick')
AddEventHandler('dri-admin:server:serverKick', function(reason)
    local src = source
    if DRICore.Functions.HasPermission(src, permissions["kickall"]) then
        for k, v in pairs(DRICore.Functions.GetPlayers()) do
            if v ~= src then 
                Player(v, "You have been kicked out of the server:\n"..reason.."\n\n🔸 Check our discord for more information: https://discord.gg/sBB3n6r")
            end
        end
    end
end)

RegisterServerEvent('dri-admin:server:banPlayer')
AddEventHandler('dri-admin:server:banPlayer', function(playerId, time, reason)
    local src = source
    if DRICore.Functions.HasPermission(src, permissions["ban"]) then
        local time = tonumber(time)
        local banTime = tonumber(os.time() + time)
        if banTime > 2147483647 then
            banTime = 2147483647
        end
        local timeTable = os.date("*t", banTime)
        TriggerClientEvent('chatMessage', -1, "BANHAMMER", "error", GetPlayerName(playerId).." has been banned for: "..reason)
        DRICore.Functions.ExecuteSql(false, "INSERT INTO `bans` (`name`, `steam`, `license`, `discord`,`ip`, `reason`, `expire`, `bannedby`) VALUES ('"..GetPlayerName(playerId).."', '"..GetPlayerIdentifiers(playerId)[1].."', '"..GetPlayerIdentifiers(playerId)[2].."', '"..GetPlayerIdentifiers(playerId)[3].."', '"..GetPlayerIdentifiers(playerId)[4].."', '"..reason.."', "..banTime..", '"..GetPlayerName(src).."')")
        Player(playerId, "You have been banned from the server:\n"..reason.."\n\nYour ban expires "..timeTable["day"].. "/" .. timeTable["month"] .. "/" .. timeTable["year"] .. " " .. timeTable["hour"].. ":" .. timeTable["min"] .. "\n🔸 Check our discord for more information: https://discord.gg/sBB3n6r")
    end
end)

RegisterServerEvent('dri-admin:server:revivePlayer')
AddEventHandler('dri-admin:server:revivePlayer', function(target)
	TriggerClientEvent('hospital:client:Revive', target)
end)

DRICore.Commands.Add("announce", "Send a message to everyone", {}, false, function(source, args)
    local msg = table.concat(args, " ")
    for i = 1, 3, 1 do
        TriggerClientEvent('chatMessage', -1, "SYSTEM", "error", msg)
    end
end, "admin")

DRICore.Commands.Add("admin", "Open admin menu", {}, false, function(source, args)
    local group = DRICore.Functions.GetPermission(source)
    local dealers = exports['dri-drugs']:GetDealers()
    TriggerClientEvent('dri-admin:client:openMenu', source, group, dealers)
end, "admin")

DRICore.Commands.Add("report", "Send a report to admins (only when necessary, DO NOT ABUSE IT)", {{name="message", help="Message you want to send"}}, true, function(source, args)
    local msg = table.concat(args, " ")
    local Player = DRICore.Functions.GetPlayer(source)
    TriggerClientEvent('dri-admin:client:SendReport', -1, GetPlayerName(source), source, msg)
    TriggerClientEvent('chatMessage', source, "REPORT VERSTUURD", "normal", msg)
    TriggerEvent("dri-log:server:CreateLog", "report", "Report", "green", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..") **Report:** " ..msg, false)
    TriggerEvent("dri-log:server:sendLog", Player.PlayerData.citizenid, "reportreply", {message=msg})
end)

DRICore.Commands.Add("staffchat", "Send message to all staff", {{name="message", help="Message you want to send"}}, true, function(source, args)
    local msg = table.concat(args, " ")

    TriggerClientEvent('dri-admin:client:SendStaffChat', -1, GetPlayerName(source), msg)
end, "admin")

DRICore.Commands.Add("givenuifocus", "Give nui focus", {{name="id", help="Player id"}, {name="focus", help="Turn focus on / off"}, {name="mouse", help="Turn mouse on / off"}}, true, function(source, args)
    local playerid = tonumber(args[1])
    local focus = args[2]
    local mouse = args[3]

    TriggerClientEvent('dri-admin:client:GiveNuiFocus', playerid, focus, mouse)
end, "admin")

DRICore.Commands.Add("s", "Send message to all staff", {{name="message", help="Message you want to send"}}, true, function(source, args)
    local msg = table.concat(args, " ")

    TriggerClientEvent('dri-admin:client:SendStaffChat', -1, GetPlayerName(source), msg)
end, "admin")

DRICore.Commands.Add("warn", "Give a person a warning", {{name="ID", help="Persoon"}, {name="Reason", help="Enter a reason"}}, true, function(source, args)
    local targetPlayer = DRICore.Functions.GetPlayer(tonumber(args[1]))
    local senderPlayer = DRICore.Functions.GetPlayer(source)
    table.remove(args, 1)
    local msg = table.concat(args, " ")

    local myName = senderPlayer.PlayerData.name

    local warnId = "WARN-"..math.random(1111, 9999)

    if targetPlayer ~= nil then
        TriggerClientEvent('chatMessage', targetPlayer.PlayerData.source, "SYSTEM", "error", "You have been warned by: "..GetPlayerName(source)..", Reason: "..msg)
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You have "..GetPlayerName(targetPlayer.PlayerData.source).." warned for: "..msg)
        DRICore.Functions.ExecuteSql(false, "INSERT INTO `player_warns` (`senderIdentifier`, `targetIdentifier`, `reason`, `warnId`) VALUES ('"..senderPlayer.PlayerData.steam.."', '"..targetPlayer.PlayerData.steam.."', '"..msg.."', '"..warnId.."')")
    else
        TriggerClientEvent('DRICore:Notify', source, 'This person is not in the city of #Dola, hmm I am '..myName..' and I stink loloololo', 'error')
    end 
end, "admin")

DRICore.Commands.Add("checkwarns", "Give a person a warning", {{name="ID", help="Person"}, {name="Warning", help="Number of warning, (1, 2 of 3 etc..)"}}, false, function(source, args)
    if args[2] == nil then
        local targetPlayer = DRICore.Functions.GetPlayer(tonumber(args[1]))
        DRICore.Functions.ExecuteSql(false, "SELECT * FROM `player_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(result)
            TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", targetPlayer.PlayerData.name.." has "..tablelength(result).." warnings!")
        end)
    else
        local targetPlayer = DRICore.Functions.GetPlayer(tonumber(args[1]))

        DRICore.Functions.ExecuteSql(false, "SELECT * FROM `player_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(warnings)
            local selectedWarning = tonumber(args[2])

            if warnings[selectedWarning] ~= nil then
                local sender = DRICore.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)

                TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", targetPlayer.PlayerData.name.." has been warned by "..sender.PlayerData.name..", Reason: "..warnings[selectedWarning].reason)
            end
        end)
    end
end, "admin")

DRICore.Commands.Add("removewarning", "Remove warning from person", {{name="ID", help="Person"}, {name="Warning", help="Number of warning, (1, 2 of 3 etc..)"}}, true, function(source, args)
    local targetPlayer = DRICore.Functions.GetPlayer(tonumber(args[1]))

    DRICore.Functions.ExecuteSql(false, "SELECT * FROM `player_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(warnings)
        local selectedWarning = tonumber(args[2])

        if warnings[selectedWarning] ~= nil then
            local sender = DRICore.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)

            TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", "You have warning ("..selectedWarning..") deleted, Reason: "..warnings[selectedWarning].reason)
            DRICore.Functions.ExecuteSql(false, "DELETE FROM `player_warns` WHERE `warnId` = '"..warnings[selectedWarning].warnId.."'")
        end
    end)
end, "admin")

function tablelength(table)
    local count = 0
    for _ in pairs(table) do 
        count = count + 1 
    end
    return count
end

DRICore.Commands.Add("rreport", "Reply to a report", {}, false, function(source, args)
    local playerId = tonumber(args[1])
    table.remove(args, 1)
    local msg = table.concat(args, " ")
    local OtherPlayer = DRICore.Functions.GetPlayer(playerId)
    local Player = DRICore.Functions.GetPlayer(source)
    if OtherPlayer ~= nil then
        TriggerClientEvent('chatMessage', playerId, "ADMIN - "..GetPlayerName(source), "warning", msg)
        TriggerClientEvent('DRICore:Notify', source, "Response sent")
        TriggerEvent("dri-log:server:sendLog", Player.PlayerData.citizenid, "reportreply", {otherCitizenId=OtherPlayer.PlayerData.citizenid, message=msg})
        for k, v in pairs(DRICore.Functions.GetPlayers()) do
            if DRICore.Functions.HasPermission(v, "admin") then
                if DRICore.Functions.IsOptin(v) then
                    TriggerClientEvent('chatMessage', v, "ReportReply("..source..") - "..GetPlayerName(source), "warning", msg)
                    TriggerEvent("dri-log:server:CreateLog", "report", "Report Reply", "red", "**"..GetPlayerName(source).."** responded to: **"..OtherPlayer.PlayerData.name.. " **(ID: "..OtherPlayer.PlayerData.source..") **Message:** " ..msg, false)
                end
            end
        end
    else
        TriggerClientEvent('DRICore:Notify', source, "Person is not online", "error")
    end
end, "admin")

DRICore.Commands.Add("setmodel", "Change into a model of your choice..", {{name="model", help="Name of the model"}, {name="id", help="Player ID (leave blank for yourself)"}}, false, function(source, args)
    local model = args[1]
    local target = tonumber(args[2])

    if model ~= nil or model ~= "" then
        if target == nil then
            TriggerClientEvent('dri-admin:client:SetModel', source, tostring(model))
        else
            local Trgt = DRICore.Functions.GetPlayer(target)
            if Trgt ~= nil then
                TriggerClientEvent('dri-admin:client:SetModel', target, tostring(model))
            else
                TriggerClientEvent('DRICore:Notify', source, "This person is not in town yet..", "error")
            end
        end
    else
        TriggerClientEvent('DRICore:Notify', source, "You have not provided a Model..", "error")
    end
end, "admin")

DRICore.Commands.Add("setspeed", "Change into a model of your choice..", {}, false, function(source, args)
    local speed = args[1]

    if speed ~= nil then
        TriggerClientEvent('dri-admin:client:SetSpeed', source, tostring(speed))
    else
        TriggerClientEvent('DRICore:Notify', source, "You have not specified Speed.. (`fast` for super run, `normal` for normal)", "error")
    end
end, "admin")


DRICore.Commands.Add("admincar", "Place vehicle in your garage", {}, false, function(source, args)
    local ply = DRICore.Functions.GetPlayer(source)
    TriggerClientEvent('dri-admin:client:SaveCar', source)
end, "admin")

RegisterServerEvent('dri-admin:server:SaveCar')
AddEventHandler('dri-admin:server:SaveCar', function(mods, vehicle, hash, plate)
    local src = source
    local Player = DRICore.Functions.GetPlayer(src)
    DRICore.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] == nil then
            DRICore.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..Player.PlayerData.steam.."', '"..Player.PlayerData.citizenid.."', '"..vehicle.model.."', '"..vehicle.hash.."', '"..json.encode(mods).."', '"..plate.."', 0)")
            TriggerClientEvent('DRICore:Notify', src, 'The vehicle is now in your name!', 'success', 5000)
        else
            TriggerClientEvent('DRICore:Notify', src, 'This vehicle is already in your garage..', 'error', 3000)
        end
    end)
end)

DRICore.Commands.Add("reporttoggle", "Toggle incoming reports off or on", {}, false, function(source, args)
    DRICore.Functions.ToggleOptin(source)
    if DRICore.Functions.IsOptin(source) then
        TriggerClientEvent('DRICore:Notify', source, "You DO get reports", "success")
    else
        TriggerClientEvent('DRICore:Notify', source, "You will NOT receive any reports", "error")
    end
end, "admin")

RegisterCommand("kickall", function(source, args, rawCommand)
    local src = source
    
    if src > 0 then
        local reason = table.concat(args, ' ')
        local Player = DRICore.Functions.GetPlayer(src)

        if DRICore.Functions.HasPermission(src, "god") then
            if args[1] ~= nil then
                for k, v in pairs(DRICore.Functions.GetPlayers()) do
                    local Player = DRICore.Functions.GetPlayer(v)
                    if Player ~= nil then 
                        Player(Player.PlayerData.source, reason)
                    end
                end
            else
                TriggerClientEvent('chatMessage', src, 'SYSTEM', 'error', 'Provide a reason..')
            end
        else
            TriggerClientEvent('chatMessage', src, 'SYSTEM', 'error', 'You cant do that')
        end
    else
        for k, v in pairs(DRICore.Functions.GetPlayers()) do
            local Player = DRICore.Functions.GetPlayer(v)
            if Player ~= nil then 
                Player(Player.PlayerData.source, "Server restart, see discord for more information! (discord.gg/sBB3n6r)")
            end
        end
    end
end, false)

RegisterServerEvent('dri-admin:server:bringTp')
AddEventHandler('dri-admin:server:bringTp', function(targetId, coords)
    TriggerClientEvent('dri-admin:client:bringTp', targetId, coords)
end)

DRICore.Functions.CreateCallback('dri-admin:server:hasPermissions', function(source, cb, group)
    local src = source
    local retval = false

    if DRICore.Functions.HasPermission(src, group) then
        retval = true
    end
    cb(retval)
end)

RegisterServerEvent('dri-admin:server:setPermissions')
AddEventHandler('dri-admin:server:setPermissions', function(targetId, group)
    DRICore.Functions.AddPermission(targetId, group.rank)
    TriggerClientEvent('DRICore:Notify', targetId, 'Your permission group has been set to'..group.label)
end)

RegisterServerEvent('dri-admin:server:OpenSkinMenu')
AddEventHandler('dri-admin:server:OpenSkinMenu', function(targetId)
    TriggerClientEvent("fivem-appearance:client:CreateFirstCharacter", targetId)
end)

RegisterServerEvent('dri-admin:server:SendReport')
AddEventHandler('dri-admin:server:SendReport', function(name, targetSrc, msg)
    local src = source
    local Players = DRICore.Functions.GetPlayers()

    if DRICore.Functions.HasPermission(src, "admin") then
        if DRICore.Functions.IsOptin(src) then
            TriggerClientEvent('chatMessage', src, "REPORT - "..name.." ("..targetSrc..")", "report", msg)
        end
    end
end)

RegisterServerEvent('dri-admin:server:StaffChatMessage')
AddEventHandler('dri-admin:server:StaffChatMessage', function(name, msg)
    local src = source
    local Players = DRICore.Functions.GetPlayers()

    if DRICore.Functions.HasPermission(src, "admin") then
        if DRICore.Functions.IsOptin(src) then
            TriggerClientEvent('chatMessage', src, "STAFFCHAT - "..name, "error", msg)
        end
    end
end)

DRICore.Commands.Add("setammo", "Staff: Set manual ammo for a weapon.", {{name="amount", help="The amount of bullets, e.g.:20"}, {name="weapon", help="Name of weapon, e.g: WEAPON_RAILGUN"}}, false, function(source, args)
    local src = source
    local weapon = args[2]
    local amount = tonumber(args[1])

    if weapon ~= nil then
        TriggerClientEvent('dri-weapons:client:SetWeaponAmmoManual', src, weapon, amount)
    else
        TriggerClientEvent('dri-weapons:client:SetWeaponAmmoManual', src, "current", amount)
    end
end, 'admin')

DRICore.Commands.Add("setstress", "debug hunger", {}, false, function(source, args)
	TriggerClientEvent("dri-admin:client:GainStress", source)
end)

