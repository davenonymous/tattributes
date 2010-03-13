#include <sourcemod>
#include <sdktools>
#include <attributes>
#include <levelmod>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

new Handle:g_hCvarReapplyPoints;
new bool:g_bReapplyPoints;
new bool:g_bPointsReapplied[MAXPLAYERS+1] = {false, ...};

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes, use Leveling Mod",
	author = "Thrawn",
	description = "A plugin for tAttributes, giving attribute points via Leveling Mod.",
	version = PLUGIN_VERSION,
	url = "http://thrawn.de"
}

public OnPluginStart()
{
	g_hCvarReapplyPoints = CreateConVar("sm_att_lm_reapplypoints", "1", "Reapply points based on levelmod level. ONLY USE if you are not saving attribute points via a seperate plugin.", FCVAR_PLUGIN, true, 0.0, true, 1.0);
	HookConVarChange(g_hCvarReapplyPoints, Cvar_Changed);

	HookEvent("player_spawn", Event_Player_Spawn);
}

public OnConfigsExecuted()
{
	g_bReapplyPoints = GetConVarBool(g_hCvarReapplyPoints);
}

public Cvar_Changed(Handle:convar, const String:oldValue[], const String:newValue[]) {
	OnConfigsExecuted();
}

public OnClientDisconnect(client) {
	g_bPointsReapplied[client] = false;
}

public Event_Player_Spawn(Handle:event, const String:name[], bool:dontBroadcast) {
	if(g_bReapplyPoints) {
		new client = GetClientOfUserId(GetEventInt(event, "userid"));
		if(!g_bPointsReapplied[client]) {
			att_addClientAvailablePoints(client, lm_GetClientLevel(client));
			g_bPointsReapplied[client] = true;
		}
	}
}

public lm_OnClientLevelUp(client, level, amount)
{
	att_addClientAvailablePoints(client, amount);
}