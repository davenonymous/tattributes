#include <sourcemod>
#include <attributes>
#include <clientprefs>

#pragma semicolon 1

#define PLUGIN_VERSION "0.1.0"

new Handle:db_strength;
new Handle:db_dexterity;
new Handle:db_stamina;
new Handle:db_points;


new bool:g_bValuesLoaded[MAXPLAYERS+1] = {false,...};

////////////////////////
//P L U G I N  I N F O//
////////////////////////
public Plugin:myinfo =
{
	name = "tAttributes Mod, Permanent (clientprefs)",
	author = "Thrawn",
	description = "A plugin for tAttributes Mod, saves attributes to the clientprefs db.",
	version = PLUGIN_VERSION,
	url = "http://thrawn.de"
}

public OnPluginStart()
{
	db_strength = RegClientCookie("attributes_strength", "Current player strength", CookieAccess_Private);
	db_dexterity = RegClientCookie("attributes_dexterity", "Current player dexterity", CookieAccess_Private);
	db_stamina = RegClientCookie("attributes_stamina", "Current player stamina", CookieAccess_Private);
	db_points = RegClientCookie("attributes_available", "Available attribute points to the player ", CookieAccess_Private);
}


/////////////////////////
//L O A D  F R O M  D B//
/////////////////////////
public OnClientCookiesCached(client) {
	loadValues(client);
}

public OnClientPutInServer(client) {
	g_bValuesLoaded[client] = false;
}

stock loadValues(client) {
	if (!AreClientCookiesCached(client) || g_bValuesLoaded[client])
		return;

	new String:sStrength[20];
	GetClientCookie(client, db_strength, sStrength, sizeof(sStrength));
	new iStrength = StringToInt(sStrength);

	if(iStrength >= 0) {
		att_setClientStrength(client, iStrength);
		LogMessage("DB: %N has strength: %i", client, iStrength);
	}

	new String:sDexterity[20];
	GetClientCookie(client, db_dexterity, sDexterity, sizeof(sDexterity));
	new iDexterity = StringToInt(sDexterity);

	if(iDexterity >= 0) {
		att_setClientDexterity(client, iDexterity);
		LogMessage("DB: %N has Dexterity: %i", client, iDexterity);
	}

	new String:sStamina[20];
	GetClientCookie(client, db_stamina, sStamina, sizeof(sStamina));
	new iStamina = StringToInt(sStamina);

	if(iStamina >= 0) {
		att_setClientStamina(client, iStamina);
		LogMessage("DB: %N has Stamina: %i", client, iStamina);
	}

	new String:sPoints[20];
	GetClientCookie(client, db_points, sPoints, sizeof(sPoints));
	new iPoints = StringToInt(sPoints);

	if(iPoints >= 0) {
		att_setClientAvailablePoints(client, iPoints);
		LogMessage("DB: %N has Points: %i", client, iPoints);
	}

	g_bValuesLoaded[client] = true;
}


/////////////////////
//S A V E  T O  D B//
/////////////////////
public OnClientDisconnect(client)
{
	new iStrength = att_getClientStrength(client);
	new iStamina = att_getClientStamina(client);
	new iDexterity = att_getClientDexterity(client);
	new iPoints = att_getClientAvailablePoints(client);

	new String:sStrength[20];
	Format(sStrength, sizeof(sStrength), "%i", iStrength);

	new String:sPoints[20];
	Format(sPoints, sizeof(sPoints), "%i", iPoints);

	new String:sStamina[20];
	Format(sStamina, sizeof(sStamina), "%i", iStamina);

	new String:sDexterity[20];
	Format(sDexterity, sizeof(sDexterity), "%i", iDexterity);

	LogMessage("Writing client cookie: strength %i, stamina: %i, dexterity: %i, points: %i", iStrength, iStamina, iDexterity, iPoints);

	SetClientCookie(client, db_strength, sStrength);
	SetClientCookie(client, db_stamina, sStamina);
	SetClientCookie(client, db_dexterity, sDexterity);
	SetClientCookie(client, db_points, sPoints);

}