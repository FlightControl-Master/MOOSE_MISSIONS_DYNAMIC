
local FollowGroupSet = SET_GROUP:New():FilterCategories( { "helicopter" } ):FilterCoalitions( "blue" ):FilterPrefixes( { "Escort" } ):FilterStart()

local LeaderUnit = UNIT:FindByName( "Leader" )
local Escort = AI_ESCORT:New( LeaderUnit, FollowGroupSet, "Escort Attack", "Briefing" )
Escort:FormationTrail( 100, 100 , 0 )
Escort:MenusHelicopters()
Escort:__Start( 5 )

