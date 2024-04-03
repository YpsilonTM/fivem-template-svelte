local QBCore = exports['qb-core']:GetCoreObject()
local netPrefix = GetCurrentResourceName() .. ':'

lib.callback.register(netPrefix .. 'Example', function()
end)

lib.addCommand('example', { restricted = 'group.admin' }, function()

end)
