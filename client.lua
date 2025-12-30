local currentAnimal = nil
local menuOpen = false

-- List of all animals
local animals = {
    -- Alligators
    { label = "Alligator (Baby)", model = "A_C_Alligator_03" },
	{ label = "Alligator (Adult)", model = "A_C_Alligator_01" },
   	{ label = "Alligator (Legend)", model = "A_C_Alligator_02" },
    
    -- Armadillo
    { label = "Armadillo", model = "A_C_Armadillo_01" },
    
    -- Badgers
    { label = "Badger", model = "A_C_Badger_01" },
    
    -- Bats
    { label = "Bat", model = "A_C_Bat_01" },
    
    -- Bears
    { label = "Bear (Black)", model = "A_C_Bear_01" },
    { label = "Bear (Grizzly)", model = "A_C_BearBlack_01" },
    
    -- Beavers
    { label = "Beaver", model = "A_C_Beaver_01" },
    
    -- Boars
    { label = "Boar", model = "A_C_Boar_01" },
    
    -- Buffalo
    { label = "Buffalo", model = "A_C_Buffalo_01" },
    { label = "Buffalo (Tatanka)", model = "A_C_Buffalo_Tatanka_01" },
    
    -- Bulls
    { label = "Bull", model = "A_C_Bull_01" },
    
    -- Cats
    { label = "Cat", model = "A_C_Cat_01" },
    
    -- Chickens
    { label = "Chicken", model = "A_C_Chicken_01" },
    { label = "Rooster", model = "A_C_Rooster_01" },
    
    -- Chipmunks
    { label = "Chipmunk", model = "A_C_Chipmunk_01" },
    
    -- Cougars
    { label = "Cougar", model = "A_C_Cougar_01" },
    
    -- Cows
    { label = "Cow", model = "a_c_cow" },
    
    -- Coyotes
    { label = "Coyote", model = "A_C_Coyote_01" },
    
    -- Crabs
    { label = "Crab", model = "A_C_Crab_01" },
    
    -- Crows/Ravens
    { label = "Crow", model = "A_C_Crow_01" },
    { label = "Raven", model = "A_C_Raven_01" },
    
    -- Deer
    { label = "Deer", model = "A_C_Deer_01" },
    { label = "Buck", model = "A_C_Buck_01" },
    
    -- Dogs
    { label = "Dog (Bloodhound)", model = "A_C_DogBluetickCoonhound_01" },
    { label = "Dog (Husky)", model = "A_C_DogHusky_01" },
    { label = "Dog (Rufus)", model = "A_C_DogRufus_01" },
    { label = "Dog (Shepherd)", model = "A_C_DogAustralianSheperd_01" },
    { label = "Dog (Street)", model = "A_C_DogStreet_01" },
    
    -- Donkeys
    { label = "Donkey", model = "A_C_Donkey_01" },
    
    -- Ducks
    { label = "Duck", model = "A_C_Duck_01" },
    
    -- Eagles
    { label = "Eagle", model = "A_C_Eagle_01" },
    
    -- Egrets
    { label = "Egret", model = "A_C_Egret_01" },
    
    -- Elk
    { label = "Elk", model = "A_C_Elk_01" },
    
    -- Fish
    { label = "Bluegill", model = "A_C_FishBluegil_01_ms" },
    { label = "Bullhead Catfish", model = "A_C_FishBullHeadCat_01_ms" },
    { label = "Bass", model = "A_C_FishLargeMouthBass_01_ms" },
    { label = "Salmon (Large)", model = "a_c_fishsalmonsockeye_01_lg" },
	{ label = "Salmon (Medium)", model = "a_c_fishsalmonsockeye_01_ml" },
	{ label = "Salmon (Small)", model = "a_c_fishsalmonsockeye_01_ms" },
    
    -- Foxes
    { label = "Fox", model = "A_C_Fox_01" },
    
    -- Frogs/Toads
    { label = "Frog", model = "a_c_frogbull_01" },
    { label = "Toad", model = "a_c_toad_01" },
    
    -- Geese
    { label = "Goose", model = "A_C_GooseCanada_01" },
    
    -- Goats
    { label = "Goat", model = "A_C_Goat_01" },
    
    -- Hawks
    { label = "Hawk", model = "A_C_Hawk_01" },
    
    -- Herons
    { label = "Heron", model = "A_C_Heron_01" },
    
    -- Horses (Wild)
    { label = "Horse (Wild)", model = "A_C_Horse_AmericanPaint_Greyovero" },
    
    -- Iguanas
    { label = "Iguana", model = "A_C_Iguana_01" },
    { label = "Desert Iguana", model = "A_C_IguanaDesert_01" },
    
    -- Javelinas
    { label = "Javelina", model = "A_C_Javelina_01" },
    
    -- Lions (Mountain)
    { label = "Lion", model = "a_c_lionmangy_01" },
    
    -- Loons
    { label = "Loon", model = "A_C_Loon_01" },
    
    -- Moose
    { label = "Moose", model = "A_C_Moose_01" },
    
    -- Muskrats
    { label = "Muskrat", model = "A_C_Muskrat_01" },
    
    -- Opossums
    { label = "Opossum", model = "A_C_Possum_01" },
    
    -- Orioles
    { label = "Oriole", model = "A_C_ORIOLE_01" },
    
    -- Owls
    { label = "Owl", model = "A_C_Owl_01" },
    
    -- Oxen
    { label = "Ox", model = "A_C_Ox_01" },
    
    -- Panthers
    { label = "Panther", model = "A_C_Panther_01" },
    
    -- Parakeets
    { label = "Carolina Parakeet", model = "A_C_CarolinaParakeet_01" },
    
    -- Pelicans
    { label = "Pelican", model = "A_C_Pelican_01" },
    
    -- Pheasants
    { label = "Pheasant", model = "A_C_Pheasant_01" },
    
    -- Pigs
    { label = "Pig", model = "A_C_Pig_01" },
    
    -- Pigeons
    { label = "Pigeon", model = "a_c_pigeon" },
    
    -- Pronghorns
    { label = "Pronghorn", model = "A_C_Pronghorn_01" },
    
    -- Quails
    { label = "Quail", model = "A_C_Quail_01" },
    
    -- Rabbits
    { label = "Rabbit", model = "A_C_Rabbit_01" },
    
    -- Raccoons
    { label = "Raccoon", model = "A_C_Raccoon_01" },
    
    -- Rams
    { label = "Ram (Bighorn)", model = "A_C_BighornRam_01" },
    
    -- Rats
    { label = "Rat", model = "A_C_Rat_01" },
    
    -- Seagulls
    { label = "Seagull", model = "A_C_Seagull_01" },
    
    -- Sheep
    { label = "Sheep", model = "A_C_Sheep_01" },
    
    -- Skunks
    { label = "Skunk", model = "A_C_Skunk_01" },
    
    -- Snakes
    { label = "Snake (Boa Small)", model = "A_C_SNAKEREDBOA_01" },
	{ label = "Snake (Boa Large)", model = "a_c_snakeredboa10ft_01" },
    { label = "Snake (Rattlesnake Small)", model = "a_c_snakeblacktailrattle_01" },
	{ label = "Snake (Rattlesnake Large)", model = "A_C_Snake_01" },
    { label = "Snake (Water)", model = "A_C_SnakeWater_01" },
    
    -- Songbirds
    { label = "Songbird", model = "A_C_Songbird_01" },
    
    -- Sparrows
    { label = "Sparrow", model = "A_C_Sparrow_01" },
    
    -- Squirrels
    { label = "Squirrel", model = "A_C_Squirrel_01" },
    
    -- Turkeys
    { label = "Turkey", model = "A_C_Turkey_01" },
    { label = "Turkey (Wild)", model = "A_C_TurkeyWild_01" },
    
    -- Turtles
    { label = "Sea Turtle", model = "a_c_turtlesea_01" },
	{ label = "Snapping Turtle", model = "a_c_turtlesnapping_01" },
    
    -- Vultures
    { label = "Vulture", model = "A_C_Vulture_01" },
    
    -- Wolves
	{ label = "Wolf (Small)", model = "A_C_Wolf_Small" },
    { label = "Wolf (Medium)", model = "a_c_wolf_medium" },
    
    -- Woodpeckers
    { label = "Woodpecker", model = "A_C_Woodpecker_01" },
}

table.sort(animals, function(a, b)
    return a.label < b.label
end)

local function DeleteCurrentAnimal()
    if currentAnimal and DoesEntityExist(currentAnimal) then
        DeleteEntity(currentAnimal)
        currentAnimal = nil
    end
end

local function SpawnAnimal(model)
    -- print("^2[nzkfc-animalspawner]^7 Attempting to spawn: " .. model)
    DeleteCurrentAnimal()
    
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    
    local radHeading = math.rad(heading)
    local forwardX = math.sin(radHeading)
    local forwardY = math.cos(radHeading)

    local rightX = math.sin(radHeading + math.rad(90))
    local rightY = math.cos(radHeading + math.rad(90))

    local frontX = coords.x + (forwardX * -8.0) + (rightX * 0.0)
    local frontY = coords.y + (forwardY * 5.0) + (rightY * 0.0)
    local frontZ = coords.z

    local spawnHeading = (heading - 90) % 360
    
    local modelHash = GetHashKey(model)
    
    if not IsModelValid(modelHash) then
        print("^1[nzkfc-animalspawner]^7 ERROR: Model is not valid!")
        return
    end
    
    RequestModel(modelHash)
    
    local timeout = 0
    while not HasModelLoaded(modelHash) and timeout < 200 do
        Wait(10)
        timeout = timeout + 1
    end
    
    if not HasModelLoaded(modelHash) then
        print("^1[nzkfc-animalspawner]^7 ERROR: Failed to load model")
        return
    end
    
    currentAnimal = CreatePed(modelHash, frontX, frontY, frontZ, spawnHeading, false, false)
    
    if not DoesEntityExist(currentAnimal) then
        print("^1[nzkfc-animalspawner]^7 ERROR: Failed to create entity")
        SetModelAsNoLongerNeeded(modelHash)
        return
    end
    
    SetEntityAsMissionEntity(currentAnimal, true, true)
    Wait(200)
    
    Citizen.InvokeNative(0x283978A15512B2FE, currentAnimal, true)
    SetEntityLodDist(currentAnimal, 5000)
    PlaceEntityOnGroundProperly(currentAnimal)
    SetEntityVisible(currentAnimal, true)
    SetEntityAlpha(currentAnimal, 255, false)
    Wait(100)

    FreezeEntityPosition(currentAnimal, true)
    SetEntityInvincible(currentAnimal, true)
    SetBlockingOfNonTemporaryEvents(currentAnimal, true)

    ClearPedTasksImmediately(currentAnimal)
    TaskStandStill(currentAnimal, -1)
    
    SetPedCanRagdoll(currentAnimal, false)
    Citizen.InvokeNative(0xC1E8A0BB9B49857, currentAnimal, 1, true) -- CPED_CONFIG_FLAG_DisableAmbientMelee
    Citizen.InvokeNative(0xC1E8A0BB9B49857, currentAnimal, 2, true) -- CPED_CONFIG_FLAG_DisableHurt
    Citizen.InvokeNative(0xC1E8A0BB9B49857, currentAnimal, 6, true) -- CPED_CONFIG_FLAG_NeverLeavesGroup
    Citizen.InvokeNative(0xC1E8A0BB9B49857, currentAnimal, 17, true) -- CPED_CONFIG_FLAG_BlockNonTemporaryEvents

    Citizen.InvokeNative(0x1F298C7BD30D1240, currentAnimal, 0) -- SetPedFleeAttributes - 0 = none

    Citizen.InvokeNative(0xB8B6430EAD2D2437, currentAnimal, true) -- SetPedAsNoLongerNeeded = false keeps control
    
    SetModelAsNoLongerNeeded(modelHash)
    
    -- print("^2[nzkfc-animalspawner]^7 Animal spawned and frozen successfully!")
end

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteCurrentAnimal()
    end
end)

RegisterNUICallback('spawnAnimal', function(data, cb)
    print("^2[nzkfc-animalspawner]^7 NUI Callback received for model: " .. tostring(data.model))
    
    if data.model then
        SpawnAnimal(data.model)
        cb({status = 'ok'})
    else
        print("^1[nzkfc-animalspawner]^7 ERROR: No model provided in callback!")
        cb({status = 'error'})
    end
end)

RegisterNUICallback('closeMenu', function(data, cb)
    -- print("^2[nzkfc-animalspawner]^7 Closing menu")
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'hide' })
    cb({status = 'ok'})
end)

RegisterCommand('animal', function()
    -- print("^2[nzkfc-animalspawner]^7 Opening menu with " .. #animals .. " animals")
    SetNuiFocus(true, true)
    SendNUIMessage({ 
        action = 'show',
        animals = animals
    })
end, false)