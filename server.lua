local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback(GetCurrentResourceName() .. ':example', function(source, cb, data)
    local result = IsPlayerAceAllowed(source, 'command')
    cb(result)
end)
