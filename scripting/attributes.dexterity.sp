#include <sourcemod>
#include <attributes>
#include <sdkhooks>
#include <colors>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

new Handle:g_hCvarSpeedMultiplier;

new g_Dexterity[MAXPLAYERS+1];
new g_iDexterityID;

new Float:g_fSpeedMultiplier;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, Dexterity for L4D2",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, Dexterity for L4D2, increases running speed.",
	version = PLUGIN_VERSION,
	url = "http://thrawn.de"
}


//////////////////////////
//P L U G I N  S T A R T//
//////////////////////////
public OnPluginStart()
{
	// G A M E  C H E C K //
	decl String:game[32];
	GetGameFolderName(game, sizeof(game));
	if((StrEqual(game, "tf")))
	{
		SetFailState("This plugin is not for %s", game);
	}

	g_hCvarSpeedMultiplier = CreateConVar("sm_att_dexterity_speedmultiplier", "0.02", "Speed grows by this multiplier every attribute point", FCVAR_PLUGIN, true, 0.0);
	HookConVarChange(g_hCvarSpeedMultiplier, Cvar_Changed);

	HookEvent("player_spawn", Event_Player_Spawn);

	g_iDexterityID = att_RegisterAttribute("Dexterity", "Increases running speed", att_OnDexterityChange);
}

public OnConfigsExecuted()
{
	g_fSpeedMultiplier = GetConVarFloat(g_hCvarSpeedMultiplier);
}

public Cvar_Changed(Handle:convar, const String:oldValue[], const String:newValue[]) {
	OnConfigsExecuted();
}


//////////////////////////
//E V E N T   H O O K S //
//////////////////////////


public Event_Player_Spawn(Handle:event, const String:name[], bool:dontBroadcast)
{
	if(att_IsEnabled())
	{
		new client = GetClientOfUserId(GetEventInt(event, "userid"));
		applyClassSpeed(client);
	}
}

public OnPluginEnd()
{
	att_UnregisterAttribute(g_iDexterityID);
}

public att_OnDexterityChange(iClient, iValue, iAmount) {
	g_Dexterity[iClient] = iValue;
	applyClassSpeed(iClient);
	if(iAmount != -1)
	{
		CPrintToChat(iClient, "You are now running {green}%i{default} faster.", g_Dexterity[iClient] * g_fSpeedMultiplier * 100);
	}
}

stock applyClassSpeed(client) {
	SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", 1.0 + g_Dexterity[client] * g_fSpeedMultiplier);
}