---
-- Name: AID-A2A-030 - CAP RTB and ReEngage
-- Author: FlightControl
-- Date Created: 30 May 2017


-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "DF CCCP AWACS", "DF CCCP EWR" } )
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )
--Detection:BoundDetectedZones()

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher:SetEngageRadius( 200000 )

A2ADispatcher:SetDisengageRadius( 200000 )

A2ADispatcher:SetTacticalDisplay( true )


-- Setup the squadrons.

A2ADispatcher:SetSquadron( "Kras1", AIRBASE.Caucasus.Krasnodar_Pashkovsky, { "SQ CCCP SU-27" }, 20 )
CAPZoneWest = ZONE_POLYGON:New( "CAP Zone West", GROUP:FindByName( "CAP Zone West" ) )
A2ADispatcher:SetSquadronCap( "Kras1", 800, 1200, 4000, 8000, CAPZoneWest, 600, 800, 4000, 8000, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "Kras1", 4, 30, 120, 1 )

A2ADispatcher:SetSquadron( "May", AIRBASE.Caucasus.Maykop_Khanskaya, { "SQ CCCP SU-27" }, 20 )
CAPZoneWest = ZONE_POLYGON:New( "CAP Zone West", GROUP:FindByName( "CAP Zone West" ) )
A2ADispatcher:SetSquadronCapV2( "May", 800, 1200, 400, 500, "RADIO", CAPZoneWest, 600, 800, 4000, 8000, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "May", 1, 30, 120, 1 )

A2ADispatcher:SetDefaultTakeoffInAir()
A2ADispatcher:SetDefaultLandingNearAirbase()

-- Blue attack simulation

local Frequency = 150

BlueSpawn2 = SPAWN
  :New( "RT NATO 2" )
  :InitLimit( 6, 40 )
  :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
  :InitRandomizeRoute( 0, 0, 30000 )
  :InitDelayOn()
  :SpawnScheduled( Frequency, 0.5 )

