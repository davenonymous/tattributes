#include <sourcemod>
#include <sdktools>
#include <attributes>
#include <colors>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

new Handle:g_hCvarDeathMessage;
new bool:g_bDeathMessage;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, ChatMessages",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, displaying various informations via chat.",
	version = PLUGIN_VERSION,
	url = "http://thrawn.de"
}

//////////////////////////
//P L U G I N  S T A R T//
//////////////////////////
public OnPluginStart()
{
	g_hCvarDeathMessage = CreateConVar("sm_lm_deathmessage", "1", "Show who killed you with which level on death", FCVAR_PLUGIN, true, 0.0, true, 1.0);
	HookConVarChange(g_hCvarDeathMessage, Cvar_Changed);

	HookEvent("player_death", Event_Player_Death);
}

public OnConfigsExecuted()
{
	g_bDeathMessage = GetConVarBool(g_hCvarDeathMessage);
}

public Cvar_Changed(Handle:convar, const String:oldValue[], const String:newValue[]) {
	OnConfigsExecuted();
}


//////////////////////////
//E V E N T   H O O K S //
//////////////////////////
public Event_Player_Death(Handle:event, const String:name[], bool:dontBroadcast)
{
	if(att_IsEnabled())
	{
		//new attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
		new victim = GetClientOfUserId(GetEventInt(event, "userid"));

		if(g_bDeathMessage) {
			if(att_GetClientAvailablePoints(victim) > 0) {
				CPrintToChat(victim, "You have {green}%i{default} available attribute points. Type {green}!att{default} to use them.", att_GetClientAvailablePoints(victim));
			}
		}
	}
}

public att_OnClientAttributeChange(iClient, iAttributeId, iValue, iAmount) {
	if(att_IsEnabled() && IsClientInGame(iClient))
	{
		if(iAmount == -1)
			CPrintToChat(iClient, "Your attribute points have been loaded.");
	}
}