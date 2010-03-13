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
	name = "tAttributes Mod, ChatMessages",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, displaying various informations via chat.",
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
	Format(sMenuTitle, sizeof(sMenuTitle), "You have %i points available. Choose wisely!", att_getClientAvailablePoints(client));

	SetMenuTitle(menu, sMenuTitle);

	decl String:sStrength[32];
	Format(sStrength, sizeof(sStrength), "Strength: %i", att_getClientStrength(client));

	decl String:sStamina[32];
	Format(sStamina, sizeof(sStamina), "Stamina: %i", att_getClientStamina(client));

	decl String:sDexterity[32];
	Format(sDexterity, sizeof(sDexterity), "Dexterity: %i", att_getClientDexterity(client));

	AddMenuItem(menu, "str", sStrength);
	AddMenuItem(menu, "dex", sDexterity);
	AddMenuItem(menu, "sta", sStamina);

	//AddMenuItem(menu, "no", "Cancel");
	SetMenuExitButton(menu, true);

	DisplayMenu(menu, client, 20);
}

public ChooserMenu_Handler(Handle:menu, MenuAction:action, param1, param2) {
	//param1:: client
	//param2:: item

	if(action == MenuAction_Select) {
		new String:info[32];

		/* Get item info */
		new bool:found = GetMenuItem(menu, param2, info, sizeof(info));
		PrintToConsole(param1, "You selected item: %d (found? %d info: %s)", param2, found, info);

		new attChooseResult:result;
		switch(param2) {
			case 0: {
				//Strength
				result = att_chooseStrength(param1);
			}

			case 1: {
				//Dexterity
				result = att_chooseDexterity(param1);
			}

			case 2: {
				//Stamina
				result = att_chooseStamina(param1);
			}
		}

		CreateChooserMenu(param1);
	} else if (action == MenuAction_Cancel) {
	} else if (action == MenuAction_End) {
		CloseHandle(menu);
	}
}