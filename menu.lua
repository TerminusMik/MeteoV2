local ESX  = nil
TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

local MenuOpen = false
local TmsMenuMeteo = RageUI.CreateMenu("Menu Météo", "Cotrole le temps du server")
TmsMenuMeteo:SetRectangleBanner(42, 48, 48, 255)
local heure =  RageUI.CreateSubMenu(TmsMenuMeteo,'Heure', "Change l'heure")
heure:SetRectangleBanner(42, 48, 48, 255)
local temps =  RageUI.CreateSubMenu(TmsMenuMeteo,'Temps', "Change le temps")
temps:SetRectangleBanner(42, 48, 48, 255)
local divers =  RageUI.CreateSubMenu(TmsMenuMeteo,'Temps', "Autre")
divers:SetRectangleBanner(42, 48, 48, 255)
local blackout =  RageUI.CreateSubMenu(TmsMenuMeteo,'Blackout', "Coupe l'éléctricité")
blackout:SetRectangleBanner(42, 48, 48, 255)





TmsMenuMeteo.Closed = function()
    MenuOpen = false
end

local cooldown = false

function MenuMeteo()
    if MenuOpen then
        MenuOpen = false
    else
        MenuOpen = true
        RageUI.Visible(TmsMenuMeteo, true)
        CreateThread(function()
            while MenuOpen do
                Wait(1)

                RageUI.IsVisible(TmsMenuMeteo, function()
                    RageUI.Button('Heure', false , {RightLabel = "→"}, not cooldown , {},heure)  
                    RageUI.Button('Temps', false , {RightLabel = "→"}, not cooldown , {},temps)  
                    RageUI.Button('Divers', false , {RightLabel = "→"}, not cooldown , {},divers)  
                    RageUI.Separator("↓ ~r~DANGER ~s~↓")
                    RageUI.Button("Purge", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("weather halloween")
                            Wait(5000)
                            TriggerServerEvent("purge", "Que la purge commence ")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                        end
                    });

                    RageUI.Button('Blackout', false , {RightLabel = "→"}, not cooldown , {},blackout) 
                

                end)
                RageUI.IsVisible(heure,function()
                    RageUI.Button("Jours", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("noon")
                            ESX.ShowAdvancedNotification("Horloge", "Vous venez de mettre le jour", "", 'CHAR_LS_TOURIST_BOARD', 2)
                            cooldown = true
                            Citizen.SetTimeout(2000, function()
                                cooldown = false
                            end)
                        end
                    });

                    RageUI.Button("Nuit", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("night")
                            ESX.ShowAdvancedNotification("Horloge", "Vous venez de mettre la nuit", "", 'CHAR_LS_TOURIST_BOARD', 2)
                            cooldown = true
                            Citizen.SetTimeout(2000, function()
                                cooldown = false
                            end)
                        end
                    });
                    

                end, function()
                end)



                RageUI.IsVisible(temps,function()
                    RageUI.Button("Soleil", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("weather extrasunny")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("Soleil", "Les prévision annonce un temp ~y~Ensoleillé")                         
                            
                        end
                    });
                    RageUI.Button("Nuageux", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("weather overcast")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("Soleil", "Les prévision annonce un temp ~c~Nuageux")
                        end
                    });
                    RageUI.Button("Pluie", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("weather rain")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("Soleil", "Les prévision annonce de la ~b~Pluie")

                        end
                    });

                    RageUI.Button("Neige", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("weather snow")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("Soleil", "Les prévision annonce de la ~w~Neige")
                        end
                    });

                    RageUI.Separator("↓ ~r~Temête ~s~↓")

                    RageUI.Button("Orage", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            
                            ExecuteCommand("weather thunder")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("orage", "Les prévision annonce une tempête de ~r~Pluie")

                        end
                    });

                    RageUI.Button("Neige", nil, {RightLabel = "→"}, not cooldown, {
                        onSelected = function()             
                            ExecuteCommand("weather blizzard")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("orage", "Les prévision annonce une tempête de ~r~ Neige")
                        end
                    });

                end, function()
                end)

               


                RageUI.IsVisible(blackout,function()
                    RageUI.Button("~g~Activé ", "!! ~r~ATTENTION ~s~!! appuyer qu'une fois", {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("blackout")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("blackout", "La ville est plongé dans le noire. \n On fait notre possible pour arranger cela!!")

                        end
                    });
                    RageUI.Button("~r~Désactivé ", "!! ~r~ATTENTION ~s~!! appuyer qu'une fois", {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("blackout")
                            cooldown = true
                            Citizen.SetTimeout(5000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("blackout", "L'électricité est de retour en ville")

                        end
                    });
                   
                   

                end, function()
                end)

                
                RageUI.IsVisible(divers,function()
                    RageUI.Button("Neige", "met la map sous la neige", {RightLabel = "→"}, not cooldown, {
                        onSelected = function()
                            ExecuteCommand("weather xmas")
                            cooldown = true
                            Citizen.SetTimeout(2000, function()
                                cooldown = false
                            end)
                            Wait(5000)
                            TriggerServerEvent("orage", "Tout la ville est sous la neige")
                        end
                    });

                end, function()
                end)
            end
        end)
    end
end

RegisterCommand("meteo", function()
    if MenuOpen == false then
        MenuMeteo()
    end
end)
