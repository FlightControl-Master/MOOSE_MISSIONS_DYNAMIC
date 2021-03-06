---
-- Name: AIC-APC-004 - APC Pickup
-- Author: FlightControl
-- Date Created: 23 Apr 2018
-- Date Checked: 01 Jan 2021, working example, changed Deploy to async call

BASE:TraceClass("AI_CARGO_APC")
BASE:TraceOn()

local InfantryCargoSet = SET_CARGO:New():FilterTypes( "Infantry" ):FilterStart()
local APC = GROUP:FindByName( "APC" )
Cargo_APC = AI_CARGO_APC:New( APC, InfantryCargoSet, 350 )
Cargo_APC:__Pickup( 1, ZONE:New( "Pickup" ):GetCoordinate() )



--- Loaded Handler OnAfter for Cargo_APC
-- @function [parent=#Cargo_APC] OnAfterLoaded
-- @param #Cargo_APC self
-- @param Wrapper.Group#GROUP APC
-- @param #string From
-- @param #string Event
-- @param #string To
function Cargo_APC:OnAfterLoaded( APC, From, Event, To )
  Cargo_APC:__Deploy( 1, ZONE:New( "Deploy" ):GetCoordinate() )
end



