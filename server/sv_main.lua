Wait(150)
local Config = Config
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("noDrive:checkPlyVeh")
AddEventHandler("noDrive:checkPlyVeh", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if not xPlayer then
        print("Erreur: Joueur non trouvé")
        return
    end

    local pJob = xPlayer.getJob().name
    local aVeh = {}
    local dVeh = {}

    for job, data in pairs(Config.JobVehicles) do
        for _, veh in ipairs(data.vehicles) do
            if job == pJob then
                aVeh[veh] = true
            else
                dVeh[veh] = true
            end
        end
    end

    TriggerClientEvent("noDrive:rcvVehLists", src, aVeh, dVeh)
end)

RegisterNetEvent("noDrive:checkVehPerm")
AddEventHandler("noDrive:checkVehPerm", function(vehModel)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if not xPlayer then
        print("Erreur: Joueur non trouvé")
        return 
    end

    local pJob = xPlayer.getJob().name
    local jVeh = Config.JobVehicles[pJob] and Config.JobVehicles[pJob].vehicles or {}

    local canDrive = false
    for _, veh in ipairs(jVeh) do
        if veh == vehModel then
            canDrive = true
            break
        end
    end

    TriggerClientEvent("noDrive:rcvVehPerm", src, canDrive)
end)

ESX.RegisterCommand('getModel', 'admin', function(xPlayer, args, showError)
    local src = xPlayer.source
    TriggerClientEvent('noDrive:getVehModel', src)
end, false, {help = 'Obtenir le nom du modèle du véhicule actuel'})

RegisterNetEvent('noDrive:returnVehicleModel')
AddEventHandler('noDrive:returnVehicleModel', function(modelName)
    local src = source
    if modelName then
        TriggerClientEvent('esx:showNotification', src, 'Modèle du véhicule : ' .. modelName)
    else
        TriggerClientEvent('esx:showNotification', src, 'NOT IN CAR')
    end
end)