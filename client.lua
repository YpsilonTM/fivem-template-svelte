local QBCore = exports['qb-core']:GetCoreObject()
local netPrefix = GetCurrentResourceName() .. ':'

function PassToServer(name)
    RegisterNUICallback(name, function(payload, cb)
        lib.callback(netPrefix .. name, false, function(data)
            cb(data)
        end, payload)
    end)
end

PassToServer('Example')

RegisterNetEvent(netPrefix .. 'toggleUI', function(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = 'show',
        data = bool
    })
end)

RegisterNUICallback('close', function(payload, cb)
    TriggerEvent(netPrefix .. 'toggleUI', false)
    cb('ok')
end)
