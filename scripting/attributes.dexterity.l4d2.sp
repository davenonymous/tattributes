#include <sourcemod>
#include <attributes>
#include <sdkhooks>
#include <colors>
#include <tf2_advanced>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

new g_Dexterity[MAXPLAYERS+1];
new g_iDexterityID;

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
	if(!(StrEqual(game, "left4dead2")))
	{
		SetFailState("This plugin is not for %s", game);
	}

	g_iDexterityID = att_RegisterAttribute("Dexterity", "Increases running speed", att_OnDexterityChange);
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
		CPrintToChat(iClient, "You are now running {green}%i{default} faster.", g_Dexterity[iClient] * 2);
	}
}

stock applyClassSpeed(client) {
	SetEntPropFloat(client, Prop_Data, "m_flLaggedMovementValue", 1.0 + g_Dexterity[client] * 0.02);
}