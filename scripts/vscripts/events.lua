-- This file contains all barebones-registered events and has already set up the passed-in parameters for your use.
-- Do not remove the GameMode:_Function calls in these events as it will mess with the internal barebones systems.

-- Cleanup a player when they leave
function GameMode:OnDisconnect(keys)
  DebugPrint('[BAREBONES] Player Disconnected ' .. tostring(keys.userid))
  DebugPrintTable(keys)

  local name = keys.name
  local networkid = keys.networkid
  local reason = keys.reason
  local userid = keys.userid

end
-- The overall game state has changed
function GameMode:OnGameRulesStateChange(keys)
  DebugPrint("[BAREBONES] GameRules State Changed")
  DebugPrintTable(keys)

  -- This internal handling is used to set up main barebones functions
  GameMode:_OnGameRulesStateChange(keys)

  local newState = GameRules:State_Get()
end

-- An NPC has spawned somewhere in game.  This includes heroes
function GameMode:OnNPCSpawned(keys)
  DebugPrint("[BAREBONES] NPC Spawned")
  DebugPrintTable(keys)

  -- This internal handling is used to set up main barebones functions
  GameMode:_OnNPCSpawned(keys)

  local npc = EntIndexToHScript(keys.entindex)
end

-- An entity somewhere has been hurt.  This event fires very often with many units so don't do too many expensive
-- operations here
function GameMode:OnEntityHurt(keys)
  --DebugPrint("[BAREBONES] Entity Hurt")
  --DebugPrintTable(keys)

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless
  if keys.entindex_attacker ~= nil and keys.entindex_killed ~= nil then
    local entCause = EntIndexToHScript(keys.entindex_attacker)
    local entVictim = EntIndexToHScript(keys.entindex_killed)

    -- The ability/item used to damage, or nil if not damaged by an item/ability
    local damagingAbility = nil

    if keys.entindex_inflictor ~= nil then
      damagingAbility = EntIndexToHScript( keys.entindex_inflictor )
    end
  end
end

-- An item was picked up off the ground
function GameMode:OnItemPickedUp(keys)
  DebugPrint( '[BAREBONES] OnItemPickedUp' )
  DebugPrintTable(keys)

  local heroEntity = EntIndexToHScript(keys.HeroEntityIndex)
  local itemEntity = EntIndexToHScript(keys.ItemEntityIndex)
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local itemname = keys.itemname
end

-- A player has reconnected to the game.  This function can be used to repaint Player-based particles or change
-- state as necessary
function GameMode:OnPlayerReconnect(keys)
  DebugPrint( '[BAREBONES] OnPlayerReconnect' )
  DebugPrintTable(keys) 
end

-- An item was purchased by a player
function GameMode:OnItemPurchased( keys )
  DebugPrint( '[BAREBONES] OnItemPurchased' )
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
  
end

-- An ability was used by a player
function GameMode:OnAbilityUsed(keys)
  DebugPrint('[BAREBONES] AbilityUsed')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityname = keys.abilityname
end

-- A non-player entity (necro-book, chen creep, etc) used an ability
function GameMode:OnNonPlayerUsedAbility(keys)
  DebugPrint('[BAREBONES] OnNonPlayerUsedAbility')
  DebugPrintTable(keys)

  local abilityname=  keys.abilityname
end

-- A player changed their name
function GameMode:OnPlayerChangedName(keys)
  DebugPrint('[BAREBONES] OnPlayerChangedName')
  DebugPrintTable(keys)

  local newName = keys.newname
  local oldName = keys.oldName
end

-- A player leveled up an ability
function GameMode:OnPlayerLearnedAbility( keys)
  DebugPrint('[BAREBONES] OnPlayerLearnedAbility')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local abilityname = keys.abilityname
end

-- A channelled ability finished by either completing or being interrupted
function GameMode:OnAbilityChannelFinished(keys)
  DebugPrint('[BAREBONES] OnAbilityChannelFinished')
  DebugPrintTable(keys)

  local abilityname = keys.abilityname
  local interrupted = keys.interrupted == 1
end

-- A player leveled up
function GameMode:OnPlayerLevelUp(keys)
  DebugPrint('[BAREBONES] OnPlayerLevelUp')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local level = keys.level
end

-- A player last hit a creep, a tower, or a hero
function GameMode:OnLastHit(keys)
  DebugPrint('[BAREBONES] OnLastHit')
  DebugPrintTable(keys)

  local isFirstBlood = keys.FirstBlood == 1
  local isHeroKill = keys.HeroKill == 1
  local isTowerKill = keys.TowerKill == 1
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local killedEnt = EntIndexToHScript(keys.EntKilled)
end

-- A tree was cut down by tango, quelling blade, etc
function GameMode:OnTreeCut(keys)
  DebugPrint('[BAREBONES] OnTreeCut')
  DebugPrintTable(keys)

  local treeX = keys.tree_x
  local treeY = keys.tree_y
end

-- A rune was activated by a player
function GameMode:OnRuneActivated (keys)
  DebugPrint('[BAREBONES] OnRuneActivated')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local rune = keys.rune

  --[[ Rune Can be one of the following types
  DOTA_RUNE_DOUBLEDAMAGE
  DOTA_RUNE_HASTE
  DOTA_RUNE_HAUNTED
  DOTA_RUNE_ILLUSION
  DOTA_RUNE_INVISIBILITY
  DOTA_RUNE_BOUNTY
  DOTA_RUNE_MYSTERY
  DOTA_RUNE_RAPIER
  DOTA_RUNE_REGENERATION
  DOTA_RUNE_SPOOKY
  DOTA_RUNE_TURBO
  ]]
end

-- A player took damage from a tower
function GameMode:OnPlayerTakeTowerDamage(keys)
  DebugPrint('[BAREBONES] OnPlayerTakeTowerDamage')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local damage = keys.damage
end

-- A player picked a hero
function GameMode:OnPlayerPickHero(keys)
  DebugPrint('[BAREBONES] OnPlayerPickHero')
  DebugPrintTable(keys)



  local hero = EntIndexToHScript(keys.heroindex)
  local player = EntIndexToHScript(keys.player)
  local playerID = hero:GetPlayerID()
  local playerTeam = hero:GetTeamNumber()
  DebugPrint(hero:GetTeamNumber())
  local heroClass = keys.hero
  local heroEntity = EntIndexToHScript(keys.heroindex)

  local origin = hero:GetAbsOrigin() -- Spawn position
  local fv = hero:GetForwardVector() -- Vector the hero is facing we change it with Vector(0,0,0) that is the point of the center of the map, then
  -- we can do origin-fv y lo normalizamos con normalize:  v:Normalized() y luego de esto elegimos una distancia apropiada para poner el nuevo punto de inicio de las unidades, sin que estas se muevan.
  local distance = 300 
  local position = origin + fv * distance

  local building = CreateUnitByName("human_barracks", position, true, hero, hero, hero:GetTeamNumber())

  

  building:SetOwner(hero)
  building:SetControllableByPlayer(playerID, true)
  building:SetAbsOrigin(position)
  building:RemoveModifierByName("modifier_invulnerable")

  Timers:CreateTimer(function() building:SetAbsOrigin(position) end)

   gameTeams[playerTeam]["hero"] = hero
   gameTeams[playerTeam]["playerID"] = playerID
   gameTeams[playerTeam]["position"] = position

  
  if playerTeam == 2 then

    hero0 = hero
    playerID0 = playerID
    position0 = position
  end

  if playerTeam == 3 then

    hero1 = hero
    playerID1 = playerID
    position1 = position
  end

  if playerTeam == 6 then

    hero2 = hero
    playerID2 = playerID
    position2 = position
  end

  if playerTeam == 7 then

    hero3 = hero
    playerID3 = playerID
    position3 = position
  end

  if playerTeam == 8 then

    hero4 = hero
    playerID4 = playerID
    position4 = position
  end

  if playerTeam == 9 then

    hero5 = hero
    playerID5 = playerID
    position5 = position
  end

  if playerTeam == 10 then

    hero6 = hero
    playerID6 = playerID
    position6 = position
  end

  if playerTeam == 11 then

    hero7 = hero
    playerID7 = playerID
    position7 = position
  end

  if playerTeam == 12 then

    hero8 = hero
    playerID8 = playerID
    position8 = position
  end

  if playerTeam == 13 then

    hero9 = hero
    playerID9 = playerID
    position9 = position
  end

end

-- A player killed another player in a multi-team context
function GameMode:OnTeamKillCredit(keys)
  DebugPrint('[BAREBONES] OnTeamKillCredit')
  DebugPrintTable(keys)

  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local victimPlayer = PlayerResource:GetPlayer(keys.victim_userid)
  local numKills = keys.herokills
  local killerTeamNumber = keys.teamnumber
end

-- An entity died
function GameMode:OnEntityKilled( keys )
  DebugPrint( '[BAREBONES] OnEntityKilled Called' )
  DebugPrintTable( keys )

  GameMode:_OnEntityKilled( keys )
  

  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )



  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then

    killerEntity = EntIndexToHScript( keys.entindex_attacker )
    local teamKill = killerEntity:GetTeamNumber()
    local kills = gameTeams[teamKill]["kills"]+1
    DebugPrint(kills)
    gameTeams[teamKill]["kills"] = kills
    if kills % 100 == 0 then
      getUnitFromTableKills(teamKill,kills/100)
    end
  end
  
  

  -- The ability/item used to kill, or nil if not killed by an item/ability
  local killerAbility = nil

  if keys.entindex_inflictor ~= nil then
    killerAbility = EntIndexToHScript( keys.entindex_inflictor )
  end

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless

  -- Put code here to handle when an entity gets killed

  -- aca vamos a poner el codigo feo xD

  local team = killedUnit:GetTeamNumber()
--TODO esto lo dejo asi por ahora, pero creo que lo optimo seria transformar la logica de aca, y pedir que la unidad matada no pertenezca a la lista de unidades mercenarias(o, que sea igual a la lista de unidades de spawn)

	checkIfValueInArray(killedUnit, tableKills) then
		gameTeams[team]["cantidad"] = gameTeams[team]["cantidad"] -1
	end

  if team == 2 and killedUnit ~= hero0 then 
    cantidad0 = cantidad0-1

  elseif team == 3 and killedUnit ~= hero1 then 
    cantidad1 = cantidad1-1

  elseif team == 6 and killedUnit ~= hero2 then 
    cantidad2 = cantidad2-1
    
  elseif team == 7 and killedUnit ~= hero3 then 
    cantidad3 = cantidad3-1
    
  elseif team == 8 and killedUnit ~= hero4 then 
    cantidad4 = cantidad4-1
    
  elseif team == 9 and killedUnit ~= hero5 then 
    cantidad5 = cantidad5-1
    
  elseif team == 10 and killedUnit ~= hero6 then 
    cantidad6 = cantidad6-1
    
  elseif team == 11 and killedUnit ~= hero7 then 
    cantidad7 = cantidad7-1
    
  elseif team == 12 and killedUnit ~= hero8 then 
    cantidad8 = cantidad8-1
    
  elseif team == 13 and killedUnit ~= hero9 then 
    cantidad9 = cantidad9-1
      
  end

end



-- This function is called 1 to 2 times as the player connects initially but before they 
-- have completely connected
function GameMode:PlayerConnect(keys)
  DebugPrint('[BAREBONES] PlayerConnect')
  DebugPrintTable(keys)
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function GameMode:OnConnectFull(keys)
  DebugPrint('[BAREBONES] OnConnectFull')
  DebugPrintTable(keys)

  GameMode:_OnConnectFull(keys)
  
  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
end

-- This function is called whenever illusions are created and tells you which was/is the original entity
function GameMode:OnIllusionsCreated(keys)
  DebugPrint('[BAREBONES] OnIllusionsCreated')
  DebugPrintTable(keys)

  local originalEntity = EntIndexToHScript(keys.original_entindex)
end

-- This function is called whenever an item is combined to create a new item
function GameMode:OnItemCombined(keys)
  DebugPrint('[BAREBONES] OnItemCombined')
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end
  local player = PlayerResource:GetPlayer(plyID)

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
end

-- This function is called whenever an ability begins its PhaseStart phase (but before it is actually cast)
function GameMode:OnAbilityCastBegins(keys)
  DebugPrint('[BAREBONES] OnAbilityCastBegins')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityName = keys.abilityname
end

-- This function is called whenever a tower is killed
function GameMode:OnTowerKill(keys)
  DebugPrint('[BAREBONES] OnTowerKill')
  DebugPrintTable(keys)

  local gold = keys.gold
  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local team = keys.teamnumber
end

-- This function is called whenever a player changes there custom team selection during Game Setup 
function GameMode:OnPlayerSelectedCustomTeam(keys)
  DebugPrint('[BAREBONES] OnPlayerSelectedCustomTeam')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.player_id)
  local success = (keys.success == 1)
  local team = keys.team_id
end

-- This function is called whenever an NPC reaches its goal position/target
function GameMode:OnNPCGoalReached(keys)
  DebugPrint('[BAREBONES] OnNPCGoalReached')
  DebugPrintTable(keys)

  local goalEntity = EntIndexToHScript(keys.goal_entindex)
  local nextGoalEntity = EntIndexToHScript(keys.next_goal_entindex)
  local npc = EntIndexToHScript(keys.npc_entindex)
end

function getUnitFromTableKills(teamNumber, kills)
  DebugPrint('[BAREBONES] Debugs')
  DebugPrint(teamNumber)
  DebugPrint(kills)
  DebugPrintTable(gameTeams[teamNumber])
  DebugPrint(gameTeams[teamNumber]["unitSpawn"])
  DebugPrint(tableKills[kills])
  --busco en la tabla de kills cual le pertenece, la tabla va del 1 al X, siendo cada uno de esos numeros las kills/100, quizas los pueda repetir o lo que sea.
  --gameTeams[teamnumber]["unitSpawn"] = tableKills[kills]
  if kills < 10 then
    local newUnit = tableKills[kills]
    DebugPrint(kills)
    gameTeams[teamNumber]["unitSpawn"] = newUnit
    return newUnit
  end
  return false
end

function checkIfValueInArray(value, array)

	for _,v in pairs(items) do
	  if v == "orange" then
		return true
		break
	  end
	end
	return false

end
