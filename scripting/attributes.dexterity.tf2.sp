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
	name = "tAttributes Mod, Dexterity for TF2",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, Dexterity for TF2, increases running speed.",
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
	if(!(StrEqual(game, "tf")))
	{
		SetFailState("This plugin is not for %s", game);
	}

	g_iDexterityID = att_RegisterAttribute("Dexterity", "Increases running speed", att_OnDexterityChange);
}

public OnClientPutInServer(client)
{
    SDKHook(client, SDKHook_WeaponSwitch, OnWeaponSwitch);
}

public Action:OnWeaponSwitch(client, weapon)
{
	CreateTimer(0.1, Timer_ClassSpeed, client);

	return Plugin_Continue;
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

public Action:Timer_ClassSpeed(Handle:timer, any:client) {
	applyClassSpeed(client);
}

public Action:Timer_ApplyEffects(Handle:timer, any:client) {
	applyClassSpeed(client);
}

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
	SetEntPropFloat(client, Prop_Send, "m_flMaxspeed", TF2_GetPlayerClassSpeed(client) * (1.0 + g_Dexterity[client] * 0.02));
}