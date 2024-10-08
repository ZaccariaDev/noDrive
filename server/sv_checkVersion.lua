local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
local resourceName = GetCurrentResourceName()

local function parseVersion(versionStr)
    local major, minor, patch = versionStr:match("(%d+)%.(%d+)%.(%d+)")
    return major and minor and patch and {tonumber(major), tonumber(minor), tonumber(patch)}
end

local function compareVersions(v1, v2)
    for i = 1, 3 do
        if v1[i] > v2[i] then return 1 end
        if v1[i] < v2[i] then return -1 end
    end
    return 0
end

local function printLogo()
    print([[^4
-------------------------------------------------------------------------------------------
--         __    __  _______                        __      __                           --
--         /  |  /  |/       \                      /  |    /  |                         --
--         $$ |  $$ |$$$$$$$  | ______    ______   _$$ |_   $$/   _______   ______       --
--         $$  \/$$/ $$ |__$$ |/      \  /      \ / $$   |  /  | /       | /      \      --
--          $$  $$<  $$    $$//$$$$$$  |/$$$$$$  |$$$$$$/   $$ |/$$$$$$$/ /$$$$$$  |     --
--           $$$$  \ $$$$$$$/ $$    $$ |$$ |  $$/   $$ | __ $$ |$$      \ $$    $$ |     --
--          $$ /$$  |$$ |     $$$$$$$$/ $$ |        $$ |/  |$$ | $$$$$$  |$$$$$$$$/      --
--         $$ |  $$ |$$ |     $$       |$$ |        $$  $$/ $$ |/     $$/ $$       |     --
--         $$/   $$/ $$/       $$$$$$$/ $$/          $$$$/  $$/ $$$$$$$/   $$$$$$$/      --
-------------------------------------------------------------------------------------------^0]])
end

local function checkVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/ZaccariaDev/noDrive/main/VERSION', function(err, serverVersion, headers)
        if err == 200 then
            serverVersion = serverVersion:gsub('%s+', '')
            local parsedServerVersion = parseVersion(serverVersion)
            local parsedCurrentVersion = parseVersion(currentVersion)

            if parsedServerVersion and parsedCurrentVersion then
                local compResult = compareVersions(parsedServerVersion, parsedCurrentVersion)
                if compResult > 0 then
                    printLogo()
                    print('^3[' .. resourceName .. '] ^1UNE NOUVELLE VERSION EST DISPONIBLE !^0')
                    print('^3[' .. resourceName .. '] ^1Version actuelle : ^5' .. currentVersion .. '^0')
                    print('^3[' .. resourceName .. '] ^1Nouvelle version : ^5' .. serverVersion .. '^0')
                    print('^3[' .. resourceName .. '] ^1Veuillez télécharger la dernière version sur : ^5https://github.com/ZaccariaDev/noDrive^0')
                    print('^3[' .. resourceName .. '] ^1MISE À JOUR RECOMMANDÉE !^0')
                else
                    print('^2[' .. resourceName .. '] La version est à jour.^0')
                end
            else
                print('^1[' .. resourceName .. '] Erreur lors de l\'analyse des versions.^0')
            end
        else
            print('^1[' .. resourceName .. '] Impossible de vérifier la version. Erreur : ' .. tostring(err) .. '^0')
        end
    end, 'GET')
end

-- Vérification de la version au démarrage du mod
checkVersion()
