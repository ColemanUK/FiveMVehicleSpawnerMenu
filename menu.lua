--##############################################################
--#### Vehicle Spawner Menu - Ace Permissions				####
--####------------------------------------------------------####
--#### Created by Coleman#8220                  			####
--#### Framework: Native UI                             	####
--##############################################################

--var declarations
local discordMemberVehiclesAllowed = false
local whitelistedVehiclesAllowed = false
local serverBoosterVehiclesAllowed = false
local tier1VehiclesAllowed = false
local tier2VehiclesAllowed = false
local tier3VehiclesAllowed = false

local timeoutMax = 1000

--Permissions
Citizen.CreateThread(function()
	TriggerServerEvent("discordMember.getIsAllowed")
	TriggerServerEvent("whitelistedMember.getIsAllowed")
	TriggerServerEvent("serverBooster.getIsAllowed")
    TriggerServerEvent("tier1.getIsAllowed")
    TriggerServerEvent("tier2.getIsAllowed")
    TriggerServerEvent("tier3.getIsAllowed")
end)

RegisterNetEvent("discordMember.returnIsAllowed")
AddEventHandler("discordMember.returnIsAllowed", function(isAllowed)
    discordMemberVehiclesAllowed = isAllowed
end)

RegisterNetEvent("whitelistedMember.returnIsAllowed")
AddEventHandler("whitelistedMember.returnIsAllowed", function(isAllowed)
    whitelistedVehiclesAllowed = isAllowed
end)

RegisterNetEvent("serverBooster.returnIsAllowed")
AddEventHandler("serverBooster.returnIsAllowed", function(isAllowed)
    serverBoosterVehiclesAllowed = isAllowed
end)

RegisterNetEvent("tier1.returnIsAllowed")
AddEventHandler("tier1.returnIsAllowed", function(isAllowed)
    tier1VehiclesAllowed = isAllowed
end)

RegisterNetEvent("tier2.returnIsAllowed")
AddEventHandler("tier2.returnIsAllowed", function(isAllowed)
    tier2VehiclesAllowed = isAllowed
end)

RegisterNetEvent("tier3.returnIsAllowed")
AddEventHandler("tier3.returnIsAllowed", function(isAllowed)
    tier3VehiclesAllowed = isAllowed
end)

--Menu Pooling
_menuPool = NativeUI.CreatePool()
menu = NativeUI.CreateMenu("Vehicle Menu", "~b~Donator Vehicle Menu")
_menuPool:Add(menu)

--Menu
function DiscordMemberVehicleMenu(menu)
    if discordMemberVehiclesAllowed then
        local subMenu = _menuPool:AddSubMenu(menu, "Discord Member Vehicles")
        local subMenuVehicleModels = {}
        local subMenuVehicleObjects = {}
        for i, vehicle in pairs(Config.DiscordMemberVehicles) do
            subMenuVehicleModels[i] = NativeUI.CreateItem(vehicle[1], "Spawn a " .. vehicle[1] .. "!")
            subMenuVehicleObjects[i] = vehicle
            
            subMenu:AddItem(subMenuVehicleModels[i])
        end

        subMenu.OnItemSelect = function(Sender, Item, Index)
            print(Index)
            if Item == subMenuVehicleModels[Index] then
                local vehicle = subMenuVehicleObjects[Index]
                SpawnCar(vehicle[1], vehicle[2])
            end
        end
    end
end

function WhitelistedMemberVehicleMenu(menu)
    if whitelistedVehiclesAllowed then
        local subMenu = _menuPool:AddSubMenu(menu, "Whitelisted Member Vehicles")
        local subMenuVehicleModels = {}
        local subMenuVehicleObjects = {}

        for i, vehicle in pairs(Config.WhitelistedVehicles) do
            subMenuVehicleModels[i] = NativeUI.CreateItem(vehicle[1], "Spawn a " .. vehicle[1] .. "!")
            subMenuVehicleObjects[i] = vehicle

            subMenu:AddItem(subMenuVehicleModels[i])
        end

        subMenu.OnItemSelect = function(Sender, Item, Index)
            if Item == subMenuVehicleModels[Index] then
                local vehicle = subMenuVehicleObjects[Index]
                SpawnCar(vehicle[1], vehicle[2])
            end
        end
    end
end

function ServerBoosterVehicleMenu(menu)
    if serverBoosterVehiclesAllowed then  
        local subMenu = _menuPool:AddSubMenu(menu, "Server Booster Vehicles")
        local subMenuVehicleModels = {}
        local subMenuVehicleObjects = {}

        for i, vehicle in pairs(Config.ServerBoosterVehicles) do
            subMenuVehicleModels[i] = NativeUI.CreateItem(vehicle[1], "Spawn a " .. vehicle[1] .. "!")
            subMenuVehicleObjects[i] = vehicle

            subMenu:AddItem(subMenuVehicleModels[i])
        end

        subMenu.OnItemSelect = function(Sender, Item, Index)
            if Item == subMenuVehicleModels[Index] then
                local vehicle = subMenuVehicleObjects[Index]
                SpawnCar(vehicle[1], vehicle[2])
            end
        end
    end
end

function Tier1VehicleMenu(menu)
    if tier1VehiclesAllowed then
        local subMenu = _menuPool:AddSubMenu(menu, "Tier 1 Vehicles")
        local subMenuVehicleModels = {}
        local subMenuVehicleObjects = {}

        for i, vehicle in pairs(Config.Tier1Vehicles) do
            subMenuVehicleModels[i] = NativeUI.CreateItem(vehicle[1], "Spawn a " .. vehicle[1] .. "!")
            subMenuVehicleObjects[i] = vehicle

            subMenu:AddItem(subMenuVehicleModels[i])
        end

        subMenu.OnItemSelect = function(Sender, Item, Index)
            if Item == subMenuVehicleModels[Index] then
                local vehicle = subMenuVehicleObjects[Index]
                SpawnCar(vehicle[1], vehicle[2])
            end
        end
    end
end

function Tier2VehicleMenu(menu)
    if tier2VehiclesAllowed then
        local subMenu = _menuPool:AddSubMenu(menu, "Tier 2 Vehicles")
        local subMenuVehicleModels = {}
        local subMenuVehicleObjects = {}

        for i, vehicle in pairs(Config.Tier2Vehicles) do
            subMenuVehicleModels[i] = NativeUI.CreateItem(vehicle[1], "Spawn a " .. vehicle[1] .. "!")
            subMenuVehicleObjects[i] = vehicle

            subMenu:AddItem(subMenuVehicleModels[i])
        end

        subMenu.OnItemSelect = function(Sender, Item, Index)
            if Item == subMenuVehicleModels[Index] then
                local vehicle = subMenuVehicleObjects[Index]
                SpawnCar(vehicle[1], vehicle[2])
            end
        end
    end 
end

function Tier3VehicleMenu(menu)
    if tier3VehiclesAllowed then
        local subMenu = _menuPool:AddSubMenu(menu, "Tier 3 Vehicles")
        local subMenuVehicleModels = {}
        local subMenuVehicleObjects = {}

        for i, vehicle in pairs(Config.Tier3Vehicles) do
            subMenuVehicleModels[i] = NativeUI.CreateItem(vehicle[1], "Spawn a " .. vehicle[1] .. "!")
            subMenuVehicleObjects[i] = vehicle

            subMenu:AddItem(subMenuVehicleModels[i])
        end

        subMenu.OnItemSelect = function(Sender, Item, Index)
            if Item == subMenuVehicleModels[Index] then
                local vehicle = subMenuVehicleObjects[Index]
                SpawnCar(vehicle[1], vehicle[2])
            end
        end
    end 
end

--Display if allowed
DiscordMemberVehicleMenu(menu)
WhitelistedMemberVehicleMenu(menu)
ServerBoosterVehicleMenu(menu)
Tier1VehicleMenu(menu)
Tier2VehicleMenu(menu)
Tier3VehicleMenu(menu)
_menuPool:MouseControlsEnabled(false)
_menuPool:RefreshIndex()

--Menu Opening
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
    
        if IsControlJustPressed(1, Config.Activationkey) then
            menu:Visible(not menu:Visible())
        end
    end
end)

RegisterCommand(Config.ActivationCommand, function(source, args, rawCommand)
    menu:Visible(not menu:Visible())
end, false)

--Dependency Code

function DeleteCurrentVehicle()
	local ped = GetPlayerPed( -1 )
	local numRetries = 10

    if DoesEntityExist(ped) and not IsEntityDead(ped) then 
        local pos = GetEntityCoords(ped)

        if IsPedSittingInAnyVehicle(ped) then 
            local vehicle = GetVehiclePedIsIn(ped,false)

            if GetPedInVehicleSeat(vehicle, -1) == ped then 
                DeleteGivenVehicle(vehicle, numRetries)
            else 
               
            end 
        else
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, distanceToCheck, 0.0)
            local vehicle = GetVehicleInDirection(ped, pos, inFrontOfPlayer)

            if DoesEntityExist(vehicle) then 
                DeleteGivenVehicle(vehicle, numRetries)
            else 
              
            end 
        end 
    end
end	

function DeleteGivenVehicle(veh, timeoutMax)
    local timeout = 0 

    SetEntityAsMissionEntity(veh, true, true)
    DeleteVehicle(veh)

    if DoesEntityExist(veh) then
       
        while (DoesEntityExist(veh) and timeout < timeoutMax) do 
            DeleteVehicle(veh)

            if not DoesEntityExist(veh) then 
               
            end 

            timeout = timeout + 1 
            Citizen.Wait(500)

            if DoesEntityExist(veh) and (timeout == timeoutMax - 1) then
             
            end 
        end 
    else 
        
    end 
end 

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
    local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
    
    if ( IsEntityAVehicle( vehicle ) ) then 
        return vehicle
    end 
end

function SpawnCar(vehicleName, vehicleSpawncode)
    -- check if the vehicle actually exists
    if not IsModelInCdimage(vehicleSpawncode) or not IsModelAVehicle(vehicleSpawncode) then
        TriggerEvent('chat:addMessage', {
            args = { '^1Perpetual Roleplay','^3Vehicle not found. Please contact server development with the following information: ^5Name - ' .. vehicleName}
        })
        return
    end

    -- load the model
    RequestModel(vehicleSpawncode)

    -- wait for the model to load
    while not HasModelLoaded(vehicleSpawncode) do
        Citizen.Wait(500)
    end

    -- get the player's position
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed) 
	
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		DeleteCurrentVehicle()
	end	
	
    -- create the vehicle
    local vehicle = CreateVehicle(vehicleSpawncode, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    -- set the player ped into the vehicle's driver seat
    SetPedIntoVehicle(playerPed, vehicle, -1)

    -- give the vehicle back to the game
    SetEntityAsNoLongerNeeded(vehicle)
    -- release the model
    SetModelAsNoLongerNeeded(vehicleSpawncode)
    
end