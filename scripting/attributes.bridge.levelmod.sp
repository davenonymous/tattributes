#include <sourcemod>
#include <sdktools>
#include <attributes>
#include <levelmod>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

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

public lm_OnClientLevelUp(client, level)
{
	att_addClientAvailablePoints(client, 1);
}