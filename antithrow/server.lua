local FG = "koekje" 

CreateThread(function()
    while true do
        Wait(3000) 

        local players = GetPlayers()

        for _, src in ipairs(players) do
            local ped = GetPlayerPed(src)
            if ped and ped ~= 0 then
                local vehicles = GetGamePool("CVehicle")

                for _, veh in pairs(vehicles) do
                    if DoesEntityExist(veh) then
                        local attachedTo = GetEntityAttachedTo(veh)

                       
                        if attachedTo == ped and GetPedInVehicleSeat(veh, -1) ~= ped then
                            print(("[AntiCheat][koekje] Speler %d heeft voertuig vastgehecht. Wordt verbannen."):format(src))

                            exports[FG]:fg_BanPlayer(src, "Vehicle illegally attached to player (prop/attach abuse)", true)
                        end
                    end
                end
            end
        end
    end
end)
