#include <sourcemod>
#include <attributes>
#include <sdkhooks>
#include <colors>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

new Handle:g_hCvarCritMultiplier;
new Float:g_fCritMultiplier;

new g_Critical[MAXPLAYERS+1];
new g_iCriticalID;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, Critical",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, Critical, sets crit chances based on attribute level.",
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
	if((StrEqual(game, "left4dead2") || StrEqual(game, "left4dead")))
	{
		SetFailState("This plugin is not for %s. Use attributes.strength.l4d2 instead.", game);
	}

	g_hCvarCritMultiplier = CreateConVar("sm_att_critical_critmultiplier", "0.01", "Chance to deal critical damage grows by this multiplier every attribute point", FCVAR_PLUGIN, true, 0.0);
	HookConVarChange(g_hCvarCritMultiplier, Cvar_Changed);
}

public OnAllPluginsLoaded() {
	if(LibraryExists("attributes")) {
		g_iCriticalID = att_RegisterAttribute("CritChance", "Increases chance to deal critical damage", att_OnCriticalChange);
	}
}

public OnConfigsExecuted()
{
	g_fCritMultiplier = GetConVarFloat(g_hCvarCritMultiplier);
}

public Cvar_Changed(Handle:convar, const String:oldValue[], const String:newValue[]) {
	OnConfigsExecuted();
}

public OnPluginEnd()
{
	//att_UnregisterAttribute(g_iCriticalID);
	LogMessage("Did NOT unload Critical Attribute (%i)", g_iCriticalID);
}

public att_OnCriticalChange(iClient, iValue, iAmount) {
	g_Critical[iClient] = iValue;

	if(iAmount != -1 && IsClientInGame(iClient))
	{
		CPrintToChat(iClient, "You now have a {green}%0.f%%{default} chance of dealing critical damage.", g_Critical[iClient] * g_fCritMultiplier * 100);
	}
}

public Action:TF2_CalcIsAttackCritical(client, weapon, String:weaponname[], &bool:result)
{
	if(att_IsEnabled()) {
		new skillpoints = g_Critical[client];

		if (skillpoints * g_fCritMultiplier > GetRandomFloat(0.0, 1.0))
		{
			result = true;
			return Plugin_Handled;
		}

		result = false;
	}

	return Plugin_Handled;
}