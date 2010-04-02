#include <sourcemod>
#include <attributes>
#include <sdkhooks>
#include <colors>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.1"

new Handle:g_hCvarDmgMultiplier;
new Float:g_fDmgMultiplier;

new g_Strength[MAXPLAYERS+1];
new g_iStrengthID;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, Strength",
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
	// G A M E  C H E C K //
	decl String:game[32];
	GetGameFolderName(game, sizeof(game));
	if((StrEqual(game, "left4dead2") || StrEqual(game, "left4dead")))
	{
		SetFailState("This plugin is not for %s. Use attributes.strength.l4d2 instead.", game);
	}

	g_hCvarDmgMultiplier = CreateConVar("sm_att_strength_dmgmultiplier", "0.01", "Damage done grows by this multiplier every attribute point", FCVAR_PLUGIN, true, 0.0);
	HookConVarChange(g_hCvarDmgMultiplier, Cvar_Changed);


}

public OnAllPluginsLoaded() {
	if(LibraryExists("attributes")) {
		g_iStrengthID = att_RegisterAttribute("Strength", "Increases damage you deal", att_OnStrengthChange);
	}
}

public OnConfigsExecuted()
{
	g_fDmgMultiplier = GetConVarFloat(g_hCvarDmgMultiplier);
}

public Cvar_Changed(Handle:convar, const String:oldValue[], const String:newValue[]) {
	OnConfigsExecuted();
}

public OnPluginEnd()
{
	//att_UnregisterAttribute(g_iStrengthID);
	LogMessage("Did NOT unload Strength Attribute (%i)", g_iStrengthID);
}

public OnClientPutInServer(client)
{
	if(att_IsEnabled())
    	SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);
}

public att_OnStrengthChange(iClient, iValue, iAmount) {
	g_Strength[iClient] = iValue;

	if(iAmount != -1 && IsClientInGame(iClient))
	{
		CPrintToChat(iClient, "You are now dealing {green}%0.f%%{default} more damage.", g_Strength[iClient] * g_fDmgMultiplier * 100);
	}
}

public Action:OnTakeDamage(victim, &attacker, &inflictor, &Float:damage, &damagetype)
{
	if(attacker > 0 && attacker <= MaxClients && att_IsEnabled()) {
		new skillpoints = g_Strength[attacker];
		if(skillpoints > 0)
		{
			damage *= (1.0 + skillpoints * g_fDmgMultiplier);

			return Plugin_Changed;
		}
	}
	return Plugin_Continue;
}