#include <sourcemod>
#include <attributes>
#include <sdkhooks>
#include <colors>
#include <tf2_advanced>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

new g_Lifeforce[MAXPLAYERS+1];
new g_iLifeforceID;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, Lifeforce",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, Lifeforce, increases maximum health.",
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

	g_iLifeforceID = att_RegisterAttribute("Lifeforce", "Increases health", att_OnLifeforceChange);
}

//////////////////////////
//E V E N T   H O O K S //
//////////////////////////
public EventInventoryApplication(Handle:hEvent, String:strName[], bool:bDontBroadcast)
{
	if(att_IsEnabled())
	{
		new client = GetClientOfUserId(GetEventInt(hEvent, "userid"));

		CreateTimer(0.2, Timer_ApplyEffects, client);
	}
}

public Action:Timer_ApplyEffects(Handle:timer, any:client) {
	applyClassHealth(client);
}

public Event_Player_Spawn(Handle:event, const String:name[], bool:dontBroadcast)
{
	if(att_IsEnabled())
	{
		new client = GetClientOfUserId(GetEventInt(event, "userid"));
		applyClassHealth(client);
	}
}

public OnPluginEnd()
{
	att_UnregisterAttribute(g_iLifeforceID);
}

public att_OnLifeforceChange(iClient, iValue, iAmount) {
	g_Lifeforce[iClient] = iValue;
	applyClassHealth(iClient);
	if(iAmount != -1)
	{
		CPrintToChat(iClient, "You start with {green}%i{default} additional healthpoints.", g_Lifeforce[iClient] * 3);
	}
}

stock applyClassHealth(client) {
	new iHealth = 200 + g_Lifeforce[client] * 3;
	new iCurrentDiff = GetEntProp(client, Prop_Data, "m_iMaxHealth") - GetClientHealth(client);

	SetEntProp(client, Prop_Data, "m_iMaxHealth", iHealth);

	SetEntityHealth(client, iHealth-iCurrentDiff);
}