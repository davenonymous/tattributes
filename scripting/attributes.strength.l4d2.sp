#include <sourcemod>
#include <attributes>
#include <colors>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

#define TEAM_SURVIVORS 2
#define TEAM_INFECTED 3

new Handle:g_hCvarDmgMultiplier;
new Float:g_fDmgMultiplier;

new g_Strength[MAXPLAYERS+1];
new g_iStrengthID;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, Strength for L4D(2)",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, Strength, increases damage done (for L4D(2)).",
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
		SetFailState("This plugin is not for %s. Use attributes.strength instead.", game);
	}

	g_hCvarDmgMultiplier = CreateConVar("sm_att_strength_dmgmultiplier", "0.01", "Damage done grows by this multiplier every attribute point", FCVAR_PLUGIN, true, 0.0);
	HookConVarChange(g_hCvarDmgMultiplier, Cvar_Changed);

	HookEvent("player_hurt", Event_PlayerHurt);
	HookEvent("infected_hurt", Event_InfectedHurt);
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

public att_OnStrengthChange(iClient, iValue, iAmount) {
	g_Strength[iClient] = iValue;

	if(iAmount != -1 && IsClientInGame(iClient))
	{
		CPrintToChat(iClient, "You are now dealing {green}%0.f%%{default} more damage.", g_Strength[iClient] * g_fDmgMultiplier * 100);
	}
}

public Action:Event_PlayerHurt(Handle:event, String:event_name[], bool:dontBroadcast)
{
	if(att_IsEnabled())
	{
		new hurted = GetClientOfUserId(GetEventInt(event, "userid"));
		new attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
		new damage = GetEventInt(event, "dmg_health");

		if(attacker > 0 && attacker <= MaxClients && !IsFakeClient(attacker))
		{
			new skillpoints = g_Strength[attacker];
			if(skillpoints > 0)
			{
				new extraDamage = RoundFloat((damage * (1.0 + skillpoints * g_fDmgMultiplier))-damage);
				new health = GetEntProp(hurted, Prop_Data, "m_iHealth");
				SetEntProp(hurted, Prop_Data, "m_iHealth", health-extraDamage);
			}
		}
	}
}

public Action:Event_InfectedHurt(Handle:event, const String:name[], bool:dontBroadcast)
{
	if(att_IsEnabled())
	{
		new hurted = GetClientOfUserId(GetEventInt(event, "entityid"));
		new attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
		new damage = GetEventInt(event, "amount");

		if(GetClientTeam(attacker) == TEAM_SURVIVORS && attacker > 0 && attacker <= MaxClients)
		{
			new skillpoints = g_Strength[attacker];
			if(skillpoints > 0)
			{
				new extraDamage = RoundFloat((damage * (1.0 + skillpoints * g_fDmgMultiplier))-damage);
				new health = GetEntProp(hurted, Prop_Data, "m_iHealth");
				SetEntProp(hurted, Prop_Data, "m_iHealth", health-extraDamage);
			}
		}
	}
}