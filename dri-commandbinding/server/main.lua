local DRICore = exports['dri-core']:GetCoreObject()

DRICore.Commands.Add("binds", "Open command binding menu", {}, false, function(source, args)
    local Player = DRICore.Functions.GetPlayer(source)
	TriggerClientEvent("dri-commandbinding:client:openUI", source)
end)

RegisterServerEvent('dri-commandbinding:server:setKeyMeta')
AddEventHandler('dri-commandbinding:server:setKeyMeta', function(keyMeta)
    local src = source
    local ply = DRICore.Functions.GetPlayer(src)

    ply.Functions.SetMetaData("commandbinds", keyMeta)
end)
