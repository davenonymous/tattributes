#define TF2_PLAYER_SLOWED		(1 << 0)    
#define TF2_PLAYER_ZOOMED		(1 << 1)    
#define TF2_PLAYER_DISGUISING		(1 << 2)    
#define TF2_PLAYER_DISGUISED		(1 << 3)    
#define TF2_PLAYER_CLOAKED		(1 << 4)    
#define TF2_PLAYER_INVULN		(1 << 5)    
#define TF2_PLAYER_GLOWING		(1 << 6)    
#define TF2_PLAYER_TAUNTING		(1 << 7)    
#define TF2_PLAYER_TELEPORT		(1 << 10)   
#define TF2_PLAYER_CRITS		(1 << 11)   
#define TF2_PLAYER_FEIGNDEATH		(1 << 13)   
#define TF2_PLAYER_BLUR			(1 << 14)   
#define TF2_PLAYER_STUN			(1 << 15)   
#define TF2_PLAYER_BUFF			(1 << 16)   
#define TF2_PLAYER_CHARGING		(1 << 17)   
#define TF2_PLAYER_HEALING		(1 << 19)   
#define TF2_PLAYER_ONFIRE		(1 << 20)   
#define TF2_PLAYER_OVERHEALING		(1 << 21)   
#define TF2_PLAYER_URINE		(1 << 22)   

#define TF2_COND_SLOWED			0	
#define TF2_COND_ZOOMED			1	
#define TF2_COND_DISGUISING		2	
#define TF2_COND_DISGUISED		3	
#define TF2_COND_CLOAKED		4	
#define TF2_COND_INVULN			5	
#define TF2_COND_GLOWING		6	
#define TF2_COND_TAUNTING		7	
#define TF2_COND_TELEPORT		10	
#define TF2_COND_CRITS	    		11	
#define TF2_COND_FEIGNDEATH		13	
#define TF2_COND_BLUR			14	
#define TF2_COND_STUN			15	
#define TF2_COND_BUFF			16	
#define TF2_COND_CHARGING		17	
#define TF2_COND_HEALING		19	
#define TF2_COND_ONFIRE			20	
#define TF2_COND_OVERHEALING  		21	
#define TF2_COND_URINE			22

enum TFItems
{
	ITEM_WEAPON_BAT					= 0,
	ITEM_WEAPON_BOTTLE				= 1,
	ITEM_WEAPON_FIREAXE				= 2,
	ITEM_WEAPON_KUKRI				= 3,
	ITEM_WEAPON_KNIFE				= 4,
	ITEM_WEAPON_FISTS				= 5,
	ITEM_WEAPON_SHOVEL				= 6,
	ITEM_WEAPON_WRENCH				= 7,
	ITEM_WEAPON_BONESAW				= 8,
	ITEM_WEAPON_SHOTGUN_ENG			= 9,
	ITEM_WEAPON_SHOTGUN_SOLDIER		= 10,
	ITEM_WEAPON_SHOTGUN_HWG			= 11,
	ITEM_WEAPON_SHOTGUN_PYRO		= 12,
	ITEM_WEAPON_SCATTERGUN			= 13,
	ITEM_WEAPON_SNIPERRIFLE			= 14,
	ITEM_WEAPON_MINIGUN				= 15,
	ITEM_WEAPON_SMG					= 16,
	ITEM_WEAPON_SYRINGEGUN			= 17,
	ITEM_WEAPON_ROCKETLAUNCHER		= 18,
	ITEM_WEAPON_GRENADELAUNCHER		= 19,
	ITEM_WEAPON_STICKYBOMBLAUNCHER	= 20,
	ITEM_WEAPON_FLAMETHROWER		= 21,
	ITEM_WEAPON_PISTOL_ENG			= 22,
	ITEM_WEAPON_PISTOL_SCOUT		= 23,
	ITEM_WEAPON_REVOLVER			= 24,
	ITEM_WEAPON_PDA_BUILD			= 25,
	ITEM_WEAPON_PDA_DESTROY			= 26,
	ITEM_WEAPON_PDA_DISGUISE		= 27,
	ITEM_WEAPON_TOOLBOX				= 28,
	ITEM_WEAPON_MEDIGUN				= 29,
	ITEM_WEAPON_WATCH_INVIS			= 30,
	ITEM_WEAPON_FLAREGUN			= 31,
	ITEM_WEAPON_BONESAW_LV1			= 32,
	ITEM_WEAPON_SYRINGEGUN_LV1		= 33,
	ITEM_WEAPON_MEDIGUN_LV1			= 34,
	ITEM_WEAPON_KRITZKRIEG			= 35,
	ITEM_WEAPON_BLUTSAUGER			= 36,
	ITEM_WEAPON_UBERSAW				= 37,
	ITEM_WEAPON_AXTINGUISHER		= 38,
	ITEM_WEAPON_FLAREGUN_HALF		= 39,
	ITEM_WEAPON_BACKBURNER			= 40,
	ITEM_WEAPON_NATASCHA			= 41,
	ITEM_WEAPON_SANDVICH			= 42,
	ITEM_WEAPON_KGB					= 43,
	ITEM_WEAPON_SANDMAN				= 44,
	ITEM_WEAPON_FAN					= 45,
	ITEM_WEAPON_BONKDRINK			= 46,
	ITEM_WEAR_DEMO_AFRO				= 47,
	ITEM_WEAR_ENG_LIGHT				= 48,
	ITEM_WEAR_HEAVY_FOOTBALL		= 49,
	ITEM_WEAR_MEDIC_PICKELHAUBE		= 50,
	ITEM_WEAR_PYRO_BEANIE			= 51,
	ITEM_WEAR_SCOUT_BATTER			= 52,
	ITEM_WEAR_SNIPER_TROPHY			= 53,
	ITEM_WEAR_SOLDIER_STASH			= 54,
	ITEM_WEAR_SPY_FEDORA			= 55,
	ITEM_WEAPON_HUNTSMAN			= 56,
	ITEM_WEAR_RAZORBACK				= 57,
	ITEM_WEAPON_JARATE				= 58,
	ITEM_WEAPON_WATCH_DEADRINGER	= 59,
	ITEM_WEAPON_WATCH_CAD			= 60,
	ITEM_WEAPON_AMBASSADOR			= 61,
	ITEM_WEAR_ENG_TENGALLON			= 94,
	ITEM_WEAR_ENG_CAP				= 95,
	ITEM_WEAR_HEAVY_USHANKA			= 96,
	ITEM_WEAR_HEAVY_STOCKING		= 97,
	ITEM_WEAR_SOLDIER_POT			= 98,
	ITEM_WEAR_SOLDIER_TYRANT		= 99,
	ITEM_WEAR_DEMO_GLENGARRY		= 100,
	ITEM_WEAR_MEDIC_TYROLEAN		= 101,
	ITEM_WEAR_PYRO_CHIKEN			= 102,
	ITEM_WEAR_SPY_CAMERA			= 103,
	ITEM_WEAR_MEDIC_MIRROR			= 104,
	ITEM_WEAR_PYRO_FIREMAN			= 105,
	ITEM_WEAR_SCOUT_BONK			= 106,
	ITEM_WEAR_SCOUT_BAKER			= 107,
	ITEM_WEAR_SPY_BILLYCOCK			= 108,
	ITEM_WEAR_SNIPER_PANAMA			= 109,
	ITEM_WEAR_SNIPER_BAND			= 110,
	ITEM_WEAR_SCOUT_HATLESS			= 111,
	ITEM_WEAR_HALLOWEEN_HAT			= 115,
	ITEM_WEAR_DOMINATION_HAT		= 116,
	ITEM_WEAR_SNIPER_HATLESS		= 117,
	ITEM_WEAR_ENG_HATLESS			= 118,
	ITEM_WEAR_DEMO_TOPHAT			= 120,
	ITEM_WEAR_SOLDIER_MEDAL			= 121,
	ITEM_CHEAT_DETECTED_MINOR		= 122,
	ITEM_CHEAT_DETECTED_MAJOR		= 123,
	ITEM_CHEAT_DETECTED_HONESTY		= 124,
	ITEM_WARE_HONEST_HALO			= 125,
	ITEM_WARE_BILL_HAT				= 126,
	ITEM_WEAPON_DIRECTHIT			= 127,
	ITEM_WEAPON_PICKAXE				= 128,
	ITEM_WEAPON_BATTLE_BANNER		= 129,
	ITEM_WEAPON_SCOTTISH_RESISTANCE	= 130,
	ITEM_WEAPON_CHARGIN_TARGE		= 131,
	ITEM_WEAPON_EYELANDER			= 132,
	ITEM_WEAPON_GUNBOATS			= 133,
	ITEM_WEAR_CONTEST_FIRST_PLACE	= 134,
	ITEM_WEAR_TOWERING_PILLAR		= 135,
	ITEM_WEAR_CONTEST_SECOND_PLACE	= 136,
	ITEM_WEAR_NOBLE_AMASSMENT		= 137,
	ITEM_WEAR_CONTEST_THIRD_PLACE	= 138,
	ITEM_WEAR_MODEST_PILE			= 139
};

stock TF2_GetItemDefIndex( entIndex )
{
	if( entIndex != -1 )
	{
		return GetEntProp( entIndex, Prop_Send, "m_iItemDefinitionIndex" );
	}
	return -1;
}

/**
 * Gets a clients current condition.
 * This is mostly for internal usage. You will have more fun
 * using TF2_IsPlayerZoomed, TF2_IsPlayerHealing etc.
 *
 * @param client		Player's index.
 * @return			Current Player Condition of player.
 */
stock TF2_GetPlayerCond(client)
{
    return GetEntProp(client, Prop_Send, "m_nPlayerCond");
}

/**
 * Sets a clients current condition.
 *
 * @param client		Player's index.
 * @param playerCond		Condition the player will be in.
 * @return			Current Player Condition of player.
 */
stock TF2_SetPlayerCond(client,playerCond)
{
    SetEntProp(client, Prop_Send, "m_nPlayerCond", playerCond);
}

/**
 * Gets a clients number of healers
 *
 * @param client		Player's index.
 * @return			Current number of players healing the player.
 */
stock TF2_GetNumHealers(client)
{
    return GetEntProp(client, Prop_Send, "m_nNumHealers");
}

/**
 * Get a players current condition: Zoom
 *
 * @param client		Player's index.
 * @return			Returns true if the player is zoomed in
 */
stock bool:TF2_IsPlayerZoomed(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_ZOOMED) != 0) : false;
}

/**
 * Get a players current condition: Healing
 *
 * @param client		Player's index.
 * @return			Returns true if the player is healing somebody
 */
stock bool:TF2_IsPlayerHealing(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_HEALING) != 0) : false;
}

/**
 * Get a players current condition: Overhealing
 *
 * @param client		Player's index.
 * @return			Returns true if the player is overhealing somebody.
 */
stock bool:TF2_IsPlayerOverHealing(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_OVERHEALING) != 0) : false;
}

/**
 * Get a players current condition: Urine
 *
 * @param client		Player's index.
 * @return			Returns true if the player is covered in urine.
 */
stock bool:TF2_IsPlayerUrine(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_URINE) != 0) : false;
}

/**
 * Get a players current condition: Taunting
 *
 * @param client		Player's index.
 * @return			Returns true if the player is taunting.
 */
stock bool:TF2_IsPlayerTaunt(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_TAUNTING) != 0) : false;
}

/**
 * Get a players current condition: Slowed (by natasha, bonk after-effect etc)
 *
 * @param client		Player's index.
 * @return			Returns true if the player is being slowed down by something.
 */
stock bool:TF2_IsPlayerSlowed(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_SLOWED) != 0) : false;
}

/**
 * Get a players current condition: Disguised
 *
 * @param client		Player's index.
 * @return			Returns true if the player is disguised.
 */
stock bool:TF2_IsPlayerDisguised(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_DISGUISED) != 0) : false;
}

/**
 * Get a players current condition: Cloak Change (spy's half visible)
 *
 * @param client		Player's index.
 * @return			Returns true if the player is toggling his cloak.
 */
stock bool:TF2_IsPlayerChangingCloak(client)
{
	if( TF2_GetPlayerClass(client) == TFClass_Spy )
	{
		if(GetGameTime() <= GetEntPropFloat(client, Prop_Send, "m_flInvisChangeCompleteTime"))
		{
			return true;
		}
	}
	return false;
}

/**
 * Get a players current condition: Cloaked (spy's full invisible)
 *
 * @param client		Player's index.
 * @return			Returns true if the player is cloaked.
 */
stock bool:TF2_IsPlayerCloaked(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_CLOAKED) != 0) : false;
}

/**
 * Get a players current condition: FeignDeath
 *
 * @param client		Player's index.
 * @return			Returns true if the player is currently feigning his death.
 */
stock bool:TF2_IsPlayerFeignDeath(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_FEIGNDEATH) != 0) : false;
}

/**
 * Get a players current condition: Blur (Bonk drink)
 *
 * @param client		Player's index.
 * @return			Returns true if the player is currently blurred by bonk.
 */
stock bool:TF2_IsPlayerBlur(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_BLUR) != 0) : false;
}

/**
 * Get a players current condition: Stunned
 *
 * @param client		Player's index.
 * @return			Returns true if the player is currently stunned.
 */
stock bool:TF2_IsPlayerStun(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_STUN) != 0) : false;
}

/**
 * Get a players current condition: Charge deployed
 *
 * @param client		Player's index.
 * @return			Returns true if the player has deploying his charge.
 */
stock bool:TF2_IsPlayerChargeReleased(client)
{
	new index = GetPlayerWeaponSlot(client, 1);
	if (index > 0)
	{
		new String:classname[64];
		TF2_GetWeaponClass(index, classname, sizeof(classname));
		
		if( StrEqual(classname, "CWeaponMedigun") )
		{
			return bool:GetEntProp(index, Prop_Send, "m_bChargeRelease");
		}
	}		
	return false;
}

/**
 * Get a players current condition: Ubered or Kritzed
 *
 * @param client		Player's index.
 * @return			Returns true if the player is currently being ubered or kritzed.
 */
stock bool:TF2_IsPlayerUber(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & (TF2_PLAYER_INVULN | TF2_PLAYER_CRITS)) != 0) : false;
}

/**
 * Get a players current condition: Ubered
 *
 * @param client		Player's index.
 * @return			Returns true if the player is currently being ubered.
 */
stock bool:TF2_IsPlayerInvuln(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_INVULN) != 0) : false;
}

/**
 * Get a players current condition: Kritzed
 *
 * @param client		Player's index.
 * @return			Returns true if the player is currently being kritzed.
 */
stock bool:TF2_IsPlayerCrits(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_CRITS) != 0) : false;
}

/**
 * Get a players current condition: On fire
 *
 * @param client		Player's index.
 * @return			Returns true if the player is currently on fire.
 */
stock bool:TF2_IsPlayerOnFire(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_ONFIRE) != 0) : false;
}

/**
 * Get a players current condition: Charging
 *
 * @param client		Player's index.
 * @return			Returns true if the player is currently charging.
 */
stock bool:TF2_IsPlayerCharging(client)
{
    new pcond = TF2_GetPlayerCond(client);
    return pcond >= 0 ? ((pcond & TF2_PLAYER_CHARGING) != 0) : false;
}

/**
 * Set a players current condition: Cloaked
 *
 * @param client		Player's index.
 * @param enabled		Un/Cloak a player.
 */
stock TF2_SetPlayerCloak(client, bool:enabled)
{
    new playerCond = TF2_GetPlayerCond(client);
    if (enabled)
        TF2_SetPlayerCond(client, (playerCond | TF2_PLAYER_CLOAKED));
    else
        TF2_SetPlayerCond(client, (playerCond & (~TF2_PLAYER_CLOAKED)));
}

/**
 * Get the base speed of a class, meaning speeds unmodified by weapons, charging etc
 *
 * @param class			TFClassType
 * @return			Base class speed.
 */
stock Float:TF2_GetClassSpeed(TFClassType:class)
{
    switch (class)
    {
        case TFClass_Scout:     return 400.0;
        case TFClass_Soldier:   return 240.0;
        case TFClass_DemoMan:   return 280.0;
        case TFClass_Medic:     return 320.0;
        case TFClass_Pyro:      return 300.0;
        case TFClass_Spy:       return 300.0;
        case TFClass_Engineer:  return 300.0;
        case TFClass_Sniper:    return 300.0;
        case TFClass_Heavy:     return 230.0;
    }
    return 0.0;
}

/**
 * Get the speed a player should have when walking regarding his selected weapon, if he's being charged etc
 *
 * @param client		Player's index.
 * @return			The speed a client should have at the moment.
 */
stock Float:TF2_GetPlayerClassSpeed(client)
{
    if( TF2_IsPlayerSlowed( client ) )
	{
		if( TF2_GetItemDefIndex( TF2_GetCurrentWeapon( client ) ) == _:ITEM_WEAPON_HUNTSMAN )
		{
			if( TF2_GetPlayerSniperCharge( client ) > 0 )
			{
				return 160.0;
			}
		}
		
		return 80.0;
	}
	
	if( TF2_GetItemDefIndex( TF2_GetCurrentWeapon( client ) ) == _:ITEM_WEAPON_PICKAXE )
	{
		new health = GetClientHealth( client );
		if( health <= 300 && health > 160)
		{
	        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) );
		}
		else if( health <= 160 && health > 120)
		{
	        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) ) * 1.1;
		}
		else if( health <= 120 && health > 80)
		{
	        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) ) * 1.2;
		}
		else if( health <= 80 && health > 40)
		{
	        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) ) * 1.4;
		}
		else if( health <= 40 && health > 0)
		{
	        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) ) * 1.6;
		}
	}
	
	new weaponIndex = GetPlayerWeaponSlot(client, 2);
	if( weaponIndex != -1)
	{
		if( TF2_GetItemDefIndex( weaponIndex ) == _:ITEM_WEAPON_EYELANDER )
		{
			new head = TF2_GetDecapitations( client );
			if( head == 1 )
			{
		        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) ) * 1.08;
			}
			else if( head == 2 )
			{
		        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) ) * 1.16;
			}
			else if( head == 3 )
			{
		        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) ) * 1.24;
			}
			else if( head >= 4 )
			{
		        return TF2_GetClassSpeed( TF2_GetPlayerClass( client ) ) * 1.32;
			}
		}
	}

	if( TF2_IsPlayerCharging( client ) )
	{
		return 750.0;
	}
	
	return TF2_GetClassSpeed(TF2_GetPlayerClass(client));
}

/**
 * Get the speed a player is now moving at
 *
 * @param client		Player's index.
 * @return			The speed a client is having at the moment.
 */
stock Float:TF2_GetPlayerSpeed(client)
{
	if( client > 0 )
	{
		new Float:vec[3];
		GetEntPropVector(client, Prop_Data, "m_vecAbsVelocity", vec);
		return GetVectorLength(vec);
	}
	return 0.0;
}

/**
 * Set the speed a player can move at
 *
 * @param client		Player's index.
 * @param speed			How fast the maximum speed should be.
 */
stock Float:TF2_SetPlayerSpeed(client, Float:speed)
{
	if( client > 0 )
	{
		SetEntPropFloat(client, Prop_Data, "m_flMaxspeed", speed);
		SetEntPropFloat(client, Prop_Send, "m_flMaxspeed", speed);
	}
}

/**
 * Reset the speed a player can move at to the default value.
 *
 * @param client		Player's index.
 */
stock Float:TF2_SetPlayerDefaultSpeed(client)
{
	if( client > 0 )
	{
		SetEntPropFloat(client, Prop_Data, "m_flMaxspeed", TF2_GetPlayerClassSpeed(client));
		SetEntPropFloat(client, Prop_Send, "m_flMaxspeed", TF2_GetPlayerClassSpeed(client));
	}
}

/**
 * Get the base health of a client, meaning values unmodified by weapons, decapitations etc
 *
 * @param class			TFClassType
 * @return			Base class speed.
 */
stock TF2_GetPlayerDefaultHealth(client)
{
	if( client > 0 )
	{
	    return GetEntProp(client, Prop_Data, "m_iMaxHealth");
	}  
	return 100;
}

/**
 * Get the health a player should have at maximum regarding his selected weapon, if he's decapitated anyone etc
 *
 * @param client		Player's index.
 * @return			The maximum health a client should have at the moment.
 */
stock TF2_GetPlayerMaxHealth(client)
{
	if( client > 0 )
	{	
		switch ( TF2_GetPlayerClass( client ) )
		{
			case TFClass_Scout:
			{
				new weaponIndex = GetPlayerWeaponSlot( client, 2 );
				if( weaponIndex != -1)
				{
					if( TF2_GetItemDefIndex( weaponIndex ) == _:ITEM_WEAPON_SANDMAN )
					{
						return 140;
					}
					else
					{
						return 185;
					}
				}
			}
			case TFClass_Soldier:	return 300;
			case TFClass_DemoMan:
			{
				new weaponIndex = GetPlayerWeaponSlot( client, 2 );
				if( TF2_GetItemDefIndex( weaponIndex ) == _:ITEM_WEAPON_EYELANDER )
				{
					new head = TF2_GetDecapitations( client );
					if( head == 1 )
					{
				 		return 248;
					}
					else if( head == 2 )
					{
						return 270;
					}
					else if( head == 3 )
					{
				        return 293;
					}
					else if( head >= 4 )
					{
						return 315;
					}
					else
					{
						return 225;
					}
				}	
				else
				{
					return 260;
				}
			}
			case TFClass_Medic:		return 225;
			case TFClass_Pyro:		return 260;
			case TFClass_Spy:		return 185;
			case TFClass_Engineer:		return 185;
			case TFClass_Sniper:		return 185;
			case TFClass_Heavy:		return 450;
		}
	}
	
	return 100;	
}

/**
 * Get the number of players a client is dominating
 *
 * @param client		Player's index.
 * @return			Number of players a client is dominating
 */
stock TF2_GetPlayerDominations( client )
{
	new dominations;
	new offset = FindSendPropInfo("CTFPlayerResource", "m_iActiveDominations");
	new ent = FindEntityByClassname(-1, "tf_player_manager");
	if (ent != -1)
		dominations = GetEntData(ent, (offset + client*4), 4);    
	return dominations;
}

/**
 * Get the number of heads a players has collected by decapitating
 *
 * @param client		Player's index.
 * @return			Number of heads a client has decapitated
 */
stock TF2_GetDecapitations(any:client)
{
	if( client > 0 )
	{
		return GetEntProp(client, Prop_Send, "m_iDecapitations");
	}
	return -1;
}

stock TF2_GetCurrentWeaponClass(client, String:name[], maxlength)
{
	if( client > 0 )
	{
		new index = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
		if (index > 0)
			GetEntityNetClass(index, name, maxlength);
	}
}

stock TF2_GetWeaponClass(index, String:name[], maxlength)
{
	if (index > 0)
		GetEntityNetClass(index, name, maxlength);
}

stock TF2_GetWeaponEdictName(index, String:name[], maxlength)
{
	if (index > 0)
		GetEdictClassname(index, name, maxlength);
}

stock bool:TF2_CurrentWeaponEqual(client, String:name[])
{
	if( client > 0 )
	{
		new String:classname[64];
		TF2_GetCurrentWeaponClass(client, classname, 64);
		return StrEqual(classname, name);
	}
	return false;
}

stock TF2_GetCurrentWeapon(any:client)
{
	if( client > 0 )
	{
		new weaponIndex = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
		return weaponIndex;
	}
	return -1;
}

stock TF2_GetSlotAmmo(any:client, slot)
{
	if( client > 0 )
	{
		new offset = FindDataMapOffs(client, "m_iAmmo") + ((slot + 1) * 4);
		return GetEntData(client, offset, 4);
	}
	return -1;
}

stock TF2_GetSlotClip(any:client, slot)
{
	if( client > 0 )
	{
		new weaponIndex = GetPlayerWeaponSlot(client, slot);
		if( weaponIndex != -1 )
		{
			return GetEntProp( weaponIndex, Prop_Send, "m_iClip1" );
		}
	}
	return -1;
}

stock TF2_GetSlotWeapon(any:client, slot)
{
	if( client > 0 && slot >= 0)
	{
		new weaponIndex = GetPlayerWeaponSlot(client, slot-1);
		return weaponIndex;
	}
	return -1;
}

stock TF2_DeletePlayerSlot(any:client, deleteSlot, afterSlot)
{
	if( IsClientInGame(client) && IsPlayerAlive(client) )
	{
		new weaponIndex = GetPlayerWeaponSlot(client, deleteSlot);
		if( weaponIndex != -1 )
		{
			RemovePlayerItem(client, weaponIndex);
			RemoveEdict(weaponIndex);
			TF2_RemoveWeaponSlot(client, deleteSlot);
			
			if(GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon") == -1)
			{
				ClientCommand(client, "slot%d", afterSlot);
			}
		}	
	}			
}

stock bool:TF2_IsAllowPlantSapper(client)
{
	if( client > 0 )
	{
		if(TF2_CurrentWeaponEqual(client, "CTFWeaponBuilder"))
		{
			new weaponIndex = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
			if (weaponIndex > 0)
			{
				if(GetEntProp(weaponIndex, Prop_Send, "m_iBuildState")==2)
				{
					return true;
				}
			}
		}
	}
	return false;
}

stock bool:TF2_EdictNameEqual(entity, String:name[])
{
	if( entity > 0 )
	{
		if(IsValidEdict(entity))
		{
			new String:edictName[64];
			GetEdictClassname(entity, edictName, sizeof(edictName)); 
			return StrEqual(edictName, name);
		}
	}
	return false;
}
		
stock TF2_GetPlayerUberLevel(client)
{
	new index = GetPlayerWeaponSlot(client, 1);
					
	if (index > 0)
	{
		new String:classname[64];
		TF2_GetWeaponClass(index, classname, sizeof(classname));
		
		if( StrEqual(classname, "CWeaponMedigun") )
		{
			return RoundFloat(GetEntPropFloat(index, Prop_Send, "m_flChargeLevel")*100);
		}
		
	}
	return 0;
}

stock TF2_SetPlayerUberLevel(client, uberlevel)
{
	new index = GetPlayerWeaponSlot(client, 1);
	if (index > 0)
	{
		new String:classname[64];
		TF2_GetWeaponClass(index, classname, sizeof(classname));
		
		if( StrEqual(classname, "CWeaponMedigun") )
		{
			SetEntPropFloat(index, Prop_Send, "m_flChargeLevel", uberlevel*0.01);
		}
	}
}

stock TF2_GetHealingTarget(client)
{
	new String:classname[64];
	TF2_GetCurrentWeaponClass(client, classname, sizeof(classname));
	
	if( StrEqual(classname, "CWeaponMedigun") )
	{
		new index = GetEntPropEnt(client, Prop_Send, "m_hActiveWeapon");
		if( GetEntProp(index, Prop_Send, "m_bHealing") == 1 )
		{
			return GetEntPropEnt(index, Prop_Send, "m_hHealingTarget");
		}
	}
		
	return -1;
}

stock bool:TF2_IsReadyFeignDeath(client)
{
	if( TF2_GetPlayerClass(client) == TFClass_Spy )
	{
	    return bool:GetEntProp(client, Prop_Send, "m_bFeignDeathReady");
	}
	
	return false;
}

stock TF2_GetPlayerCloakMeter(client)
{
	if( TF2_GetPlayerClass(client) == TFClass_Spy )
	{
	    return RoundFloat(GetEntPropFloat(client, Prop_Send, "m_flCloakMeter"));
	}
	
	return 100;
}

stock TF2_SetPlayerCloakMeter(client, cloakMeter)
{
 	if( TF2_GetPlayerClass(client) == TFClass_Spy )
	{
		SetEntPropFloat(client, Prop_Send, "m_flCloakMeter", cloakMeter*1.0);
	}
}

stock TF2_GetPlayerMetalAmount(client)
{
	return GetEntData(client, FindDataMapOffs(client, "m_iAmmo") + (3 * 4), 4);
}

stock TF2_SetPlayerMetalAmount(client, metal)
{
	SetEntData(client, FindDataMapOffs(client, "m_iAmmo") + (3 * 4), metal, 4);  
}

stock TF2_GetPlayerSniperCharge(client)
{
	new index = GetPlayerWeaponSlot(client, 0);
	if (index > 0)
	{
		if( TF2_GetItemDefIndex( index ) == _:ITEM_WEAPON_SNIPERRIFLE )
		{
			return RoundFloat(GetEntPropFloat(index, Prop_Send, "m_flChargedDamage") * 0.666);
		}
		else if( TF2_GetItemDefIndex( index ) == _:ITEM_WEAPON_HUNTSMAN )
		{
			new Float:charge = GetGameTime() - GetEntPropFloat(index, Prop_Send, "m_flChargeBeginTime");
			
			if( charge > 1.0 )
			{
				charge = 1.0;
			}
			
			if( TF2_IsPlayerSlowed( client ) )
			{
				return RoundFloat( charge * 100.0 ) ;
			}
		}
		
	}
	return 0;
}

stock TF2_SetPlayerSniperCharge(client, chargelevel)
{
	new index = GetPlayerWeaponSlot(client, 0);
	if (index > 0)
	{
		new String:classname[64];
		TF2_GetWeaponClass(index, classname, sizeof(classname));
		
		if( StrEqual(classname, "CTFSniperRifle") )
		{
			SetEntPropFloat(index, Prop_Send, "m_flChargedDamage", chargelevel * 1.5);
		}
	}
}

stock TF2_GetRandomClass() 
{
	return GetRandomInt(1, 9);
}

stock TF2_GetClassPlayers( team, cls ) 
{
	new numPlayers = 0;
	new maxclients = GetMaxClients();
	for (new i = 1; i <= maxclients; i++)
	{
		if( IsClientInGame(i) && IsClientConnected(i) )
		{
			if(GetClientTeam(i) == team && TF2_GetPlayerClass(i) == TFClassType:cls)
			{
				numPlayers++;
			}
		}
	}
	return numPlayers;
}

stock TF2_AddCond( client, cond )
{
	new Handle:cvar = FindConVar( "sv_cheats" );
	new bool:enabled = GetConVarBool( cvar );
	new flags = GetConVarFlags( cvar );
	
	if( !enabled )
	{
		SetConVarFlags( cvar, flags^(FCVAR_NOTIFY|FCVAR_REPLICATED) );
		SetConVarBool( cvar, true );
	}
	FakeClientCommand( client, "addcond %i", cond );
	if( !enabled )
	{
		SetConVarBool( cvar, false );
		SetConVarFlags( cvar, flags );
	}
}

stock TF2_RemoveCond(client, cond)
{
	new Handle:cvar = FindConVar( "sv_cheats" );
	new bool:enabled = GetConVarBool( cvar );
	new flags = GetConVarFlags( cvar );
	
	if( !enabled )
	{
		SetConVarFlags( cvar, flags^(FCVAR_NOTIFY|FCVAR_REPLICATED) );
		SetConVarBool( cvar, true );
	}
	FakeClientCommand(client, "removecond %i", cond);
	if( !enabled )
	{
		SetConVarBool( cvar, false );
		SetConVarFlags( cvar, flags );
	}
}  