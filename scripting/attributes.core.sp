#include <sourcemod>
#include <sdktools>
#include <colors>

#pragma semicolon 1

#define PLUGIN_VERSION "0.1.2"

new g_playerStrength[MAXPLAYERS+1];
new g_playerDexterity[MAXPLAYERS+1];
new g_playerHealth[MAXPLAYERS+1];

new Handle:g_hCvarEnable;
new bool:g_bEnabled;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "Attributes Core",
	author = "Thrawn",
	description = "A RPG-like attribute core to be used by other plugins",
	version = PLUGIN_VERSION,
	url = "http://thrawn.de"
}

//////////////////////////
//P L U G I N  S T A R T//
//////////////////////////
public OnPluginStart()
{
	// V E R S I O N    C V A R //
	CreateConVar("sm_att_version", PLUGIN_VERSION, "Version of the plugin", FCVAR_PLUGIN|FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY);

	// C O N V A R S //
	g_hCvarEnable = CreateConVar("sm_lm_enabled", "1", "Enables the plugin", FCVAR_PLUGIN, true, 0.0, true, 1.0);

	HookConVarChange(g_hCvarEnable, Cvar_Changed);
}

public OnConfigsExecuted()
{
	g_bEnabled = GetConVarBool(g_hCvarEnable);
}

public Cvar_Changed(Handle:convar, const String:oldValue[], const String:newValue[]) {
	OnConfigsExecuted();
}


//////////////////////////////////
//C L I E N T  C O N N E C T E D//
//////////////////////////////////
public OnClientPutInServer(client)
{
	if(g_bEnabled)
	{
	}
}

///////////////////////
//D I S C O N N E C T//
///////////////////////
public OnClientDisconnect(client)
{
	if(g_bEnabled)
	{
	}
}

/////////////////
//N A T I V E S//
/////////////////
#if SOURCEMOD_V_MAJOR >= 1 && SOURCEMOD_V_MINOR >= 3
	public APLRes:AskPluginLoad2(Handle:myself, bool:late, String:error[], err_max)
#else
	public bool:AskPluginLoad(Handle:myself, bool:late, String:error[], err_max)
#endif
{
	RegPluginLibrary("attributes");

	CreateNative("att_SetClientStrength", Native_SetClientStrength);

	#if SOURCEMOD_V_MAJOR >= 1 && SOURCEMOD_V_MINOR >= 3
		return APLRes_Success;
	#else
		return true;
	#endif
}

//lm_setClientStrength(iClient, iStrength);
public Native_SetClientStrength(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);
	new iStrength = GetNativeCell(2);

	//setClientStrength(iClient, iStrength);
}