#if defined _attributes_included_
	#endinput
#endif
#define _attributes_included_

#define TATTAPIVERSION 1
#define MAXSKILLLEVEL 		20
#define ATTRIBUTESIZE		10

enum attChooseResult {
	att_OK,
	att_NoAvailablePoints,
	att_MaxSkillLevelReached,
	att_AttributeNotRegistered
};

native att_IsEnabled();

functag att_AttributeCallback public(iClient, iValue, iAmount);

/**
 * Register an  Attribute
 * 
 * @param AttributeType		Type of Attribute: good, bad or random.
 * @param func			Callback to use for  Attribute.
 * @return			 Attribute id to use when unregistering.
 */
native att_RegisterAttribute(const String:name[], const String:desc[], att_AttributeCallback:callback);

/**
 * Unregister an  Attribute (will be done automatically on plugin unload)
 *
 * @param iAttributeId		The  Attribute id to remove.
 * @return			Nothing.
 */
native att_UnregisterAttribute(iAttributeId);


/**
 * Get the Attribute count
 * 
 * @return			Attribute count
 */
native att_GetAttributeCount();

/**
 * Get the id of an Attribute (index of the Attributearray is different than the Attributeid!)
 * 
 * @param iIndex		The  Attribute id to remove.
 * @return			Attribute id
 */
native att_GetAttributeID(iIndex);

/**
 * Get the name of an Attribute
 * 
 * @param iAttributeId		The  Attribute id to remove.
 * @param AttributeName		The string the Attribute name will be put in
 * @return			True if the attribute exists, false if not.
 */
native bool:att_GetAttributeName(iAttributeId, String:AttributeName[]);

/**
 * Get the description of an Attribute
 * 
 * @param iAttributeId		The  Attribute id to remove.
 * @return			Attribute description
 */
native att_GetAttributeDescription(iAttributeId, String:AttributeDesc[]);


native att_SetClientAvailablePoints(iClient, iAvailablePoints);
native att_AddClientAvailablePoints(iClient, iAmount);
native att_GetClientAvailablePoints(iClient);

native att_SetClientAttributeValue(iClient, iAttributeId, iLevel);
native att_GetClientAttributeValue(iClient, iAttributeId);
native att_AddClientAttributeValue(iClient, iAttributeId, iAmount);

forward att_OnClientAttributeChange(iClient, iAttributeId, iValue, iAmount);
