#pragma semicolon 1
#include <sourcemod>
#include <csgo_colors>
#include <shop>

#pragma newdecls required

public Plugin myinfo = 
{
	name 		= "[Shop] Lucky Notify",
	description = "Уведомление игроков о выигрыше в удаче",
	author		= "skaen",
	version 	= "1.0.3",
	url 		= "https://hszn.ru/",
};

public void OnPluginStart()
{
	LoadTranslations("shop_notify_lucky.phrases.txt");
}

public void Shop_OnClientItemLucked(int client, ItemId item_id)
{	
	char sCategory[64];
	
	if(Shop_GetCategoryById(Shop_GetItemCategoryId(item_id), sCategory, sizeof(sCategory)) && client > 0 )
	{
		char sItemName[64];
		Shop_GetItemNameById(item_id, sItemName, sizeof sItemName);
		// LogToFile(g_sLogFile, "Игрок %L выиграл предмет %i (%s) (из категории: %s)", client, item_id, sItemName, sCategory);
		CGOPrintToChatAll("%t", "Notification of a win", client, item_id, sItemName, sCategory);
	}	
}
