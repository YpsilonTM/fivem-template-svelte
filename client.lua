local QBCore = exports['qb-core']:GetCoreObject()

function PassToServer(name)
    RegisterNUICallback(name, function(payload, cb)
        QBCore.Functions.TriggerCallback(GetCurrentResourceName() .. ':' .. name, function(result)
            cb(result)
        end, payload)
    end)
end

PassToServer('Example')
