lib.addCommand('testshell', {
    help = 'Spawn Shell for Offsets',
    params = {
        {
            name = 'shell',
            help = 'Name of Shell',
        },
    },
    restricted = false
}, function(source, args)
    TriggerClientEvent('ps-housing-offsetfinder:spawnShell', source, args.shell)
end)