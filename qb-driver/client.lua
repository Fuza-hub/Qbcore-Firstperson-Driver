local QBCore = exports['qb-core']:GetCoreObject()

-- Fonction pour forcer la vue à la première personne
local function forceFirstPersonView()
    CreateThread(function()
        while true do
            Wait(100)
            local ped = PlayerPedId()

            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local driver = GetPedInVehicleSeat(vehicle, -1)

                -- Vérifie si le joueur est le conducteur
                if driver == ped then
                    -- Change la vue en première personne
                    if GetFollowVehicleCamViewMode() ~= 4 then
                        SetFollowVehicleCamViewMode(4)
                    end
                end
            else
                -- Arrête le thread si le joueur n'est plus dans un véhicule
                break
            end
        end
    end)
end

-- Détecte quand un joueur entre dans un véhicule
CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            local driver = GetPedInVehicleSeat(vehicle, -1)

            -- Si le joueur est le conducteur, force la vue en première personne
            if driver == ped then
                forceFirstPersonView()
            end
        end
    end
end)
