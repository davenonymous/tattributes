#include <sourcemod>
#include <sdktools>
#include <colors>
#include <attributes>

#pragma semicolon 1

#define PLUGIN_VERSION 		"0.1.0"
#define MAXSKILLLEVEL 		10

new Handle:g_hForwardStrengthUp;
new Handle:g_hForwardStaminaUp;
new Handle:g_hForwardDexterityUp;

new g_iPlayerStrength[MAXPLAYERS+1];
new g_iPlayerDexterity[MAXPLAYERS+1];
new g_iPlayerStamina[MAXPLAYERS+1];
new g_iPlayerAvailablePoints[MAXPLAYERS+1];

new Handle:g_hCvarEnable;
new bool:g_bEnabled;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Core",
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
	g_hCvarEnable = CreateConVar("sm_att_enabled", "1", "Enables the plugin", FCVAR_PLUGIN, true, 0.0, true, 1.0);

	HookConVarChange(g_hCvarEnable, Cvar_Changed);

	g_hForwardStrengthUp = CreateGlobalForward("att_OnClientStrengthChange", ET_Ignore, Param_Cell, Param_Cell, Param_Cell);
	g_hForwardStaminaUp = CreateGlobalForward("att_OnClientStaminaChange", ET_Ignore, Param_Cell, Param_Cell, Param_Cell);
	g_hForwardDexterityUp = CreateGlobalForward("att_OnClientDexterityChange", ET_Ignore, Param_Cell, Param_Cell, Param_Cell);
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
public OnClientConnected(iClient)
{
	if(g_bEnabled)
	{
		g_iPlayerStrength[iClient] = 0;
		g_iPlayerDexterity[iClient] = 0;
		g_iPlayerStamina[iClient] = 0;
		g_iPlayerAvailablePoints[iClient] = 0;
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


//////////
//Stocks//
//////////
stock setPlayerStrength(iClient, iStrength) {
	if(iStrength > MAXSKILLLEVEL)
		iStrength = MAXSKILLLEVEL;

	g_iPlayerStrength[iClient] = iStrength;
}

stock setPlayerDexterity(iClient, iDexterity) {
	if(iDexterity > MAXSKILLLEVEL)
		iDexterity = MAXSKILLLEVEL;

	g_iPlayerDexterity[iClient] = iDexterity;
}

stock setPlayerStamina(iClient, iStamina) {
	if(iStamina > MAXSKILLLEVEL)
		iStamina = MAXSKILLLEVEL;

	g_iPlayerStamina[iClient] = iStamina;
}

stock setPlayerAvailablePoints(iClient, iPoints) {
	if(iPoints > MAXSKILLLEVEL*3)
		iPoints = MAXSKILLLEVEL*3;

	g_iPlayerAvailablePoints[iClient] = iPoints;
}

stock attChooseResult:ChooseStrength(iClient) {
	if(g_iPlayerAvailablePoints[iClient] <= 0)
		return att_NoAvailablePoints;

	if(g_iPlayerStrength[iClient] >= MAXSKILLLEVEL)
		return att_MaxSkillLevelReached;

	g_iPlayerAvailablePoints[iClient]--;
	g_iPlayerStrength[iClient]++;
	Forward_StrengthChange(iClient, g_iPlayerStrength[iClient], 1);

	return att_OK;
}

stock attChooseResult:ChooseStamina(iClient) {
	if(g_iPlayerAvailablePoints[iClient] <= 0)
		return att_NoAvailablePoints;

	if(g_iPlayerStamina[iClient] >= MAXSKILLLEVEL)
		return att_MaxSkillLevelReached;

	g_iPlayerAvailablePoints[iClient]--;
	g_iPlayerStamina[iClient]++;
	Forward_StaminaChange(iClient, g_iPlayerStamina[iClient], 1);

	return att_OK;
}

stock attChooseResult:ChooseDexterity(iClient) {
	if(g_iPlayerAvailablePoints[iClient] <= 0)
		return att_NoAvailablePoints;

	if(g_iPlayerDexterity[iClient] >= MAXSKILLLEVEL)
		return att_MaxSkillLevelReached;

	g_iPlayerAvailablePoints[iClient]--;
	g_iPlayerDexterity[iClient]++;
	Forward_DexterityChange(iClient, g_iPlayerDexterity[iClient], 1);

	return att_OK;
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

	CreateNative("att_IsEnabled", Native_GetEnabled);

	CreateNative("att_setClientStrength", Native_SetClientStrength);
	CreateNative("att_setClientStamina", Native_SetClientStamina);
	CreateNative("att_setClientDexterity", Native_SetClientDexterity);
	CreateNative("att_setClientAvailablePoints", Native_SetClientAvailablePoints);
	CreateNative("att_addClientAvailablePoints", Native_AddClientAvailablePoints);
	CreateNative("att_getClientStrength", Native_GetClientStrength);
	CreateNative("att_getClientStamina", Native_GetClientStamina);
	CreateNative("att_getClientDexterity", Native_GetClientDexterity);
	CreateNative("att_getClientAvailablePoints", Native_GetClientAvailablePoints);
	CreateNative("att_chooseStrength", Native_ChooseStrength);
	CreateNative("att_chooseStamina", Native_ChooseStamina);
	CreateNative("att_chooseDexterity", Native_ChooseDexterity);

	#if SOURCEMOD_V_MAJOR >= 1 && SOURCEMOD_V_MINOR >= 3
		return APLRes_Success;
	#else
		return true;
	#endif
}

//att_IsEnabled();
public Native_GetEnabled(Handle:hPlugin, iNumParams)
{
	return g_bEnabled;
}

//lm_chooseStrength(iClient);
public Native_ChooseStrength(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);

	return ChooseStrength(iClient);
}

//lm_chooseDexterity(iClient);
public Native_ChooseDexterity(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);

	return ChooseDexterity(iClient);
}

//lm_chooseStamina(iClient);
public Native_ChooseStamina(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);

	return ChooseStamina(iClient);
}

//lm_setClientStrength(iClient, iStrength);
public Native_SetClientStrength(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);
	new iStrength = GetNativeCell(2);

	setPlayerStrength(iClient, iStrength);
}

//lm_setClientStamina(iClient, iStamina);
public Native_SetClientStamina(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);
	new iStamina = GetNativeCell(2);

	setPlayerStamina(iClient, iStamina);
}

//lm_setClientDexterity(iClient, iDexterity);
public Native_SetClientDexterity(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);
	new iDexterity = GetNativeCell(2);

	setPlayerDexterity(iClient, iDexterity);
}

//lm_setPlayerAvailablePoints(iClient, iPoints);
public Native_SetClientAvailablePoints(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);
	new iPoints = GetNativeCell(2);

	setPlayerAvailablePoints(iClient, iPoints);
}

//lm_addPlayerAvailablePoints(iClient, iPoints);
public Native_AddClientAvailablePoints(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);
	new iPoints = GetNativeCell(2);

	setPlayerAvailablePoints(iClient, g_iPlayerAvailablePoints[iClient] + iPoints);
}

//lm_getClientStrength(iClient);
public Native_GetClientStrength(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);

	return g_iPlayerStrength[iClient];
}

//lm_getClientStamina(iClient);
public Native_GetClientStamina(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);

	return g_iPlayerStamina[iClient];
}

//lm_getClientDexterity(iClient);
public Native_GetClientDexterity(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);

	return g_iPlayerDexterity[iClient];
}

//lm_getClientDexterity(iClient);
public Native_GetClientAvailablePoints(Handle:hPlugin, iNumParams)
{
	new iClient = GetNativeCell(1);

	return g_iPlayerAvailablePoints[iClient];
}

//public att_OnClientStrengthChange(iClient, iValue, iAmount) {};
public Forward_StrengthChange(iClient, iValue, iAmount)
{
	Call_StartForward(g_hForwardStrengthUp);
	Call_PushCell(iClient);
	Call_PushCell(iValue);
	Call_PushCell(iAmount);
	Call_Finish();
}

//public att_OnClientStaminaChange(iClient, iValue, iAmount) {};
public Forward_StaminaChange(iClient, iValue, iAmount)
{
	Call_StartForward(g_hForwardStaminaUp);
	Call_PushCell(iClient);
	Call_PushCell(iValue);
	Call_PushCell(iAmount);
	Call_Finish();
}

//public att_OnClientDexterityChange(iClient, iValue, iAmount) {};
public Forward_DexterityChange(iClient, iValue, iAmount)
{
	Call_StartForward(g_hForwardDexterityUp);
	Call_PushCell(iClient);
	Call_PushCell(iValue);
	Call_PushCell(iAmount);
	Call_Finish();
}