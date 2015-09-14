-- This is the primary barebones gamemode script and should be used to assist in initializing your game mode


-- Set this to true if you want to see a complete debug output of all events/processes done by barebones
-- You can also change the cvar 'barebones_spew' at any time to 1 or 0 for output/no output
BAREBONES_DEBUG_SPEW = true 

if GameMode == nil then
    DebugPrint( '[BAREBONES] creating barebones game mode' )
    _G.GameMode = class({})
end

-- This library allow for easily delayed/timed actions
require('libraries/timers')
-- This library can be used for advancted physics/motion/collision of units.  See PhysicsReadme.txt for more information.
require('libraries/physics')
-- This library can be used for advanced 3D projectile systems.
require('libraries/projectiles')
-- This library can be used for sending panorama notifications to the UIs of players/teams/everyone
require('libraries/notifications')
-- This library can be used for starting customized animations on units from lua
require('libraries/animations')

-- These internal libraries set up barebones's events and processes.  Feel free to inspect them/change them if you need to.
require('internal/gamemode')
require('internal/events')

-- settings.lua is where you can specify many different properties for your game mode and is one of the core barebones files.
require('settings')
-- events.lua is where you can specify the actions to be taken when any event occurs and is one of the core barebones files.
require('events')


--[[
  This function should be used to set up Async precache calls at the beginning of the gameplay.

  In this function, place all of your PrecacheItemByNameAsync and PrecacheUnitByNameAsync.  These calls will be made
  after all players have loaded in, but before they have selected their heroes. PrecacheItemByNameAsync can also
  be used to precache dynamically-added datadriven abilities instead of items.  PrecacheUnitByNameAsync will 
  precache the precache{} block statement of the unit and all precache{} block statements for every Ability# 
  defined on the unit.

  This function should only be called once.  If you want to/need to precache more items/abilities/units at a later
  time, you can call the functions individually (for example if you want to precache units in a new wave of
  holdout).

  This function should generally only be used if the Precache() function in addon_game_mode.lua is not working.
]]
function GameMode:PostLoadPrecache()
  DebugPrint("[BAREBONES] Performing Post-Load precache")    
  --PrecacheItemByNameAsync("item_example_item", function(...) end)
  --PrecacheItemByNameAsync("example_ability", function(...) end)

  --PrecacheUnitByNameAsync("npc_dota_hero_viper", function(...) end)
  --PrecacheUnitByNameAsync("npc_dota_hero_enigma", function(...) end)
end

--[[
  This function is called once and only once as soon as the first player (almost certain to be the server in local lobbies) loads in.
  It can be used to initialize state that isn't initializeable in InitGameMode() but needs to be done before everyone loads in.
]]
function GameMode:OnFirstPlayerLoaded()
  DebugPrint("[BAREBONES] First Player has loaded")
end

--[[
  This function is called once and only once after all players have loaded into the game, right as the hero selection time begins.
  It can be used to initialize non-hero player state or adjust the hero selection (i.e. force random etc)
]]
function GameMode:OnAllPlayersLoaded()
  DebugPrint("[BAREBONES] All Players have loaded into the game")
end

--[[
  This function is called once and only once for every player when they spawn into the game for the first time.  It is also called
  if the player's hero is replaced with a new hero for any reason.  This function is useful for initializing heroes, such as adding
  levels, changing the starting gold, removing/adding abilities, adding physics, etc.

  The hero parameter is the hero entity that just spawned in
]]
function GameMode:OnHeroInGame(hero)
  DebugPrint("[BAREBONES] Hero spawned in game for first time -- " .. hero:GetUnitName())

  -- This line for example will set the starting gold of every hero to 500 unreliable gold
  hero:SetGold(500, false)

  -- These lines will create an item and add it to the player, effectively ensuring they start with the item
  local item = CreateItem("item_example_item", hero, hero)
  hero:AddItem(item)

  --[[ --These lines if uncommented will replace the W ability of any hero that loads into the game
    --with the "example_ability" ability

  local abil = hero:GetAbilityByIndex(1)
  hero:RemoveAbility(abil:GetAbilityName())
  hero:AddAbility("example_ability")]]
end

--[[
  This function is called once and only once when the game completely begins (about 0:00 on the clock).  At this point,
  gold will begin to go up in ticks if configured, creeps will spawn, towers will become damageable etc.  This function
  is useful for starting any game logic timers/thinkers, beginning the first round, etc.
]]
function GameMode:OnGameInProgress()
  DebugPrint("[BAREBONES] The game has officially begun")
  cantidad0 = 0
  cantidad1 = 0
  cantidad2 = 0
  cantidad3 = 0
  cantidad4 = 0
  cantidad5 = 0
  cantidad6 = 0
  cantidad7 = 0
  cantidad8 = 0
  cantidad9 = 0
      
tableKills = {"npc_dota_neutral_kobold_tunneler","npc_dota_neutral_kobold_taskmaster","npc_dota_neutral_centaur_outrunner","npc_dota_neutral_centaur_khan","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord","npc_dota_neutral_dark_troll_warlord"}
  
  

  maxUnitsPerTeam = 20;
  unitsSpawnTime = 1;


  Timers:CreateTimer(5, -- Start this timer 30 game-time seconds later
    function()
      --DebugPrint("This function is called 5 seconds after the game begins, and every 1 second thereafter, table:")
--[[
      if cantidad0 < 20 then

        local fv = hero0:GetForwardVector() -- Vector the hero is facing
        local distance = 300
        local position = position0 + fv * distance
        local waypoint = Entities:FindByName( nil, "waypoint0"):GetAbsOrigin()

        local unit = CreateUnitByName("npc_dota_neutral_kobold", position, true, hero0, hero0, hero0:GetTeamNumber())
        ExecuteOrderFromTable({ UnitIndex = unit:GetEntityIndex(),
                                OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
                                Position = waypoint, Queue = true})       

        unit:SetOwner(hero0)
        unit:SetControllableByPlayer(playerID0, true)
        unit:SetAbsOrigin(position)
        cantidad0 = cantidad0+1
      end
]]

-- TODO for each gameteams, me fijo que onda la cantidad de unidades y con eso cambio los valores requeridos para evitar que quede en una estructura de ifs seguidos.


      if hero0 and cantidad0 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero0,position0,"waypoint0",gameTeams[2]["unitSpawn"],playerID0)
		gameTeams[2]["cantidad"] = gameTeams[2]["cantidad"]+1
        cantidad0 = cantidad0+1
      end

      if hero1 and cantidad1 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero1,position1,"waypoint1",gameTeams[3]["unitSpawn"],playerID1)

        cantidad1 = cantidad1+1
      end


        if hero2 and cantidad2 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero2,position2,"waypoint2",gameTeams[6]["unitSpawn"],playerID2)

        cantidad2 = cantidad2+1
      end

      if hero3 and cantidad3 < maxUnitsPerTeam then

          createUnitForPlayerInBase(hero3,position3,"waypoint3",gameTeams[7]["unitSpawn"],playerID3)

          cantidad3 = cantidad3+1
      end

      if hero4 and cantidad4 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero4,position4,"waypoint4",gameTeams[8]["unitSpawn"],playerID4)

        cantidad4 = cantidad4+1
      end

      if hero5 and cantidad5 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero5,position5,"waypoint5",gameTeams[9]["unitSpawn"],playerID5)

        cantidad5 = cantidad5+1
      end

      if hero6 and cantidad6 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero6,position6,"waypoint6",gameTeams[10]["unitSpawn"],playerID6)

        cantidad6 = cantidad6+1
      end

      if hero7 and cantidad7 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero7,position7,"waypoint7",gameTeams[11]["unitSpawn"],playerID7)

        cantidad7 = cantidad7+1
      end

      if hero8 and cantidad8 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero8,position8,"waypoint8",gameTeams[12]["unitSpawn"],playerID8)

        cantidad8 = cantidad8+1
      end

      if hero9 and cantidad9 < maxUnitsPerTeam then

        createUnitForPlayerInBase(hero9,position9,"waypoint9",gameTeams[13]["unitSpawn"],playerID9)

        cantidad9 = cantidad9+1
      end



      return unitsSpawnTime -- Rerun this timer every 30 game-time seconds 
    end)
end



-- This function initializes the game mode and is called before anyone loads into the game
-- It can be used to pre-initialize any values/tables that will be needed later
function GameMode:InitGameMode()

  gameTeams = {}
  gameTeams[2] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[3] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[6] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[7] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[8] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[9] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[10] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[11] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[12] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}
  gameTeams[13] = {kills=0, unitSpawn="npc_dota_neutral_kobold", cantidad=0}

  GameMode = self
  DebugPrint('[BAREBONES] Starting to load Barebones gamemode...')

  -- Call the internal function to set up the rules/behaviors specified in constants.lua
  -- This also sets up event hooks for all event handlers in events.lua
  -- Check out internals/gamemode to see/modify the exact code
  GameMode:_InitGameMode()

  -- Commands can be registered for debugging purposes or as functions that can be called by the custom Scaleform UI
  Convars:RegisterCommand( "command_example", Dynamic_Wrap(GameMode, 'ExampleConsoleCommand'), "A console command example", FCVAR_CHEAT )

  DebugPrint('[BAREBONES] Done loading Barebones gamemode!\n\n')
end

-- This is an example console command
function GameMode:ExampleConsoleCommand()
  print( '******* Example Console Command ***************' )
  local cmdPlayer = Convars:GetCommandClient()
  if cmdPlayer then
    local playerID = cmdPlayer:GetPlayerID()
    if playerID ~= nil and playerID ~= -1 then
      -- Do something here for the player who called this command
      PlayerResource:ReplaceHeroWith(playerID, "npc_dota_hero_viper", 1000, 1000)
    end
  end

  print( '*********************************************' )
end

function createUnitForPlayerInBase(heroOwner,positionOwner,waypointName,unitName,playerID)

-- de esta forma se crea un nuevo vector Vector(1, 2, 3)
  local fv = (Vector(0,0,0) - positionOwner):Normalized() -- Vector the hero is facing
  local distance = 300
  local position = positionOwner + fv * distance
  local waypoint = Entities:FindByName( nil, waypointName):GetAbsOrigin()

  local unit = CreateUnitByName(unitName, position, true, heroOwner, heroOwner, heroOwner:GetTeamNumber())
  ExecuteOrderFromTable({ UnitIndex = unit:GetEntityIndex(),
                          OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE, --DOTA_UNIT_ORDER_MOVE_TO_POSITION
                          Position = waypoint, Queue = true})       

  unit:SetOwner(heroOwner)
  unit:SetControllableByPlayer(playerID, true)
  --unit:SetAbsOrigin(position)
  


end

