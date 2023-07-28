local shell, oldCoords

RegisterCommand("testshell", function(_, args)
    local shellName = args[1]
    local shellModel = shellName and GetHashKey(shellName)
    if not shellName then
        return lib.notify({ description = 'The Interior '..shellName..' does not exist!', type = 'error'})
    elseif not IsModelInCdimage(shellModel) then
        return lib.notify({ description = 'The Interior '..shellName..' is not in CD Image, Did you start the shell?!', type = 'error'})
    end

    if DoesEntityExist(shell) then 
        DeleteEntity(shell)
    else
        oldCoords = GetEntityCoords(PlayerPedId())
    end

    shell = CreateObject(shellModel, oldCoords + vec3(0.0, 0.0, 50.0), true, true)
    FreezeEntityPosition(shell, true)
    SetEntityHeading(shell, 0.0)

    SetEntityCoordsNoOffset(PlayerPedId(), GetEntityCoords(shell))
end)

RegisterCommand("deleteshell", function()
    if not shell then 
        return 
    end

    DeleteEntity(shell)
    shell = nil

    SetEntityCoordsNoOffset(PlayerPedId(), oldCoords)
    oldCoords = nil

    lib.notify({ description = 'Shell has been deleted.', type = 'inform'})
end)
RegisterKeyMapping("deleteshell", "Delete current shell", "keyboard", "BACK")

RegisterCommand("copyoffset", function()
    if not shell then 
        return 
    end

    local myCoords, shellCoords = GetEntityCoords(PlayerPedId()) - vec3(0.0, 0.0, 0.99), GetEntityCoords(shell)
    local offset = myCoords - shellCoords
    SendNUIMessage({
        coords = ("doorOffset = { x = %f, y = %f, z = %f, h = %f, width = 2.0 },"):format(offset.x, offset.y, offset.z, GetEntityHeading(PlayerPedId()))
    })

    lib.notify({ description = 'Offets has been copied to your clipboard', type = 'inform'})
end)
RegisterKeyMapping("copyoffset", "Copy shell offset", "keyboard", "RETURN")
