local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
local resourceName = GetCurrentResourceName()

local function checkVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/ZaccariaDev/noDrive/main/VERSION', function(err, serverVersion, headers)
        if err == 200 then
            serverVersion = string.gsub(serverVersion, '\n', '')
            local serverVersionNum = tonumber(string.match(serverVersion, '%d+%.%d+%.%d+'))
            local currentVersionNum = tonumber(string.match(currentVersion, '%d+%.%d+%.%d+'))

            if serverVersionNum > currentVersionNum then
                print('^1[' .. resourceName .. '] Une nouvelle version est disponible !^0')
                print('^1[' .. resourceName .. '] Version actuelle : ' .. currentVersion .. '^0')
                print('^1[' .. resourceName .. '] Nouvelle version : ' .. serverVersion .. '^0')
                print('^1[' .. resourceName .. '] Veuillez télécharger la dernière version sur : https://github.com/ZaccariaDev/noDrive^0')
            else
                print('^2[' .. resourceName .. '] La version est à jour.^0')
            end
        else
            print('^1[' .. resourceName .. '] Impossible de vérifier la version. Erreur : ' .. tostring(err) .. '^0')
        end
    end, 'GET')
end

checkVersion()