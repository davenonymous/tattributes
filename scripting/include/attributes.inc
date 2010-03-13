#if defined _attributes_included_
	#endinput
#endif
#define _attributes_included_

enum attChooseResult {
	att_OK,
	att_NoAvailablePoints,
	att_MaxSkillLevelReached
};

native att_IsEnabled();

native att_setClientStrength(iClient, iStrength);
native att_setClientStamina(iClient, iStamina);
native att_setClientDexterity(iClient, iDexterity);
native att_setClientAvailablePoints(iClient, iAvailablePoints);
native att_addClientAvailablePoints(iClient, iAmount);

native att_getClientStrength(iClient);
native att_getClientStamina(iClient);
native att_getClientDexterity(iClient);
native att_getClientAvailablePoints(iClient);
native attChooseResult:att_chooseStrength(iClient);
native attChooseResult:att_chooseStamina(iClient);
native attChooseResult:att_chooseDexterity(iClient);


forward att_OnClientStrengthChange(iClient, iValue, iAmount);
forward att_OnClientStaminaChange(iClient, iValue, iAmount);
forward att_OnClientDexterityChange(iClient, iValue, iAmount);