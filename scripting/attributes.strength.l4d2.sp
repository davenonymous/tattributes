#include <sourcemod>
#include <attributes>
#include <sdkhooks>
#include <colors>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

new g_Strength[MAXPLAYERS+1];
new g_iStrengthID;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, Strength (works on L4D(2) Infected)",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, Strength, increases damage done (uses SDKHooks).",
	version = PLUGIN_VERSION,
	url = "http://thrawn.de"
}

//////////////////////////
//P L U G I N  S T A R T//
//////////////////////////
public OnPluginStart()
{
	g_iStrengthID = att_RegisterAttribute("Strength", "Increases damage you deal", att_OnStrengthChange);
}

public OnPluginEnd()
{
	att_UnregisterAttribute(g_iStrengthID);
}

public OnClientPutInServer(client)
{
    SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);
}

public att_OnStrengthChange(iClient, iValue, iAmount) {
	g_Strength[iClient] = iValue;

	if(iAmount != -1)
	{
		CPrintToChat(iClient, "You are now dealing {green}%i\%{default} more damage.", g_Strength[iClient] * 2);
	}
}

public Action:OnTakeDamage(victim, &attacker, &inflictor, &Float:damage, &damagetype)
{
	new skillpoints = g_Strength[attacker];
	if(skillpoints > 0)
	{
		damage *= (1.0 + skillpoints * 0.02);

		return Plugin_Changed;
	}

	return Plugin_Continue;
}