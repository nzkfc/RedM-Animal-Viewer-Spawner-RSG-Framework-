RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateCallback('nzkfc-animalspawner:server:checkPermission', function(source, cb)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player then
        local hasPermission = RSGCore.Functions.HasPermission(source, 'admin')
        cb(hasPermission)
    else
        cb(false)
    end
end)