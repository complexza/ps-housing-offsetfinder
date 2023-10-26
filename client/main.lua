local shell, oldCoords

RegisterNetEvent('ps-housing-offsetfinder:spawnShell', function(shellName)
    local shellModel = shellName and joaat(shellName)
    if not shellName then
        return lib.notify({ description = 'The Interior '..shellName..' does not exist!', type = 'error'})
    elseif not IsModelInCdimage(shellModel) then
        return lib.notify({ description = 'The Interior '..shellName..' is not in CD Image, Did you start the shell?!', type = 'error'})
    end

    if DoesEntityExist(shell) then 
        DeleteEntity(shell)
    else
        oldCoords = GetEntityCoords(cache.ped)
    end

    shell = CreateObject(shellModel, oldCoords + vec3(0.0, 0.0, 50.0), true, true)
    FreezeEntityPosition(shell, true)
    SetEntityHeading(shell, 0.0)

    SetEntityCoordsNoOffset(cache.ped, GetEntityCoords(shell))

    lib.showTextUI('[BACKSPACE] - Delete Shell | [ENTER] - Copy Offsets', {
        position = "top-center",
        icon = 'fas fa-house-circle-exclamation',
        style = {
            borderRadius = 10,
            backgroundColor = '#4B4B4B',
        }
    })
end)

local removeShell = lib.addKeybind({
    name = 'removeShell',
    description = 'Delete Current Shell',
    defaultKey = 'BACK',
    onPressed = function()
        if not shell then 
            return 
        end
    
        DeleteEntity(shell)
        shell = nil
    
        SetEntityCoordsNoOffset(cache.ped, oldCoords)
        oldCoords = nil
        if lib.isTextUIOpen() then
            lib.hideTextUI()
        end
        lib.notify({ description = 'Shell has been deleted.', type = 'inform'})
    end,
})

local copyOffset = lib.addKeybind({
    name = 'copyOffset',
    description = 'Copy Shell Offset',
    defaultKey = 'RETURN',
    onPressed = function()
        if not shell then 
            return 
        end
        local myCoords, shellCoords = GetEntityCoords(cache.ped) - vec3(0.0, 0.0, 0.99), GetEntityCoords(shell)
        local offset = myCoords - shellCoords

        lib.setClipboard("doorOffset = { x = "..offset.x..", y = "..offset.y..", z = "..offset.z..", h = "..GetEntityHeading(cache.ped)..", width = 2.0 },")

        lib.notify({ description = 'Offets has been copied to your clipboard', type = 'inform'})
    end,
})