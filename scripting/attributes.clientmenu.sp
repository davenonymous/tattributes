#include <sourcemod>
#include <sdktools>
#include <attributes>
#include <colors>

#pragma semicolon 1
#define PLUGIN_VERSION "0.1.0"

new Handle:g_hCvarDeathMessage;
//new bool:g_bDeathMessage;

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, ClientMenu",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, providing clients with a menu.",
	version = PLUGIN_VERSION,
	url = "http://thrawn.de"
}

//////////////////////////
//P L U G I N  S T A R T//
//////////////////////////
public OnPluginStart()
{
	g_hCvarDeathMessage = CreateConVar("sm_lm_deathmessage", "1", "Show who killed you with which level on death", FCVAR_PLUGIN, true, 0.0, true, 1.0);
	HookConVarChange(g_hCvarDeathMessage, Cvar_Changed);

	RegConsoleCmd("sm_att", ShowAttribMenu);
}

public OnConfigsExecuted()
{
	//g_bDeathMessage = GetConVarBool(g_hCvarDeathMessage);
}

public Cvar_Changed(Handle:convar, const String:oldValue[], const String:newValue[]) {
	OnConfigsExecuted();
}


public Action:ShowAttribMenu(client, args)
{
	CreateChooserMenu(client);
}

public CreateChooserMenu(client) {
	new Handle:menu = CreateMenu(ChooserMenu_Handler);

	decl String:sMenuTitle[128];
	Format(sMenuTitle, sizeof(sMenuTitle), "You have %i points available. Choose wisely!", att_GetClientAvailablePoints(client));

	SetMenuTitle(menu, sMenuTitle);

	new count = att_GetAttributeCount();
	for(new i = 0; i < count; i++) {
		new eID = att_GetAttributeID(i);

		new String:eName[64];
		att_GetAttributeName(eID,eName);
		Format(eName, sizeof(eName), "%s: %i", eName, att_GetClientAttributeValue(client, eID));

		new String:eIDString[4];
		IntToString(eID, eIDString, 4);

		AddMenuItem(menu, eIDString, eName);
	}

	//AddMenuItem(menu, "no", "Cancel");
	SetMenuExitButton(menu, true);

	DisplayMenu(menu, client, 20);
}

public ChooserMenu_Handler(Handle:menu, MenuAction:action, param1, param2) {
	//param1:: client
	//param2:: item

	if(action == MenuAction_Select) {
		new String:sEID[32];

		/* Get item info */
		GetMenuItem(menu, param2, sEID, sizeof(sEID));
		//PrintToConsole(param1, "You selected item: %d (found? %d info: %s)", param2, found, info);
		new eID = StringToInt(sEID);

		att_AddClientAttributeValue(param1, eID, 1);

		CreateChooserMenu(param1);
	} else if (action == MenuAction_Cancel) {
	} else if (action == MenuAction_End) {
		CloseHandle(menu);
	}
}