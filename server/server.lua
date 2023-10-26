lib.addCommand('testshell', {
    help = 'Gives an item to a player',
    params = {
        {
            name = 'shell',
            type = 'string',
            help = 'Name of Shell',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local shell = args.shell
 
    if shell then
        TriggerClientEvent('ps-housing-offsetfinder:spawnShell', source, shell)
    end
end)