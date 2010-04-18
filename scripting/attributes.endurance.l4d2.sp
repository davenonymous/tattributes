#include <sourcemod>
#include <attributes>
#include <colors>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

#define TEAM_SURVIVORS 2
#define TEAM_INFECTED 3

new Handle:g_hCvarDmgMultiplier;
new Float:g_fDmgMultiplier;

new g_Endurance[MAXPLAYERS+1];
new g_iEnduranceID;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, Endurance for L4D(2)",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, Endurance, reduces damage taken (for L4D(2)).",
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
	if(!StrEqual(game, "left4dead2") && !StrEqual(game, "left4dead"))
	{
		SetFailState("This plugin is not for %s. Use attributes.endurance instead.", game);
	}

	g_hCvarDmgMultiplier = CreateConVar("sm_att_endurance_dmgmultiplier", "0.02", "Damage received is reduced by this multiplier every attribute point", FCVAR_PLUGIN, true, 0.0);
	HookConVarChange(g_hCvarDmgMultiplier, Cvar_Changed);

	HookEvent("player_hurt", Event_PlayerHurt);
}

public OnAllPluginsLoaded() {
	if(LibraryExists("attributes")) {
		g_iEnduranceID = att_RegisterAttribute("Endurance", "Reduces damage you take", att_OnEnduranceChange);
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
	//att_UnregisterAttribute(g_iEnduranceID);
	LogMessage("Did NOT unload Endurance Attribute (%i)", g_iEnduranceID);
}

public att_OnEnduranceChange(iClient, iValue, iAmount) {
	g_Endurance[iClient] = iValue;

	if(iAmount != -1 && IsClientInGame(iClient))
	{
		CPrintToChat(iClient, "You are now taking {green}%0.f%%{default} less damage.", g_Endurance[iClient] * g_fDmgMultiplier * 100);
	}
}

public Action:Event_PlayerHurt(Handle:event, String:event_name[], bool:dontBroadcast)
{
	if(att_IsEnabled())
	{
		new hurted = GetClientOfUserId(GetEventInt(event, "userid"));
		new damage = GetEventInt(event, "dmg_health");

		if(hurted > 0 && hurted <= MaxClients && !IsFakeClient(hurted))
		{
			new skillpoints = g_Endurance[hurted];
			if(skillpoints > 0)
			{
				new extraHealth = RoundFloat(damage * skillpoints * g_fDmgMultiplier);
				new health  = GetEventInt(event, "health");
				SetEntProp(hurted, Prop_Data, "m_iHealth", health+extraHealth);
			}
		}
	}
}