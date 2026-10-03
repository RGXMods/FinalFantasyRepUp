--=====================================================================================
-- FFRU | Final Fantasy Rep Up! - core.lua
-- Version: 2.0.0
-- Author: DonnieDice
-- RGX Mods Collection - RealmGX Community Project
--=====================================================================================

local RGX = assert(_G.RGXFramework, "FFRU: RGX-Framework not loaded")

FFRU = FFRU or {}

local ADDON_VERSION = "2.0.1"
local ADDON_NAME = "FinalFantasyRepUp"
local PREFIX = "|Tinterface/addons/FinalFantasyRepUp/media/icon:16:16|t - |cffffffff[|r|cff3bbc00FFRU|r|cffffffff]|r "
local TITLE = "|Tinterface/addons/FinalFantasyRepUp/media/icon:18:18|t [|cff3bbc00F|r|cffffffffinal|r |cff3bbc00F|r|cffffffffantasy|r |cff3bbc00R|r|cffffffffep|r |cff3bbc00U|r|cffffffffp!|r]"
local DEFAULT_REP_SOUND_ID = 568016

FFRU.version = ADDON_VERSION
FFRU.addonName = ADDON_NAME

local Sound = RGX:GetSound()

local handle = Sound:Register(ADDON_NAME, {
sounds = {
high = "Interface\\Addons\\FinalFantasyRepUp\\sounds\\final_fantasy_rep_high.ogg",
medium = "Interface\\Addons\\FinalFantasyRepUp\\sounds\\final_fantasy_rep_med.ogg",
low = "Interface\\Addons\\FinalFantasyRepUp\\sounds\\final_fantasy_rep_low.ogg",
},
defaultSoundId = DEFAULT_REP_SOUND_ID,
savedVar = "FFRUSettings",
defaults = {
enabled = true,
soundVariant = "medium",
muteDefault = true,
showWelcome = true,
volume = "Master",
firstRun = true,
},
triggerEvent = "UPDATE_FACTION",
addonVersion = ADDON_VERSION,
})

FFRU.handle = handle

local L = FFRU.L or {}
local trackedFactions = {}
local initialized = false

local function ShowHelp()
print(PREFIX .. " " .. (L["HELP_HEADER"] or ""))
print(PREFIX .. " " .. (L["HELP_TEST"] or ""))
print(PREFIX .. " " .. (L["HELP_ENABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_DISABLE"] or ""))
print(PREFIX .. " |cffffffff/ffru high|r - " .. (L["SOUND_HIGH"] or ""))
print(PREFIX .. " |cffffffff/ffru med|r - " .. (L["SOUND_MEDIUM"] or ""))
print(PREFIX .. " |cffffffff/ffru low|r - " .. (L["SOUND_LOW"] or ""))
end

local function HandleSlashCommand(args)
local command = string.lower(args or "")
if command == "" or command == "help" then
ShowHelp()
elseif command == "test" then
print(PREFIX .. " " .. (L["PLAYING_TEST"] or ""))
handle:Test()
elseif command == "enable" then
handle:Enable()
print(PREFIX .. " " .. (L["ADDON_ENABLED"] or ""))
elseif command == "disable" then
handle:Disable()
print(PREFIX .. " " .. (L["ADDON_DISABLED"] or ""))
elseif command == "high" then
handle:SetVariant("high")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "high"))
elseif command == "med" or command == "medium" then
handle:SetVariant("medium")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "medium"))
elseif command == "low" then
handle:SetVariant("low")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "low"))
else
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. (L["ERROR_UNKNOWN_COMMAND"] or ""))
end
end

local function CheckFactionStanding()
if not handle:IsEnabled() then return end
for i = 1, GetNumFactions() do
local _, _, newStanding, _, _, _, _, _, isHeader, _, hasRep, _, _, faction = GetFactionInfo(i)
if faction and (not isHeader or hasRep) and (newStanding or 0) > 0 then
local oldStanding = trackedFactions[faction]
if oldStanding and oldStanding < newStanding then
handle:Play()
end
trackedFactions[faction] = newStanding
end
end
end

RGX:RegisterEvent("ADDON_LOADED", function(event, addonName)
if addonName ~= ADDON_NAME then return end
handle:SetLocale(FFRU.L)
L = FFRU.L or {}
handle:Init()
initialized = true
end, "FFRU_ADDON_LOADED")

RGX:RegisterEvent("UPDATE_FACTION", function()
if initialized then
CheckFactionStanding()
end
end, "FFRU_UPDATE_FACTION")

RGX:RegisterEvent("QUEST_LOG_UPDATE", function()
if initialized then
CheckFactionStanding()
end
end, "FFRU_QUEST_LOG_UPDATE")

RGX:RegisterEvent("PLAYER_LOGIN", function()
if not initialized then
handle:SetLocale(FFRU.L)
L = FFRU.L or {}
handle:Init()
initialized = true
end
CheckFactionStanding()
handle:ShowWelcome(PREFIX, TITLE)
end, "FFRU_PLAYER_LOGIN")

RGX:RegisterEvent("PLAYER_LOGOUT", function()
handle:Logout()
end, "FFRU_PLAYER_LOGOUT")

RGX:RegisterSlashCommand("ffru", function(msg)
local ok, err = pcall(HandleSlashCommand, msg)
if not ok then
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "|cffff0000FFRU Error:|r") .. " " .. tostring(err))
end
end, "FFRU_SLASH")
