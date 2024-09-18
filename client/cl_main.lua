local allowedVeh = {}
local disallowedVeh = {}
local Debug = false -- Définissez ceci à true pour activer le débogage
local isCheckingVehicle = false

local function DebugPrint(...)
    if Debug then
        print(...)
    end
end

Citizen.CreateThread(function()
    TriggerServerEvent("noDrive:checkPlyVeh")
    DebugPrint("Trigger envoyé pour vérifier les véhicules du joueur")
end)

RegisterNetEvent("noDrive:rcvVehLists")
AddEventHandler("noDrive:rcvVehLists", function(allowed, disallowed)
    allowedVeh = allowed
    disallowedVeh = disallowed
    DebugPrint("Véhicules autorisés reçus:", json.encode(allowed, {pretty = true}))
    DebugPrint("Véhicules non autorisés reçus:", json.encode(disallowed, {pretty = true}))
end)
-------------------------------------------------------------------------------------------
--         __    __  _______                        __      __                           --
--         /  |  /  |/       \                      /  |    /  |                         --
--         $$ |  $$ |$$$$$$$  | ______    ______   _$$ |_   $$/   _______   ______       --
--         $$  \/$$/ $$ |__$$ |/      \  /      \ / $$   |  /  | /       | /      \      --
--          $$  $$<  $$    $$//$$$$$$  |/$$$$$$  |$$$$$$/   $$ |/$$$$$$$/ /$$$$$$  |     --
--           $$$$  \ $$$$$$$/ $$    $$ |$$ |  $$/   $$ | __ $$ |$$      \ $$    $$ |     --
--          $$ /$$  |$$ |     $$$$$$$$/ $$ |        $$ |/  |$$ | $$$$$$  |$$$$$$$$/      --
--         $$ |  $$ |$$ |     $$       |$$ |        $$  $$/ $$ |/     $$/ $$       |     --
--         $$/   $$/ $$/       $$$$$$$/ $$/          $$$$/  $$/ $$$$$$$/   $$$$$$$/      --
-------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        
        if veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped then
            if not isCheckingVehicle then
                isCheckingVehicle = true
                local model = GetEntityModel(veh)
                local modelName = GetDisplayNameFromVehicleModel(model)
                
                if allowedVeh[modelName] then
                    SetVehicleEngineOn(veh, true, true, false)
                    DebugPrint("Véhicule autorisé et peut être conduit:", modelName)
                elseif disallowedVeh[modelName] then
                    SetVehicleEngineOn(veh, false, true, true)
                    DebugPrint("Véhicule non autorisé:", modelName)
                    -- Empêcher le démarrage du moteur
                    Citizen.CreateThread(function()
                        while isCheckingVehicle do
                            DisableControlAction(0, 71, true) -- Disable accelerating
                            DisableControlAction(0, 72, true) -- Disable reversing
                            SetVehicleEngineOn(veh, false, true, true)
                            Citizen.Wait(0)
                        end
                    end)
                else
                    SetVehicleEngineOn(veh, true, true, false)
                    DebugPrint("Véhicule non défini dans la config, autorisé par défaut:", modelName)
                end
            end
        else
            isCheckingVehicle = false
        end
    end
end)

RegisterNetEvent('noDrive:getVehModel')
AddEventHandler('noDrive:getVehModel', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    
    if veh ~= 0 then
        local model = GetEntityModel(veh)
        local modelName = GetDisplayNameFromVehicleModel(model)
        TriggerServerEvent('noDrive:returnVehicleModel', modelName)
    else
        TriggerServerEvent('noDrive:returnVehicleModel', nil)
    end
end)
