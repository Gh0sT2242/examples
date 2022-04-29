-- Load DRiCore --

DRiCore = nil

TriggerEvent('DRiCore:GetObject', function(obj) DRiCore = obj end)

-- Get permissions --

DRiCore.Functions.CreateCallback('dri-anticheat:server:GetPermissions', function(source, cb)
    local group = DRiCore.Functions.GetPermission(source)
    cb(group)
end)

-- Execute ban --

RegisterServerEvent('dri-anticheat:server:banPlayer')
AddEventHandler('dri-anticheat:server:banPlayer', function(reason)
    local src = source
    TriggerClientEvent('chatMessage', -1, "DRi Anti-Cheat", "error", GetPlayerName(src).." is verbannen voor: " ..reason )
    DRiCore.Functions.ExecuteSql(false, "INSERT INTO `bans` (`name`, `steam`, `license`, `discord`,`ip`, `reason`, `expire`, `bannedby`) VALUES ('"..GetPlayerName(src).."', '"..GetPlayerIdentifiers(src)[1].."', '"..GetPlayerIdentifiers(src)[2].."', '"..GetPlayerIdentifiers(src)[3].."', '"..GetPlayerIdentifiers(src)[4].."', '"..reason.."', 2145913200, '"..GetPlayerName(src).."')")
    Player(src, "You've been perma banned for flagging our anti-cheat mulitble times. Join our discord for more information  https://discord.gg/sBB3n6r")
end)

-- Fake events --
function NonRegisteredEventCalled(CalledEvent, source)
    TriggerClientEvent("dri-anticheat:client:NonRegisteredEventCalled", source, "Cheating", CalledEvent)
end

RegisterServerEvent('esx_drugs:sellDrug')
AddEventHandler('esx_drugs:sellDrug', function(source)
    NonRegisteredEventCalled('esx_drugs:sellDrug', source)
end)

RegisterServerEvent('esx_drugs:pickedUpCSNWannabis')
AddEventHandler('esx_drugs:pickedUpCSNWannabis', function(source)
    NonRegisteredEventCalled('esx_drugs:pickedUpCSNWannabis', source)
end)

RegisterServerEvent('esx_drugs:processCSNWannabis')
AddEventHandler('esx_drugs:processCSNWannabis', function(source)
    NonRegisteredEventCalled('esx_drugs:processCSNWannabis', source)
end)

RegisterServerEvent('esx_drugs:cancelProcessing')
AddEventHandler('esx_drugs:cancelProcessing', function(source)
    NonRegisteredEventCalled('esx_drugs:cancelProcessing', source)
end)

RegisterServerEvent('esx_drugs:startHarvestSNWCoke')
AddEventHandler('esx_drugs:startHarvestSNWCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:startHarvestSNWCoke', source)
end)

RegisterServerEvent('esx_drugs:stopHarvSNWestCoke')
AddEventHandler('esx_drugs:stopHarvSNWestCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:stopHarvSNWestCoke', source)
end)

RegisterServerEvent('esx_drugs:startTransSNWformCoke')
AddEventHandler('esx_drugs:startTransSNWformCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:startTransSNWformCoke', source)
end)

RegisterServerEvent('esx_drugs:stopTranSNWsformCoke')
AddEventHandler('esx_drugs:stopTranSNWsformCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:stopTranSNWsformCoke', source)
end)

RegisterServerEvent('esx_drugs:startSellCSNWoke')
AddEventHandler('esx_drugs:startSellCSNWoke', function(source)
    NonRegisteredEventCalled('esx_drugs:startSellCSNWoke', source)
end)

RegisterServerEvent('esx_drugs:stopSellSNWCoke')
AddEventHandler('esx_drugs:stopSellSNWCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:stopSellSNWCoke', source)
end)

RegisterServerEvent('esx_drugs:startHarSNWvestMeth')
AddEventHandler('esx_drugs:startHarSNWvestMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:startHarSNWvestMeth', source)
end)

RegisterServerEvent('esx_drugs:stopHarvesSNWtMeth')
AddEventHandler('esx_drugs:stopHarvesSNWtMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:stopHarvesSNWtMeth', source)
end)

RegisterServerEvent('esx_drugs:startTSNWransformMeth')
AddEventHandler('esx_drugs:startTSNWransformMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:startTSNWransformMeth', source)
end)

RegisterServerEvent('esx_drugs:stopTranSNWsformMeth')
AddEventHandler('esx_drugs:stopTranSNWsformMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:stopTranSNWsformMeth', source)
end)

RegisterServerEvent('esx_drugs:startSellMSNWeth')
AddEventHandler('esx_drugs:startSellMSNWeth', function(source)
    NonRegisteredEventCalled('esx_drugs:startSellMSNWeth', source)
end)

RegisterServerEvent('esx_drugs:stopSellMSNWeth')
AddEventHandler('esx_drugs:stopSellMSNWeth', function(source)
    NonRegisteredEventCalled('esx_drugs:stopSellMSNWeth', source)
end)

RegisterServerEvent('esx_drugs:startHarvestWSNWeed')
AddEventHandler('esx_drugs:startHarvestWSNWeed', function(source)
    NonRegisteredEventCalled('esx_drugs:startHarvestWSNWeed', source)
end)

RegisterServerEvent('esx_drugs:stopHarSNWvestWeed')
AddEventHandler('esx_drugs:stopHarSNWvestWeed', function(source)
    NonRegisteredEventCalled('esx_drugs:stopHarSNWvestWeed', source)
end)

RegisterServerEvent('esx_drugs:startTransfoSNWrmWeed')
AddEventHandler('esx_drugs:startTransfoSNWrmWeed', function(source)
    NonRegisteredEventCalled('esx_drugs:startTransfoSNWrmWeed', source)
end)

RegisterServerEvent('esx_drugs:stopTSNWransformWeed')
AddEventHandler('esx_drugs:stopTSNWransformWeed', function(source)
    NonRegisteredEventCalled('esx_drugs:stopTSNWransformWeed', source)
end)

RegisterServerEvent('esx_drugs:startSellWeSNWed')
AddEventHandler('esx_drugs:startSellWeSNWed', function(source)
    NonRegisteredEventCalled('esx_drugs:startSellWeSNWed', source)
end)

RegisterServerEvent('esx_drugs:stopSellWSNWeed')
AddEventHandler('esx_drugs:stopSellWSNWeed', function(source)
    NonRegisteredEventCalled('esx_drugs:stopSellWSNWeed', source)
end)

RegisterServerEvent('esx_drugs:startHSNWarvestOpium')
AddEventHandler('esx_drugs:startHSNWarvestOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:startHSNWarvestOpium', source)
end)

RegisterServerEvent('esx_drugs:stopHarvestSNWOpium')
AddEventHandler('esx_drugs:stopHarvestSNWOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:stopHarvestSNWOpium', source)
end)

RegisterServerEvent('esx_drugs:starSNWtTransformOpium')
AddEventHandler('esx_drugs:starSNWtTransformOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:starSNWtTransformOpium', source)
end)

RegisterServerEvent('esx_drugs:stopTransSNWformOpium')
AddEventHandler('esx_drugs:stopTransSNWformOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:stopTransSNWformOpium', source)
end)

RegisterServerEvent('esx_drugs:startSellSNWOpium')
AddEventHandler('esx_drugs:startSellSNWOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:startSellSNWOpium', source)
end)

RegisterServerEvent('esx_drugs:stopSellOpiuSNWm')
AddEventHandler('esx_drugs:stopSellOpiuSNWm', function(source)
    NonRegisteredEventCalled('esx_drugs:stopSellOpiuSNWm', source)
end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(source)
    NonRegisteredEventCalled('esx_drugs:GetUserInventory', source)
end)

RegisterServerEvent('OG_cuffs:cuffCheckNeSNWarest')
AddEventHandler('OG_cuffs:cuffCheckNeSNWarest', function(source)
    NonRegisteredEventCalled('OG_cuffs:cuffCheckNeSNWarest', source)
end)

RegisterServerEvent('CheckHandcSNWuff')
AddEventHandler('CheckHandcSNWuff', function(source)
    NonRegisteredEventCalled('CheckHandcSNWuff', source)
end)

RegisterServerEvent('cuffSeSNWrver')
AddEventHandler('cuffSeSNWrver', function(source)
    NonRegisteredEventCalled('cuffSeSNWrver', source)
end)

RegisterServerEvent('cuffGSNWranted')
AddEventHandler('cuffGSNWranted', function(source)
    NonRegisteredEventCalled('cuffGSNWranted', source)
end)

RegisterServerEvent('police:cuffGSNWranted')
AddEventHandler('police:cuffGSNWranted', function(source)
    NonRegisteredEventCalled('police:cuffGSNWranted', source)
end)

RegisterServerEvent('esx_handcuffs:cufSNWfing')
AddEventHandler('esx_handcuffs:cufSNWfing', function(source)
    NonRegisteredEventCalled('esx_handcuffs:cufSNWfing', source)
end)

RegisterServerEvent('esx_policejob:haSNWndcuff')
AddEventHandler('esx_policejob:haSNWndcuff', function(source)
    NonRegisteredEventCalled('esx_policejob:haSNWndcuff', source)
end)

RegisterServerEvent('arisonarp:wiezienie')
AddEventHandler('arisonarp:wiezienie', function(source)
    NonRegisteredEventCalled('arisonarp:wiezienie', source)
end)

RegisterServerEvent('esx_jSNWailer:sendToJail')
AddEventHandler('esx_jSNWailer:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jSNWailer:sendToJail', source)
end)

RegisterServerEvent('esx_jaSNWil:sendToJail')
AddEventHandler('esx_jaSNWil:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jaSNWil:sendToJail', source)
end)

RegisterServerEvent('js:jaSNWiluser')
AddEventHandler('js:jaSNWiluser', function(source)
    NonRegisteredEventCalled('js:jaSNWiluser', source)
end)

RegisterServerEvent('esx-qalle-jail:jailPSNWlayer')
AddEventHandler('esx-qalle-jail:jailPSNWlayer', function(source)
    NonRegisteredEventCalled('esx-qalle-jail:jailPSNWlayer', source)
end)

RegisterServerEvent('AdminMSNWenu:giveCash')
AddEventHandler('AdminMSNWenu:giveCash', function(source)
    NonRegisteredEventCalled('AdminMSNWenu:giveCash', source)
end)

RegisterServerEvent('esx:giSNWveInventoryItem')
AddEventHandler('esx:giSNWveInventoryItem', function(source)
    NonRegisteredEventCalled('esx:giSNWveInventoryItem', source)
end)

RegisterServerEvent('esx_biSNWlling:sendBill')
AddEventHandler('esx_biSNWlling:sendBill', function(source)
    NonRegisteredEventCalled('esx_biSNWlling:sendBill', source)
end)

RegisterServerEvent('esx_jailer:unjailTiSNWme')
AddEventHandler('esx_jailer:unjailTiSNWme', function(source)
    NonRegisteredEventCalled('esx_jailer:unjailTiSNWme', source)
end)

RegisterServerEvent('JailUpdate')
AddEventHandler('JailUpdate', function(source)
    NonRegisteredEventCalled('JailUpdate', source)
end)

RegisterServerEvent('vrp_slotmachSNWine:server:2')
AddEventHandler('vrp_slotmachSNWine:server:2', function(source)
    NonRegisteredEventCalled('vrp_slotmachSNWine:server:2', source)
end)

RegisterServerEvent('lscustoms:pSNWayGarage')
AddEventHandler('lscustoms:pSNWayGarage', function(source)
    NonRegisteredEventCalled('lscustoms:pSNWayGarage', source)
end)

RegisterServerEvent('esx_vehicletrunk:givSNWeDirty')
AddEventHandler('esx_vehicletrunk:givSNWeDirty', function(source)
    NonRegisteredEventCalled('esx_vehicletrunk:givSNWeDirty', source)
end)

RegisterServerEvent('f0ba1292-b68d-4d95-8823-6230cdf282b6')
AddEventHandler('f0ba1292-b68d-4d95-8823-6230cdf282b6', function(source)
    NonRegisteredEventCalled('f0ba1292-b68d-4d95-8823-6230cdf282b6', source)
end)

RegisterServerEvent('gambling:speSNWnd')
AddEventHandler('gambling:speSNWnd', function(source)
    NonRegisteredEventCalled('gambling:speSNWnd', source)
end)

RegisterServerEvent('265df2d8-421b-4727-b01d-b92fd6503f5e')
AddEventHandler('265df2d8-421b-4727-b01d-b92fd6503f5e', function(source)
    NonRegisteredEventCalled('265df2d8-421b-4727-b01d-b92fd6503f5e', source)
end)

RegisterServerEvent('AdminMenu:giveDirtyMSNWoney')
AddEventHandler('AdminMenu:giveDirtyMSNWoney', function(source)
    NonRegisteredEventCalled('AdminMenu:giveDirtyMSNWoney', source)
end)

RegisterServerEvent('AdminMeSNWnu:giveBank')
AddEventHandler('AdminMeSNWnu:giveBank', function(source)
    NonRegisteredEventCalled('AdminMeSNWnu:giveBank', source)
end)

RegisterServerEvent('AdminMSNWenu:giveCash')
AddEventHandler('AdminMSNWenu:giveCash', function(source)
    NonRegisteredEventCalled('AdminMSNWenu:giveCash', source)
end)

RegisterServerEvent('esx_sloSNWtmachine:sv:2')
AddEventHandler('esx_sloSNWtmachine:sv:2', function(source)
    NonRegisteredEventCalled('esx_sloSNWtmachine:sv:2', source)
end)

RegisterServerEvent('esx_moneywash:depoSNWsit')
AddEventHandler('esx_moneywash:depoSNWsit', function(source)
    NonRegisteredEventCalled('esx_moneywash:depoSNWsit', source)
end)

RegisterServerEvent('esx_moneywash:witSNWhdraw')
AddEventHandler('esx_moneywash:witSNWhdraw', function(source)
    NonRegisteredEventCalled('esx_moneywash:witSNWhdraw', source)
end)

RegisterServerEvent('mission:completSNWed')
AddEventHandler('mission:completSNWed', function(source)
    NonRegisteredEventCalled('mission:completSNWed', source)
end)

RegisterServerEvent('truckerJob:succeSNWss')
AddEventHandler('truckerJob:succeSNWss', function(source)
    NonRegisteredEventCalled('truckerJob:succeSNWss', source)
end)

RegisterServerEvent('c65a46c5-5485-4404-bacf-06a106900258')
AddEventHandler('c65a46c5-5485-4404-bacf-06a106900258', function(source)
    NonRegisteredEventCalled('c65a46c5-5485-4404-bacf-06a106900258', source)
end)

RegisterServerEvent('paycheck:salSNWary')
AddEventHandler('paycheck:salSNWary', function(source)
    NonRegisteredEventCalled('paycheck:salSNWary', source)
end)

RegisterServerEvent('DiscordBot:plaSNWyerDied')
AddEventHandler('DiscordBot:plaSNWyerDied', function(source)
    NonRegisteredEventCalled('DiscordBot:plaSNWyerDied', source)
end)

RegisterServerEvent('esx:enterpolicecar')
AddEventHandler('esx:enterpolicecar', function(source)
    NonRegisteredEventCalled('esx:enterpolicecar', source)
end)

RegisterServerEvent('NB:recSNWruterplayer')
AddEventHandler('NB:recSNWruterplayer', function(source)
    NonRegisteredEventCalled('NB:recSNWruterplayer', source)
end)

RegisterServerEvent('Esx-MenuPessoal:Boss_recruterplayer')
AddEventHandler('Esx-MenuPessoal:Boss_recruterplayer', function(source)
    NonRegisteredEventCalled('Esx-MenuPessoal:Boss_recruterplayer', source)
end)

RegisterServerEvent('esx:giSNWveInventoryItem')
AddEventHandler('esx:giSNWveInventoryItem', function(source)
    NonRegisteredEventCalled('esx:giSNWveInventoryItem', source)
end)

RegisterServerEvent('mellotrainer:s_adminKill')
AddEventHandler('mellotrainer:s_adminKill', function(source)
    NonRegisteredEventCalled('mellotrainer:s_adminKill', source)
end)

RegisterServerEvent('adminmenu:allowall')
AddEventHandler('adminmenu:allowall', function(source)
    NonRegisteredEventCalled('adminmenu:allowall', source)
end)

RegisterServerEvent('MF_MobileMeth:RewardPlayers')
AddEventHandler('MF_MobileMeth:RewardPlayers', function(source)
    NonRegisteredEventCalled('MF_MobileMeth:RewardPlayers', source)
end)

RegisterServerEvent('esx_blanchisseur:washMoney')
AddEventHandler('esx_blanchisseur:washMoney', function(source)
    NonRegisteredEventCalled('esx_blanchisseur:washMoney', source)
end)

RegisterServerEvent('esx_blackmoney:washMoney')
AddEventHandler('esx_blackmoney:washMoney', function(source)
    NonRegisteredEventCalled('esx_blackmoney:washMoney', source)
end)

RegisterServerEvent('esx_moneywash:witSNWhdraw')
AddEventHandler('esx_moneywash:witSNWhdraw', function(source)
    NonRegisteredEventCalled('esx_moneywash:witSNWhdraw', source)
end)

RegisterServerEvent('laundry:washcash')
AddEventHandler('laundry:washcash', function(source)
    NonRegisteredEventCalled('laundry:washcash', source)
end)

RegisterServerEvent('lscustoms:UpdateVeh')
AddEventHandler('lscustoms:UpdateVeh', function(source)
    NonRegisteredEventCalled('lscustoms:UpdateVeh', source)
end)

RegisterServerEvent('gcPhone:_internalAddMessageSNW')
AddEventHandler('gcPhone:_internalAddMessageSNW', function(source)
    NonRegisteredEventCalled('gcPhone:_internalAddMessageSNW', source)
end)

RegisterServerEvent('gcPhone:tchat_channelSNW')
AddEventHandler('gcPhone:tchat_channelSNW', function(source)
    NonRegisteredEventCalled('gcPhone:tchat_channelSNW', source)
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwnedSNWPlayerId')
AddEventHandler('esx_vehicleshop:setVehicleOwnedSNWPlayerId', function(source)
    NonRegisteredEventCalled('esx_vehicleshop:setVehicleOwnedSNWPlayerId', source)
end)

RegisterServerEvent('tost:zgarnijsiano')
AddEventHandler('tost:zgarnijsiano', function(source)
    NonRegisteredEventCalled('tost:zgarnijsiano', source)
end)

RegisterServerEvent('wojtek_ubereats:napiwek')
AddEventHandler('wojtek_ubereats:napiwek', function(source)
    NonRegisteredEventCalled('wojtek_ubereats:napiwek', source)
end)

RegisterServerEvent('wojtek_ubereats:hajs')
AddEventHandler('wojtek_ubereats:hajs', function(source)
    NonRegisteredEventCalled('wojtek_ubereats:hajs', source)
end)

RegisterServerEvent('xk3ly-barbasz:getfukingmony')
AddEventHandler('xk3ly-barbasz:getfukingmony', function(source)
    NonRegisteredEventCalled('xk3ly-barbasz:getfukingmony', source)
end)

RegisterServerEvent('xk3ly-farmer:paycheck')
AddEventHandler('xk3ly-farmer:paycheck', function(source)
    NonRegisteredEventCalled('xk3ly-farmer:paycheck', source)
end)

RegisterServerEvent('tostzdrapka:wygranko')
AddEventHandler('tostzdrapka:wygranko', function(source)
    NonRegisteredEventCalled('tostzdrapka:wygranko', source)
end)

RegisterServerEvent('esx_blanchisseur:washMoney')
AddEventHandler('esx_blanchisseur:washMoney', function(source)
    NonRegisteredEventCalled('esx_blanchisseur:washMoney', source)
end)

RegisterServerEvent('esx_moneywash:witSNWhdraw')
AddEventHandler('esx_moneywash:witSNWhdraw', function(source)
    NonRegisteredEventCalled('esx_moneywash:witSNWhdraw', source)
end)

RegisterServerEvent('laundry:washcash')
AddEventHandler('laundry:washcash', function(source)
    NonRegisteredEventCalled('laundry:washcash', source)
end)

RegisterServerEvent('esx_blanchisSNWseur:startWhitening')
AddEventHandler('esx_blanchisSNWseur:startWhitening', function(source)
    NonRegisteredEventCalled('esx_blanchisSNWseur:startWhitening', source)
end)

RegisterServerEvent('esx_baSNWnksecurity:pay')
AddEventHandler('esx_baSNWnksecurity:pay', function(source)
    NonRegisteredEventCalled('esx_baSNWnksecurity:pay', source)
end)

RegisterServerEvent('projektsantos:mandathajs')
AddEventHandler('projektsantos:mandathajs', function(source)
    NonRegisteredEventCalled('projektsantos:mandathajs', source)
end)

RegisterServerEvent('program-keycard:hacking')
AddEventHandler('program-keycard:hacking', function(source)
    NonRegisteredEventCalled('program-keycard:hacking', source)
end)

RegisterServerEvent('xk3ly-barbasz:getfukingmony')
AddEventHandler('xk3ly-barbasz:getfukingmony', function(source)
    NonRegisteredEventCalled('xk3ly-barbasz:getfukingmony', source)
end)

RegisterServerEvent('xk3ly-farmer:paycheck')
AddEventHandler('xk3ly-farmer:paycheck', function(source)
    NonRegisteredEventCalled('xk3ly-farmer:paycheck', source)
end)

RegisterServerEvent('6a7af019-2b92-4ec2-9435-8fb9bd031c26')
AddEventHandler('6a7af019-2b92-4ec2-9435-8fb9bd031c26', function(source)
    NonRegisteredEventCalled('6a7af019-2b92-4ec2-9435-8fb9bd031c26', source)
end)

RegisterServerEvent('211ef2f8-f09c-4582-91d8-087ca2130157')
AddEventHandler('211ef2f8-f09c-4582-91d8-087ca2130157', function(source)
    NonRegisteredEventCalled('211ef2f8-f09c-4582-91d8-087ca2130157', source)
end)

RegisterServerEvent('esx_jailler:sendToJail')
AddEventHandler('esx_jailler:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jailler:sendToJail', source)
end)

RegisterServerEvent('esx-qalle-jail:jailPSNWlayer')
AddEventHandler('esx-qalle-jail:jailPSNWlayer', function(source)
    NonRegisteredEventCalled('esx-qalle-jail:jailPSNWlayer', source)
end)

RegisterServerEvent('esx_jaSNWil:sendToJail')
AddEventHandler('esx_jaSNWil:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jaSNWil:sendToJail', source)
end)

RegisterServerEvent('8321hiue89js')
AddEventHandler('8321hiue89js', function(source)
    NonRegisteredEventCalled('8321hiue89js', source)
end)

RegisterServerEvent('esx_jSNWailer:sendToJailCatfrajerze')
AddEventHandler('esx_jSNWailer:sendToJailCatfrajerze', function(source)
    NonRegisteredEventCalled('esx_jSNWailer:sendToJailCatfrajerze', source)
end)

RegisterServerEvent('esx_jaSNWil:sendToJail')
AddEventHandler('esx_jaSNWil:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jaSNWil:sendToJail', source)
end)

RegisterServerEvent('js:jaSNWiluser')
AddEventHandler('js:jaSNWiluser', function(source)
    NonRegisteredEventCalled('js:jaSNWiluser', source)
end)

RegisterServerEvent('wyspa_jail:jailPlayer')
AddEventHandler('wyspa_jail:jailPlayer', function(source)
    NonRegisteredEventCalled('wyspa_jail:jailPlayer', source)
end)

RegisterServerEvent('wyspa_jail:jail')
AddEventHandler('wyspa_jail:jail', function(source)
    NonRegisteredEventCalled('wyspa_jail:jail', source)
end)

RegisterServerEvent('gcPhone:sendMessage')
AddEventHandler('gcPhone:sendMessage', function(source)
    NonRegisteredEventCalled('gcPhone:sendMessage', source)
end)

RegisterServerEvent('esx_status:set')
AddEventHandler('esx_status:set', function(source)
    NonRegisteredEventCalled('esx_status:set', source)
end)

RegisterServerEvent('esx_skin:openRestrictedMenu')
AddEventHandler('esx_skin:openRestrictedMenu', function(source)
    NonRegisteredEventCalled('esx_skin:openRestrictedMenu', source)
end)

RegisterServerEvent('esx_inventoryhud:openPlayerInventory')
AddEventHandler('esx_inventoryhud:openPlayerInventory', function(source)
    NonRegisteredEventCalled('esx_inventoryhud:openPlayerInventory', source)
end)

RegisterServerEvent('advancedFuel:setEssence')
AddEventHandler('advancedFuel:setEssence', function(source)
    NonRegisteredEventCalled('advancedFuel:setEssence', source)
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwnedSNWPlayerId')
AddEventHandler('esx_vehicleshop:setVehicleOwnedSNWPlayerId', function(source)
    NonRegisteredEventCalled('esx_vehicleshop:setVehicleOwnedSNWPlayerId', source)
end)

RegisterServerEvent('esx_jobs:startWork')
AddEventHandler('esx_jobs:startWork', function(source)
    NonRegisteredEventCalled('esx_jobs:startWork', source)
end)

RegisterServerEvent('esx_jobs:stopWork')
AddEventHandler('esx_jobs:stopWork', function(source)
    NonRegisteredEventCalled('esx_jobs:stopWork', source)
end)

RegisterServerEvent('8321hiue89js')
AddEventHandler('8321hiue89js', function(source)
    NonRegisteredEventCalled('8321hiue89js', source)
end)

RegisterServerEvent('adminmenu:allowall')
AddEventHandler('adminmenu:allowall', function(source)
    NonRegisteredEventCalled('adminmenu:allowall', source)
end)

RegisterServerEvent('AdminMeSNWnu:giveBank')
AddEventHandler('AdminMeSNWnu:giveBank', function(source)
    NonRegisteredEventCalled('AdminMeSNWnu:giveBank', source)
end)

RegisterServerEvent('AdminMSNWenu:giveCash')
AddEventHandler('AdminMSNWenu:giveCash', function(source)
    NonRegisteredEventCalled('AdminMSNWenu:giveCash', source)
end)

RegisterServerEvent('AdminMenu:giveDirtyMSNWoney')
AddEventHandler('AdminMenu:giveDirtyMSNWoney', function(source)
    NonRegisteredEventCalled('AdminMenu:giveDirtyMSNWoney', source)
end)

RegisterServerEvent('Tem2LPs5Para5dCyjuHm87y2catFkMpV')
AddEventHandler('Tem2LPs5Para5dCyjuHm87y2catFkMpV', function(source)
    NonRegisteredEventCalled('Tem2LPs5Para5dCyjuHm87y2catFkMpV', source)
end)

RegisterServerEvent('dqd36JWLRC72k8FDttZ5adUKwvwq9n9m')
AddEventHandler('dqd36JWLRC72k8FDttZ5adUKwvwq9n9m', function(source)
    NonRegisteredEventCalled('dqd36JWLRC72k8FDttZ5adUKwvwq9n9m', source)
end)

RegisterServerEvent('antilynx8:anticheat')
AddEventHandler('antilynx8:anticheat', function(source)
    NonRegisteredEventCalled('antilynx8:anticheat', source)
end)

RegisterServerEvent('antilynxr4:detect')
AddEventHandler('antilynxr4:detect', function(source)
    NonRegisteredEventCalled('antilynxr4:detect', source)
end)

RegisterServerEvent('antilynxr6:detection')
AddEventHandler('antilynxr6:detection', function(source)
    NonRegisteredEventCalled('antilynxr6:detection', source)
end)

RegisterServerEvent('ynx8:anticheat')
AddEventHandler('ynx8:anticheat', function(source)
    NonRegisteredEventCalled('ynx8:anticheat', source)
end)

RegisterServerEvent('antilynx8r4a:anticheat')
AddEventHandler('antilynx8r4a:anticheat', function(source)
    NonRegisteredEventCalled('antilynx8r4a:anticheat', source)
end)

RegisterServerEvent('lynx8:anticheat')
AddEventHandler('lynx8:anticheat', function(source)
    NonRegisteredEventCalled('lynx8:anticheat', source)
end)

RegisterServerEvent('AntiLynxR4:kick')
AddEventHandler('AntiLynxR4:kick', function(source)
    NonRegisteredEventCalled('AntiLynxR4:kick', source)
end)

RegisterServerEvent('AntiLynxR4:log')
AddEventHandler('AntiLynxR4:log', function(source)
    NonRegisteredEventCalled('AntiLynxR4:log', source)
end)

RegisterServerEvent('Banca:dSNWeposit')
AddEventHandler('Banca:dSNWeposit', function(source)
    NonRegisteredEventCalled('Banca:dSNWeposit', source)
end)

RegisterServerEvent('Banca:withdraw')
AddEventHandler('Banca:withdraw', function(source)
    NonRegisteredEventCalled('Banca:withdraw', source)
end)

RegisterServerEvent('BsCuff:Cuff696SNW999')
AddEventHandler('BsCuff:Cuff696SNW999', function(source)
    NonRegisteredEventCalled('BsCuff:Cuff696SNW999', source)
end)

RegisterServerEvent('CheckHandcSNWuff')
AddEventHandler('CheckHandcSNWuff', function(source)
    NonRegisteredEventCalled('CheckHandcSNWuff', source)
end)

RegisterServerEvent('cuffSeSNWrver')
AddEventHandler('cuffSeSNWrver', function(source)
    NonRegisteredEventCalled('cuffSeSNWrver', source)
end)

RegisterServerEvent('cuffGSNWranted')
AddEventHandler('cuffGSNWranted', function(source)
    NonRegisteredEventCalled('cuffGSNWranted', source)
end)

RegisterServerEvent('DiscordBot:plaSNWyerDied')
AddEventHandler('DiscordBot:plaSNWyerDied', function(source)
    NonRegisteredEventCalled('DiscordBot:plaSNWyerDied', source)
end)

RegisterServerEvent('DFWM:adminmenuenable')
AddEventHandler('DFWM:adminmenuenable', function(source)
    NonRegisteredEventCalled('DFWM:adminmenuenable', source)
end)

RegisterServerEvent('DFWM:askAwake')
AddEventHandler('DFWM:askAwake', function(source)
    NonRegisteredEventCalled('DFWM:askAwake', source)
end)

RegisterServerEvent('DFWM:checkup')
AddEventHandler('DFWM:checkup', function(source)
    NonRegisteredEventCalled('DFWM:checkup', source)
end)

RegisterServerEvent('DFWM:cleanareaentity')
AddEventHandler('DFWM:cleanareaentity', function(source)
    NonRegisteredEventCalled('DFWM:cleanareaentity', source)
end)

RegisterServerEvent('DFWM:cleanareapeds')
AddEventHandler('DFWM:cleanareapeds', function(source)
    NonRegisteredEventCalled('DFWM:cleanareapeds', source)
end)

RegisterServerEvent('DFWM:cleanareaveh')
AddEventHandler('DFWM:cleanareaveh', function(source)
    NonRegisteredEventCalled('DFWM:cleanareaveh', source)
end)

RegisterServerEvent('DFWM:enable')
AddEventHandler('DFWM:enable', function(source)
    NonRegisteredEventCalled('DFWM:enable', source)
end)

RegisterServerEvent('DFWM:invalid')
AddEventHandler('DFWM:invalid', function(source)
    NonRegisteredEventCalled('DFWM:invalid', source)
end)

RegisterServerEvent('DFWM:log')
AddEventHandler('DFWM:log', function(source)
    NonRegisteredEventCalled('DFWM:log', source)
end)

RegisterServerEvent('DFWM:openmenu')
AddEventHandler('DFWM:openmenu', function(source)
    NonRegisteredEventCalled('DFWM:openmenu', source)
end)

RegisterServerEvent('DFWM:spectate')
AddEventHandler('DFWM:spectate', function(source)
    NonRegisteredEventCalled('DFWM:spectate', source)
end)

RegisterServerEvent('DFWM:ViolationDetected')
AddEventHandler('DFWM:ViolationDetected', function(source)
    NonRegisteredEventCalled('DFWM:ViolationDetected', source)
end)

RegisterServerEvent('dmv:succeSNWss')
AddEventHandler('dmv:succeSNWss', function(source)
    NonRegisteredEventCalled('dmv:succeSNWss', source)
end)

RegisterServerEvent('eden_garage:payhealth')
AddEventHandler('eden_garage:payhealth', function(source)
    NonRegisteredEventCalled('eden_garage:payhealth', source)
end)

RegisterServerEvent('ems:revive')
AddEventHandler('ems:revive', function(source)
    NonRegisteredEventCalled('ems:revive', source)
end)

RegisterServerEvent('esx_ambulancejob:reSNWvive')
AddEventHandler('esx_ambulancejob:reSNWvive', function(source)
    NonRegisteredEventCalled('esx_ambulancejob:reSNWvive', source)
end)

RegisterServerEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(source)
    NonRegisteredEventCalled('esx_ambulancejob:setDeathStatus', source)
end)

RegisterServerEvent('esx_biSNWlling:sendBill')
AddEventHandler('esx_biSNWlling:sendBill', function(source)
    NonRegisteredEventCalled('esx_biSNWlling:sendBill', source)
end)

RegisterServerEvent('esx_baSNWnksecurity:pay')
AddEventHandler('esx_baSNWnksecurity:pay', function(source)
    NonRegisteredEventCalled('esx_baSNWnksecurity:pay', source)
end)

RegisterServerEvent('esx_blanchisSNWseur:startWhitening')
AddEventHandler('esx_blanchisSNWseur:startWhitening', function(source)
    NonRegisteredEventCalled('esx_blanchisSNWseur:startWhitening', source)
end)

RegisterServerEvent('esx_carthief:alertcoSNWps')
AddEventHandler('esx_carthief:alertcoSNWps', function(source)
    NonRegisteredEventCalled('esx_carthief:alertcoSNWps', source)
end)

RegisterServerEvent('esx_carthSNWief:pay')
AddEventHandler('esx_carthSNWief:pay', function(source)
    NonRegisteredEventCalled('esx_carthSNWief:pay', source)
end)

RegisterServerEvent('esx_dmvschool:addLiceSNWnse')
AddEventHandler('esx_dmvschool:addLiceSNWnse', function(source)
    NonRegisteredEventCalled('esx_dmvschool:addLiceSNWnse', source)
end)

RegisterServerEvent('esx_dmvschool:pSNWay')
AddEventHandler('esx_dmvschool:pSNWay', function(source)
    NonRegisteredEventCalled('esx_dmvschool:pSNWay', source)
end)

RegisterServerEvent('esx:enterpolicecar')
AddEventHandler('esx:enterpolicecar', function(source)
    NonRegisteredEventCalled('esx:enterpolicecar', source)
end)

RegisterServerEvent('esx_fueldSNWelivery:pay')
AddEventHandler('esx_fueldSNWelivery:pay', function(source)
    NonRegisteredEventCalled('esx_fueldSNWelivery:pay', source)
end)

RegisterServerEvent('esx:giSNWveInventoryItem')
AddEventHandler('esx:giSNWveInventoryItem', function(source)
    NonRegisteredEventCalled('esx:giSNWveInventoryItem', source)
end)

RegisterServerEvent('esx_garbageSNWjob:pay')
AddEventHandler('esx_garbageSNWjob:pay', function(source)
    NonRegisteredEventCalled('esx_garbageSNWjob:pay', source)
end)

RegisterServerEvent('esx_godiSNWrtyjob:pay')
AddEventHandler('esx_godiSNWrtyjob:pay', function(source)
    NonRegisteredEventCalled('esx_godiSNWrtyjob:pay', source)
end)

RegisterServerEvent('esx_goSNWpostaljob:pay')
AddEventHandler('esx_goSNWpostaljob:pay', function(source)
    NonRegisteredEventCalled('esx_goSNWpostaljob:pay', source)
end)

RegisterServerEvent('esx_handcuffs:cufSNWfing')
AddEventHandler('esx_handcuffs:cufSNWfing', function(source)
    NonRegisteredEventCalled('esx_handcuffs:cufSNWfing', source)
end)

RegisterServerEvent('esx_jaSNWil:sendToJail')
AddEventHandler('esx_jaSNWil:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jaSNWil:sendToJail', source)
end)

RegisterServerEvent('esx_jail:unjailQuest')
AddEventHandler('esx_jail:unjailQuest', function(source)
    NonRegisteredEventCalled('esx_jail:unjailQuest', source)
end)

RegisterServerEvent('esx_jSNWailer:sendToJail')
AddEventHandler('esx_jSNWailer:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jSNWailer:sendToJail', source)
end)

RegisterServerEvent('esx_jailer:unjailTiSNWme')
AddEventHandler('esx_jailer:unjailTiSNWme', function(source)
    NonRegisteredEventCalled('esx_jailer:unjailTiSNWme', source)
end)

RegisterServerEvent('esx_jobs:caSNWution')
AddEventHandler('esx_jobs:caSNWution', function(source)
    NonRegisteredEventCalled('esx_jobs:caSNWution', source)
end)

RegisterServerEvent('esx_mecanojob:onNPCJobCSNWompleted')
AddEventHandler('esx_mecanojob:onNPCJobCSNWompleted', function(source)
    NonRegisteredEventCalled('esx_mecanojob:onNPCJobCSNWompleted', source)
end)

RegisterServerEvent('esx_mechanicjob:startHarvest')
AddEventHandler('esx_mechanicjob:startHarvest', function(source)
    NonRegisteredEventCalled('esx_mechanicjob:startHarvest', source)
end)

RegisterServerEvent('esx_mechanicjob:starSNWtCraft')
AddEventHandler('esx_mechanicjob:starSNWtCraft', function(source)
    NonRegisteredEventCalled('esx_mechanicjob:starSNWtCraft', source)
end)

RegisterServerEvent('esx_pizza:pSNWay')
AddEventHandler('esx_pizza:pSNWay', function(source)
    NonRegisteredEventCalled('esx_pizza:pSNWay', source)
end)

RegisterServerEvent('esx_policejob:haSNWndcuff')
AddEventHandler('esx_policejob:haSNWndcuff', function(source)
    NonRegisteredEventCalled('esx_policejob:haSNWndcuff', source)
end)

RegisterServerEvent('esx-qalle-jail:jailPSNWlayer')
AddEventHandler('esx-qalle-jail:jailPSNWlayer', function(source)
    NonRegisteredEventCalled('esx-qalle-jail:jailPSNWlayer', source)
end)

RegisterServerEvent('esx-qalle-jail:jailPSNWlayerNew')
AddEventHandler('esx-qalle-jail:jailPSNWlayerNew', function(source)
    NonRegisteredEventCalled('esx-qalle-jail:jailPSNWlayerNew', source)
end)

RegisterServerEvent('esx-qalle-hunting:SNWreward')
AddEventHandler('esx-qalle-hunting:SNWreward', function(source)
    NonRegisteredEventCalled('esx-qalle-hunting:SNWreward', source)
end)

RegisterServerEvent('esx-qalle-hunting:seSNWll')
AddEventHandler('esx-qalle-hunting:seSNWll', function(source)
    NonRegisteredEventCalled('esx-qalle-hunting:seSNWll', source)
end)

RegisterServerEvent('esx_ranger:pSNWay')
AddEventHandler('esx_ranger:pSNWay', function(source)
    NonRegisteredEventCalled('esx_ranger:pSNWay', source)
end)

RegisterServerEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(source)
    NonRegisteredEventCalled('esx:removeInventoryItem', source)
end)

RegisterServerEvent('esx_truckSNWerjob:pay')
AddEventHandler('esx_truckSNWerjob:pay', function(source)
    NonRegisteredEventCalled('esx_truckSNWerjob:pay', source)
end)

RegisterServerEvent('esx_skin:responseSaSNWveSkin')
AddEventHandler('esx_skin:responseSaSNWveSkin', function(source)
    NonRegisteredEventCalled('esx_skin:responseSaSNWveSkin', source)
end)

RegisterServerEvent('esx_sloSNWtmachine:sv:2')
AddEventHandler('esx_sloSNWtmachine:sv:2', function(source)
    NonRegisteredEventCalled('esx_sloSNWtmachine:sv:2', source)
end)

RegisterServerEvent('esx_society:getOnlSNWinePlayers')
AddEventHandler('esx_society:getOnlSNWinePlayers', function(source)
    NonRegisteredEventCalled('esx_society:getOnlSNWinePlayers', source)
end)

RegisterServerEvent('esx_society:setJob')
AddEventHandler('esx_society:setJob', function(source)
    NonRegisteredEventCalled('esx_society:setJob', source)
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwnedSNW')
AddEventHandler('esx_vehicleshop:setVehicleOwnedSNW', function(source)
    NonRegisteredEventCalled('esx_vehicleshop:setVehicleOwnedSNW', source)
end)

RegisterServerEvent('hentailover:xdlol')
AddEventHandler('hentailover:xdlol', function(source)
    NonRegisteredEventCalled('hentailover:xdlol', source)
end)

RegisterServerEvent('JailUpdate')
AddEventHandler('JailUpdate', function(source)
    NonRegisteredEventCalled('JailUpdate', source)
end)

RegisterServerEvent('js:jaSNWiluser')
AddEventHandler('js:jaSNWiluser', function(source)
    NonRegisteredEventCalled('js:jaSNWiluser', source)
end)

RegisterServerEvent('js:removejailtime')
AddEventHandler('js:removejailtime', function(source)
    NonRegisteredEventCalled('js:removejailtime', source)
end)

RegisterServerEvent('LegacyFuel:PayFuSNWel')
AddEventHandler('LegacyFuel:PayFuSNWel', function(source)
    NonRegisteredEventCalled('LegacyFuel:PayFuSNWel', source)
end)

RegisterServerEvent('ljail:jailplayer')
AddEventHandler('ljail:jailplayer', function(source)
    NonRegisteredEventCalled('ljail:jailplayer', source)
end)

RegisterServerEvent('mellotrainer:adminTeSNWmpBan')
AddEventHandler('mellotrainer:adminTeSNWmpBan', function(source)
    NonRegisteredEventCalled('mellotrainer:adminTeSNWmpBan', source)
end)

RegisterServerEvent('mellotrainer:adminKickSNW')
AddEventHandler('mellotrainer:adminKickSNW', function(source)
    NonRegisteredEventCalled('mellotrainer:adminKickSNW', source)
end)

RegisterServerEvent('mellotrainer:s_adminKill')
AddEventHandler('mellotrainer:s_adminKill', function(source)
    NonRegisteredEventCalled('mellotrainer:s_adminKill', source)
end)

RegisterServerEvent('NB:destituerplayer')
AddEventHandler('NB:destituerplayer', function(source)
    NonRegisteredEventCalled('NB:destituerplayer', source)
end)

RegisterServerEvent('NB:recSNWruterplayer')
AddEventHandler('NB:recSNWruterplayer', function(source)
    NonRegisteredEventCalled('NB:recSNWruterplayer', source)
end)

RegisterServerEvent('OG_cuffs:cuffCheckNeSNWarest')
AddEventHandler('OG_cuffs:cuffCheckNeSNWarest', function(source)
    NonRegisteredEventCalled('OG_cuffs:cuffCheckNeSNWarest', source)
end)

RegisterServerEvent('paramedic:revive')
AddEventHandler('paramedic:revive', function(source)
    NonRegisteredEventCalled('paramedic:revive', source)
end)

RegisterServerEvent('police:cuffGSNWranted')
AddEventHandler('police:cuffGSNWranted', function(source)
    NonRegisteredEventCalled('police:cuffGSNWranted', source)
end)

RegisterServerEvent('unCuffServer')
AddEventHandler('unCuffServer', function(source)
    NonRegisteredEventCalled('unCuffServer', source)
end)

RegisterServerEvent('uncuffGSNWranted')
AddEventHandler('uncuffGSNWranted', function(source)
    NonRegisteredEventCalled('uncuffGSNWranted', source)
end)

RegisterServerEvent('vrp_slotmachSNWine:server:2')
AddEventHandler('vrp_slotmachSNWine:server:2', function(source)
    NonRegisteredEventCalled('vrp_slotmachSNWine:server:2', source)
end)

RegisterServerEvent('whoapd:revive')
AddEventHandler('whoapd:revive', function(source)
    NonRegisteredEventCalled('whoapd:revive', source)
end)

RegisterServerEvent('gcPhone:_internalAddMessageSNWDFWM')
AddEventHandler('gcPhone:_internalAddMessageSNWDFWM', function(source)
    NonRegisteredEventCalled('gcPhone:_internalAddMessageSNWDFWM', source)
end)

RegisterServerEvent('gcPhone:tchat_channelSNWDFWM')
AddEventHandler('gcPhone:tchat_channelSNWDFWM', function(source)
    NonRegisteredEventCalled('gcPhone:tchat_channelSNWDFWM', source)
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwnedSNWDFWM')
AddEventHandler('esx_vehicleshop:setVehicleOwnedSNWDFWM', function(source)
    NonRegisteredEventCalled('esx_vehicleshop:setVehicleOwnedSNWDFWM', source)
end)

RegisterServerEvent('esx_mafiajob:confiscateDFWMPlayerItem')
AddEventHandler('esx_mafiajob:confiscateDFWMPlayerItem', function(source)
    NonRegisteredEventCalled('esx_mafiajob:confiscateDFWMPlayerItem', source)
end)

RegisterServerEvent('lscustoms:pDFWMayGarage')
AddEventHandler('lscustoms:pDFWMayGarage', function(source)
    NonRegisteredEventCalled('lscustoms:pDFWMayGarage', source)
end)

RegisterServerEvent('vrp_slotmachDFWMine:server:2')
AddEventHandler('vrp_slotmachDFWMine:server:2', function(source)
    NonRegisteredEventCalled('vrp_slotmachDFWMine:server:2', source)
end)

RegisterServerEvent('Banca:dDFWMeposit')
AddEventHandler('Banca:dDFWMeposit', function(source)
    NonRegisteredEventCalled('Banca:dDFWMeposit', source)
end)

RegisterServerEvent('bank:depDFWMosit')
AddEventHandler('bank:depDFWMosit', function(source)
    NonRegisteredEventCalled('bank:depDFWMosit', source)
end)

RegisterServerEvent('esx_jobs:caDFWMution')
AddEventHandler('esx_jobs:caDFWMution', function(source)
    NonRegisteredEventCalled('esx_jobs:caDFWMution', source)
end)

RegisterServerEvent('give_back')
AddEventHandler('give_back', function(source)
   NonRegisteredEventCalled('give_back', source)
end)

RegisterServerEvent('esx_fueldDFWMelivery:pay')
AddEventHandler('esx_fueldDFWMelivery:pay', function(source)
    NonRegisteredEventCalled('esx_fueldDFWMelivery:pay', source)
end)

RegisterServerEvent('esx_carthDFWMief:pay')
AddEventHandler('esx_carthDFWMief:pay', function(source)
    NonRegisteredEventCalled('esx_carthDFWMief:pay', source)
end)

RegisterServerEvent('esx_godiDFWMrtyjob:pay')
AddEventHandler('esx_godiDFWMrtyjob:pay', function(source)
    NonRegisteredEventCalled('esx_godiDFWMrtyjob:pay', source)
end)

RegisterServerEvent('esx_pizza:pDFWMay')
AddEventHandler('esx_pizza:pDFWMay', function(source)
    NonRegisteredEventCalled('esx_pizza:pDFWMay', source)
end)

RegisterServerEvent('esx_ranger:pDFWMay')
AddEventHandler('esx_ranger:pDFWMay', function(source)
    NonRegisteredEventCalled('esx_ranger:pDFWMay', source)
end)

RegisterServerEvent('esx_garbageDFWMjob:pay')
AddEventHandler('esx_garbageDFWMjob:pay', function(source)
    NonRegisteredEventCalled('esx_garbageDFWMjob:pay', source)
end)

RegisterServerEvent('esx_truckDFWMerjob:pay')
AddEventHandler('esx_truckDFWMerjob:pay', function(source)
    NonRegisteredEventCalled('esx_truckDFWMerjob:pay', source)
end)

RegisterServerEvent('AdminMeDFWMnu:giveBank')
AddEventHandler('AdminMeDFWMnu:giveBank', function(source)
    NonRegisteredEventCalled('AdminMeDFWMnu:giveBank', source)
end)

RegisterServerEvent('AdminMDFWMenu:giveCash')
AddEventHandler('AdminMDFWMenu:giveCash', function(source)
    NonRegisteredEventCalled('AdminMDFWMenu:giveCash', source)
end)

RegisterServerEvent('esx_goDFWMpostaljob:pay')
AddEventHandler('esx_goDFWMpostaljob:pay', function(source)
    NonRegisteredEventCalled('esx_goDFWMpostaljob:pay', source)
end)

RegisterServerEvent('esx_baDFWMnksecurity:pay')
AddEventHandler('esx_baDFWMnksecurity:pay', function(source)
    NonRegisteredEventCalled('esx_baDFWMnksecurity:pay', source)
end)

RegisterServerEvent('esx_sloDFWMtmachine:sv:2')
AddEventHandler('esx_sloDFWMtmachine:sv:2', function(source)
    NonRegisteredEventCalled('esx_sloDFWMtmachine:sv:2', source)
end)

RegisterServerEvent('esx:giDFWMveInventoryItem')
AddEventHandler('esx:giDFWMveInventoryItem', function(source)
    NonRegisteredEventCalled('esx:giDFWMveInventoryItem', source)
end)

RegisterServerEvent('NB:recDFWMruterplayer')
AddEventHandler('NB:recDFWMruterplayer', function(source)
    NonRegisteredEventCalled('NB:recDFWMruterplayer', source)
end)

RegisterServerEvent('esx_biDFWMlling:sendBill')
AddEventHandler('esx_biDFWMlling:sendBill', function(source)
    NonRegisteredEventCalled('esx_biDFWMlling:sendBill', source)
end)

RegisterServerEvent('esx_jDFWMailer:sendToJail')
AddEventHandler('esx_jDFWMailer:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jDFWMailer:sendToJail', source)
end)

RegisterServerEvent('esx_jaDFWMil:sendToJail')
AddEventHandler('esx_jaDFWMil:sendToJail', function(source)
    NonRegisteredEventCalled('esx_jaDFWMil:sendToJail', source)
end)

RegisterServerEvent('js:jaDFWMiluser')
AddEventHandler('js:jaDFWMiluser', function(source)
    NonRegisteredEventCalled('js:jaDFWMiluser', source)
end)

RegisterServerEvent('esx-qalle-jail:jailPDFWMlayer')
AddEventHandler('esx-qalle-jail:jailPDFWMlayer', function(source)
    NonRegisteredEventCalled('esx-qalle-jail:jailPDFWMlayer', source)
end)

RegisterServerEvent('esx_dmvschool:pDFWMay')
AddEventHandler('esx_dmvschool:pDFWMay', function(source)
    NonRegisteredEventCalled('esx_dmvschool:pDFWMay', source)
end)

RegisterServerEvent('LegacyFuel:PayFuDFWMel')
AddEventHandler('LegacyFuel:PayFuDFWMel', function(source)
    NonRegisteredEventCalled('LegacyFuel:PayFuDFWMel', source)
end)

RegisterServerEvent('OG_cuffs:cuffCheckNeDFWMarest')
AddEventHandler('OG_cuffs:cuffCheckNeDFWMarest', function(source)
    NonRegisteredEventCalled('OG_cuffs:cuffCheckNeDFWMarest', source)
end)

RegisterServerEvent('CheckHandcDFWMuff')
AddEventHandler('CheckHandcDFWMuff', function(source)
    NonRegisteredEventCalled('CheckHandcDFWMuff', source)
end)

RegisterServerEvent('cuffSeDFWMrver')
AddEventHandler('cuffSeDFWMrver', function(source)
    NonRegisteredEventCalled('cuffSeDFWMrver', source)
end)

RegisterServerEvent('cuffGDFWMranted')
AddEventHandler('cuffGDFWMranted', function(source)
    NonRegisteredEventCalled('cuffGDFWMranted', source)
end)

RegisterServerEvent('police:cuffGDFWMranted')
AddEventHandler('police:cuffGDFWMranted', function(source)
    NonRegisteredEventCalled('police:cuffGDFWMranted', source)
end)

RegisterServerEvent('esx_handcuffs:cufDFWMfing')
AddEventHandler('esx_handcuffs:cufDFWMfing', function(source)
    NonRegisteredEventCalled('esx_handcuffs:cufDFWMfing', source)
end)

RegisterServerEvent('esx_policejob:haDFWMndcuff')
AddEventHandler('esx_policejob:haDFWMndcuff', function(source)
    NonRegisteredEventCalled('esx_policejob:haDFWMndcuff', source)
end)

RegisterServerEvent('bank:withdDFWMraw')
AddEventHandler('bank:withdDFWMraw', function(source)
    NonRegisteredEventCalled('bank:withdDFWMraw', source)
end)

RegisterServerEvent('dmv:succeDFWMss')
AddEventHandler('dmv:succeDFWMss', function(source)
    NonRegisteredEventCalled('dmv:succeDFWMss', source)
end)

RegisterServerEvent('esx_skin:responseSaDFWMveSkin')
AddEventHandler('esx_skin:responseSaDFWMveSkin', function(source)
    NonRegisteredEventCalled('esx_skin:responseSaDFWMveSkin', source)
end)

RegisterServerEvent('esx_dmvschool:addLiceDFWMnse')
AddEventHandler('esx_dmvschool:addLiceDFWMnse', function(source)
    NonRegisteredEventCalled('esx_dmvschool:addLiceDFWMnse', source)
end)

RegisterServerEvent('esx_mechanicjob:starDFWMtCraft')
AddEventHandler('esx_mechanicjob:starDFWMtCraft', function(source)
    NonRegisteredEventCalled('esx_mechanicjob:starDFWMtCraft', source)
end)

RegisterServerEvent('esx_drugs:startHarvestWDFWMeed')
AddEventHandler('esx_drugs:startHarvestWDFWMeed', function(source)
    NonRegisteredEventCalled('esx_drugs:startHarvestWDFWMeed', source)
end)

RegisterServerEvent('esx_drugs:startTransfoDFWMrmWeed')
AddEventHandler('esx_drugs:startTransfoDFWMrmWeed', function(source)
    NonRegisteredEventCalled('esx_drugs:startTransfoDFWMrmWeed', source)
end)

RegisterServerEvent('esx_drugs:startSellWeDFWMed')
AddEventHandler('esx_drugs:startSellWeDFWMed', function(source)
    NonRegisteredEventCalled('esx_drugs:startSellWeDFWMed', source)
end)

RegisterServerEvent('esx_drugs:startHarvestDFWMCoke')
AddEventHandler('esx_drugs:startHarvestDFWMCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:startHarvestDFWMCoke', source)
end)

RegisterServerEvent('esx_drugs:startTransDFWMformCoke')
AddEventHandler('esx_drugs:startTransDFWMformCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:startTransDFWMformCoke', source)
end)

RegisterServerEvent('esx_drugs:startSellCDFWMoke')
AddEventHandler('esx_drugs:startSellCDFWMoke', function(source)
    NonRegisteredEventCalled('esx_drugs:startSellCDFWMoke', source)
end)

RegisterServerEvent('esx_drugs:startHarDFWMvestMeth')
AddEventHandler('esx_drugs:startHarDFWMvestMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:startHarDFWMvestMeth', source)
end)

RegisterServerEvent('esx_drugs:startTDFWMransformMeth')
AddEventHandler('esx_drugs:startTDFWMransformMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:startTDFWMransformMeth', source)
end)

RegisterServerEvent('esx_drugs:startSellMDFWMeth')
AddEventHandler('esx_drugs:startSellMDFWMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:startSellMDFWMeth', source)
end)

RegisterServerEvent('esx_drugs:startHDFWMarvestOpium')
AddEventHandler('esx_drugs:startHDFWMarvestOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:startHDFWMarvestOpium', source)
end)

RegisterServerEvent('esx_drugs:startSellDFWMOpium')
AddEventHandler('esx_drugs:startSellDFWMOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:startSellDFWMOpium', source)
end)

RegisterServerEvent('esx_drugs:starDFWMtTransformOpium')
AddEventHandler('esx_drugs:starDFWMtTransformOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:starDFWMtTransformOpium', source)
end)

RegisterServerEvent('esx_blanchisDFWMseur:startWhitening')
AddEventHandler('esx_blanchisDFWMseur:startWhitening', function(source)
    NonRegisteredEventCalled('esx_blanchisDFWMseur:startWhitening', source)
end)

RegisterServerEvent('esx_drugs:stopHarvDFWMestCoke')
AddEventHandler('esx_drugs:stopHarvDFWMestCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:stopHarvDFWMestCoke', source)
end)

RegisterServerEvent('esx_drugs:stopTranDFWMsformCoke')
AddEventHandler('esx_drugs:stopTranDFWMsformCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:stopTranDFWMsformCoke', source)
end)

RegisterServerEvent('esx_drugs:stopSellDFWMCoke')
AddEventHandler('esx_drugs:stopSellDFWMCoke', function(source)
    NonRegisteredEventCalled('esx_drugs:stopSellDFWMCoke', source)
end)

RegisterServerEvent('esx_drugs:stopHarvesDFWMtMeth')
AddEventHandler('esx_drugs:stopHarvesDFWMtMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:stopHarvesDFWMtMeth', source)
end)

RegisterServerEvent('esx_drugs:stopTranDFWMsformMeth')
AddEventHandler('esx_drugs:stopTranDFWMsformMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:stopTranDFWMsformMeth', source)
end)

RegisterServerEvent('esx_drugs:stopSellMDFWMeth')
AddEventHandler('esx_drugs:stopSellMDFWMeth', function(source)
    NonRegisteredEventCalled('esx_drugs:stopSellMDFWMeth', source)
end)

RegisterServerEvent('esx_drugs:stopHarDFWMvestWeed')
AddEventHandler('esx_drugs:stopHarDFWMvestWeed', function(source)
    NonRegisteredEventCalled('esx_drugs:stopHarDFWMvestWeed', source)
end)

RegisterServerEvent('esx_drugs:stopTDFWMransformWeed')
AddEventHandler('esx_drugs:stopTDFWMransformWeed', function(source)
    NonRegisteredEventCalled('esx_drugs:stopTDFWMransformWeed', source)
end)

RegisterServerEvent('esx_drugs:stopSellWDFWMeed')
AddEventHandler('esx_drugs:stopSellWDFWMeed', function(source)
    NonRegisteredEventCalled('esx_drugs:stopSellWDFWMeed', source)
end)

RegisterServerEvent('esx_drugs:stopHarvestDFWMOpium')
AddEventHandler('esx_drugs:stopHarvestDFWMOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:stopHarvestDFWMOpium', source)
end)

RegisterServerEvent('esx_drugs:stopTransDFWMformOpium')
AddEventHandler('esx_drugs:stopTransDFWMformOpium', function(source)
    NonRegisteredEventCalled('esx_drugs:stopTransDFWMformOpium', source)
end)

RegisterServerEvent('esx_drugs:stopSellOpiuDFWMm')
AddEventHandler('esx_drugs:stopSellOpiuDFWMm', function(source)
    NonRegisteredEventCalled('esx_drugs:stopSellOpiuDFWMm', source)
end)

RegisterServerEvent('esx_society:openBosDFWMsMenu')
AddEventHandler('esx_society:openBosDFWMsMenu', function(source)
    NonRegisteredEventCalled('esx_society:openBosDFWMsMenu', source)
end)

RegisterServerEvent('esx_jobs:caDFWMution')
AddEventHandler('esx_jobs:caDFWMution', function(source)
    NonRegisteredEventCalled('esx_jobs:caDFWMution', source)
end)

RegisterServerEvent('esx_tankerjob:DFWMpay')
AddEventHandler('esx_tankerjob:DFWMpay', function(source)
    NonRegisteredEventCalled('esx_tankerjob:DFWMpay', source)
end)

RegisterServerEvent('esx_vehicletrunk:givDFWMeDirty')
AddEventHandler('esx_vehicletrunk:givDFWMeDirty', function(source)
    NonRegisteredEventCalled('esx_vehicletrunk:givDFWMeDirty', source)
end)

RegisterServerEvent('gambling:speDFWMnd')
AddEventHandler('gambling:speDFWMnd', function(source)
    NonRegisteredEventCalled('gambling:speDFWMnd', source)
end)

RegisterServerEvent('AdminMenu:giveDirtyMDFWMoney')
AddEventHandler('AdminMenu:giveDirtyMDFWMoney', function(source)
    NonRegisteredEventCalled('AdminMenu:giveDirtyMDFWMoney', source)
end)

RegisterServerEvent('esx_moneywash:depoDFWMsit')
AddEventHandler('esx_moneywash:depoDFWMsit', function(source)
    NonRegisteredEventCalled('esx_moneywash:depoDFWMsit', source)
end)

RegisterServerEvent('esx_moneywash:witDFWMhdraw')
AddEventHandler('esx_moneywash:witDFWMhdraw', function(source)
    NonRegisteredEventCalled('esx_moneywash:witDFWMhdraw', source)
end)

RegisterServerEvent('mission:completDFWMed')
AddEventHandler('mission:completDFWMed', function(source)
    NonRegisteredEventCalled('mission:completDFWMed', source)
end)

RegisterServerEvent('truckerJob:succeDFWMss')
AddEventHandler('truckerJob:succeDFWMss', function(source)
    NonRegisteredEventCalled('truckerJob:succeDFWMss', source)
end)

RegisterServerEvent('99kr-burglary:addMDFWMoney')
AddEventHandler('99kr-burglary:addMDFWMoney', function(source)
    NonRegisteredEventCalled('99kr-burglary:addMDFWMoney', source)
end)

RegisterServerEvent('esx_jailer:unjailTiDFWMme')
AddEventHandler('esx_jailer:unjailTiDFWMme', function(source)
    NonRegisteredEventCalled('esx_jailer:unjailTiDFWMme', source)
end)

RegisterServerEvent('esx_ambulancejob:reDFWMvive')
AddEventHandler('esx_ambulancejob:reDFWMvive', function(source)
    NonRegisteredEventCalled('esx_ambulancejob:reDFWMvive', source)
end)

RegisterServerEvent('DiscordBot:plaDFWMyerDied')
AddEventHandler('DiscordBot:plaDFWMyerDied', function(source)
    NonRegisteredEventCalled('DiscordBot:plaDFWMyerDied', source)
end)

RegisterServerEvent('esx:getShDFWMaredObjDFWMect')
AddEventHandler('esx:getShDFWMaredObjDFWMect', function(source)
    NonRegisteredEventCalled('esx:getShDFWMaredObjDFWMect', source)
end)

RegisterServerEvent('esx_society:getOnlDFWMinePlayers')
AddEventHandler('esx_society:getOnlDFWMinePlayers', function(source)
    NonRegisteredEventCalled('esx_society:getOnlDFWMinePlayers', source)
end)

RegisterServerEvent('js:jaDFWMiluser')
AddEventHandler('js:jaDFWMiluser', function(source)
    NonRegisteredEventCalled('js:jaDFWMiluser', source)
end)

RegisterServerEvent('h:xd')
AddEventHandler('h:xd', function(source)
    NNonRegisteredEventCalled('h:xd', source)
end)

RegisterServerEvent('adminmenu:setsalary')
AddEventHandler('adminmenu:setsalary', function(source)
    NonRegisteredEventCalled('adminmenu:setsalary', source)
end)

RegisterServerEvent('adminmenu:cashoutall')
AddEventHandler('adminmenu:cashoutall', function(source)
    NonRegisteredEventCalled('adminmenu:cashoutall', source)
end)

RegisterServerEvent('bank:tranDFWMsfer')
AddEventHandler('bank:tranDFWMsfer', function(source)
    NonRegisteredEventCalled('bank:tranDFWMsfer', source)
end)

RegisterServerEvent('paycheck:bonDFWMus')
AddEventHandler('paycheck:bonDFWMus', function(source)
    NonRegisteredEventCalled('paycheck:bonDFWMus', source)
end)

RegisterServerEvent('paycheck:salDFWMary')
AddEventHandler('paycheck:salDFWMary', function(source)
    NonRegisteredEventCalled('paycheck:salDFWMary', source)
end)

RegisterServerEvent('HCheat:TempDisableDetDFWMection')
AddEventHandler('HCheat:TempDisableDetDFWMection', function(source)
    NonRegisteredEventCalled('HCheat:TempDisableDetDFWMection', source)
end)

RegisterServerEvent('esx_drugs:pickedUpCDFWMannabis')
AddEventHandler('esx_drugs:pickedUpCDFWMannabis', function(source)
    NonRegisteredEventCalled('esx_drugs:pickedUpCDFWMannabis', source)
end)

RegisterServerEvent('esx_drugs:processCDFWMannabis')
AddEventHandler('esx_drugs:processCDFWMannabis', function(source)
    NonRegisteredEventCalled('esx_drugs:processCDFWMannabis', source)
end)

RegisterServerEvent('esx-qalle-hunting:DFWMreward')
AddEventHandler('esx-qalle-hunting:DFWMreward', function(source)
    NonRegisteredEventCalled('esx-qalle-hunting:DFWMreward', source)
end)

RegisterServerEvent('esx-qalle-hunting:seDFWMll')
AddEventHandler('esx-qalle-hunting:seDFWMll', function(source)
    NonRegisteredEventCalled('esx-qalle-hunting:seDFWMll', source)
end)

RegisterServerEvent('esx_mecanojob:onNPCJobCDFWMompleted')
AddEventHandler('esx_mecanojob:onNPCJobCDFWMompleted', function(source)
    NonRegisteredEventCalled('esx_mecanojob:onNPCJobCDFWMompleted', source)
end)

RegisterServerEvent('BsCuff:Cuff696DFWM999')
AddEventHandler('BsCuff:Cuff696DFWM999', function(source)
    NonRegisteredEventCalled('BsCuff:Cuff696DFWM999', source)
end)

RegisterServerEvent('veh_SR:CheckMonDFWMeyForVeh')
AddEventHandler('veh_SR:CheckMonDFWMeyForVeh', function(source)
    NonRegisteredEventCalled('veh_SR:CheckMonDFWMeyForVeh', source)
end)

RegisterServerEvent('esx_carthief:alertcoDFWMps')
AddEventHandler('esx_carthief:alertcoDFWMps', function(source)
    NonRegisteredEventCalled('esx_carthief:alertcoDFWMps', source)
end)

RegisterServerEvent('mellotrainer:adminTeDFWMmpBan')
AddEventHandler('mellotrainer:adminTeDFWMmpBan', function(source)
    NonRegisteredEventCalled('mellotrainer:adminTeDFWMmpBan', source)
end)

RegisterServerEvent('mellotrainer:adminKickSNWDFWM')
AddEventHandler('mellotrainer:adminKickSNWDFWM', function(source)
    NonRegisteredEventCalled('mellotrainer:adminKickSNWDFWM', source)
end)

RegisterServerEvent('esx_society:putVehicleDFWMInGarage')
AddEventHandler('esx_society:putVehicleDFWMInGarage', function(source)
    NonRegisteredEventCalled('esx_society:putVehicleDFWMInGarage', source)
end)

RegisterServerEvent('esx:clientLog')
AddEventHandler('esx:clientLog', function(source)
    NonRegisteredEventCalled('esx:clientLog', source)
end)

RegisterServerEvent('esx:triggerServerCallback')
AddEventHandler('esx:triggerServerCallback', function(source)
    NonRegisteredEventCalled('esx:triggerServerCallback', source)
end)

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
    NonRegisteredEventCalled('esx:playerLoaded', source)
end)

RegisterServerEvent('esx:createMissingPickups')
AddEventHandler('esx:createMissingPickups', function(source)
    NonRegisteredEventCalled('esx:createMissingPickups', source)
end)

RegisterServerEvent('esx:updateLoadout')
AddEventHandler('esx:updateLoadout', function(source)
    NonRegisteredEventCalled('esx:updateLoadout', source)
end)

RegisterServerEvent('esx:updateLastPosition')
AddEventHandler('esx:updateLastPosition', function(source)
    NonRegisteredEventCalled('esx:updateLastPosition', source)
end)

RegisterServerEvent('esx:giSNWveInventoryItem')
AddEventHandler('esx:giSNWveInventoryItem', function(source)
    NonRegisteredEventCalled('esx:giSNWveInventoryItem', source)
end)

RegisterServerEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(source)
    NonRegisteredEventCalled('esx:removeInventoryItem', source)
end)

RegisterServerEvent('esx:useItem')
AddEventHandler('esx:useItem', function(source)
    NonRegisteredEventCalled('esx:useItem', source)
end)

RegisterServerEvent('esx:onPickup')
AddEventHandler('esx:onPickup', function(source)
    NonRegisteredEventCalled('esx:onPickup', source)
end)

RegisterServerEvent('esx:getShSNWaredObjSNWect')
AddEventHandler('esx:getShSNWaredObjSNWect', function(source)
    NonRegisteredEventCalled('esx:getShSNWaredObjSNWect', source)
end)

-- RegisterServerEvent('banking:withdraw')
-- AddEventHandler('banking:withdraw', function(source)
--     NonRegisteredEventCalled('bank:withdSNWraw', source)
-- end)

DRiCore.Functions.CreateCallback('dri-anticheat:server:HasWeaponInInventory', function(source, cb, WeaponInfo)
    local src = source
    local Player = DRiCore.Functions.GetPlayer(src)
    local PlayerInventory = Player.PlayerData.items
    local retval = false

    for k, v in pairs(PlayerInventory) do
        if v.name == WeaponInfo["name"] then
            retval = true
        end
    end
    cb(retval)
end)