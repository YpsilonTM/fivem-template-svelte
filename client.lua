local QBCore = exports['qb-core']:GetCoreObject()

RegisterNUICallback('example', function(payload, cb)
    QBCore.Functions.TriggerCallback(GetCurrentResourceName() .. ':example', function(result)
        cb(result)
    end, payload)
end)
