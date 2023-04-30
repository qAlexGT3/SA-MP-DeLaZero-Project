#define CGEN_MEMORY (1024 * 32)

#define YSI_NO_CACHE_MESSAGE
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECK
#define YSI_NO_HEAP_MALLOC
#define YSI_NO_MODE_CACHE

#define FOREACH_NO_LOCALS
#define FOREACH_NO_BOTS

#include <a_samp>
#undef 	MAX_PLAYERS
#define MAX_PLAYERS 50
#undef 	MAX_VEHICLES
#define MAX_VEHICLES 250
#include <a_mysql>
#include <YSI_Coding\y_timers>
#include <easydialog>
#include <Pawn.CMD>
#include <streamer>
#include <md5>
#include <sscanf2>
#include <fly>
#include <YSI_Coding\y_stringhash>
#include <crashdetect>
#include <BigInt>

#define function%0(%1) forward%0(%1); public%0(%1)

#define GetName(%0) PlayerInfo[%0][pUserName]
#define GetFPS(%0) PlayerInfo[%0][pFPS]
#define GetSession(%0) PlayerInfo[%0][pSession]

#define COLOR_SERVER									0x008080FF

#define COLOR_DARKPINK                                  0xE7AAA5A5
#define COLOR_WHITE                                     0xffffffff
#define COLOR_LIGHTRED                                  0xFF6347FF
#define COLOR_RED                                       0xff0000ff
#define COLOR_DARKRED                                   0x800000ff
#define COLOR_LIGHTGREY                                 0xbfbfbfff
#define COLOR_GREY                                      0x808080ff
#define COLOR_DARKGREY                                  0x404040ff
#define COLOR_LIGHTYELLOW                               0xffff80ff
#define COLOR_YELLOW                                    0xffff00ff
#define COLOR_LOWYELLOW 								0xFFDD00ff
#define COLOR_OLIVE                                     0x808000ff
#define COLOR_LIME                                      0x00ff00ff
#define COLOR_GREEN                                     0x008000ff
#define COLOR_LIGHTGREEN                                0xD7FFB3FF
#define COLOR_PURPLE                                    0xC2A2DAAA
#define COLOR_ORANGE                                    0xFFA500FF
#define COLOR_CLIENT                                    0xA9C4E4FF
#define COLOR_TAN                                       0xceb089ff
#define COLOR_PERU                                      0xCD853FFF
#define COLOR_TEAL										0x008080FF

#define C_SERVER										"{008080}"

#define C_DARKPINK                                  	"{E7AAA5}"
#define C_WHITE                                     	"{ffffff}"
#define C_LIGHTRED                                  	"{FF6347}"
#define C_RED                                       	"{ff0000}"
#define C_DARKRED                                   	"{800000}"
#define C_LIGHTGREY                                 	"{bfbfbf}"
#define C_GREY                                      	"{808080}"
#define C_DARKGREY                                  	"{404040}"
#define C_LIGHTYELLOW                               	"{ffff80}"
#define C_YELLOW                                    	"{ffff00}"
#define C_LOWYELLOW 									"{FFDD00}"
#define C_OLIVE                                     	"{808000}"
#define C_LIME                                      	"{00ff00}"
#define C_GREEN                                     	"{008000}"
#define C_LIGHTGREEN                                	"{D7FFB3}"
#define C_PURPLE                                    	"{C2A2DA}"
#define C_ORANGE                                    	"{FFA500}"
#define C_CLIENT                                    	"{A9C4E4}"
#define C_TAN                                       	"{ceb089}"
#define C_PERU                                      	"{CD853F}"
#define C_TEAL											"{008080}"

new
	aVehicleNames[212][] =
	{
		{"Landstalker"}, {"Bravura"}, {"Buffalo"}, {"Linerunner"}, {"Perennial"}, {"Sentinel"}, {"Dumper"}, {"Firetruck"}, {"Trashmaster"}, {"Stretch"}, {"Manana"}, {"Infernus"}, 
		{"Voodoo"}, {"Pony"}, {"Mule"}, {"Cheetah"}, {"Ambulance"}, {"Leviathan"}, {"Moonbeam"}, {"Esperanto"}, {"Taxi"}, {"Washington"}, {"Bobcat"}, {"Mr Whoopee"}, {"BF Injection"},
		{"Hunter"}, {"Premier"}, {"Enforcer"}, {"Securicar"}, {"Banshee"}, {"Predator"}, {"Bus"}, {"Rhino"}, {"Barracks"}, {"Hotknife"}, {"Trailer"}, {"Previon"}, {"Coach"}, {"Cabbie"},
		{"Stallion"}, {"Rumpo"}, {"RC Bandit"}, {"Romero"}, {"Packer"}, {"Monster"}, {"Admiral"}, {"Squalo"}, {"Seasparrow"}, {"Pizzaboy"}, {"Tram"}, {"Trailer"}, {"Turismo"}, {"Speeder"}, 
		{"Reefer"}, {"Tropic"}, {"Flatbed"}, {"Yankee"}, {"Caddy"}, {"Solair"}, {"Berkley's RC Van"}, {"Skimmer"}, {"PCJ-600"}, {"Faggio"}, {"Freeway"}, {"RC Baron"}, {"RC Raider"},
		{"Glendale"}, {"Oceanic"}, {"Sanchez"}, {"Sparrow"}, {"Patriot"}, {"Quad"}, {"Coastguard"}, {"Dinghy"}, {"Hermes"}, {"Sabre"}, {"Rustler"}, {"ZR-350"}, {"Walton"}, {"Regina"},
		{"Comet"}, {"BMX"}, {"Burrito"}, {"Camper"}, {"Marquis"}, {"Baggage"}, {"Dozer"}, {"Maverick"}, {"News Chopper"}, {"Rancher"}, {"FBI Rancher"}, {"Virgo"}, {"Greenwood"}, {"Jetmax"}, 
		{"Hotring"}, {"Sandking"}, {"Blista Compact"}, {"Police Maverick"}, {"Boxville"}, {"Benson"}, {"Mesa"}, {"RC Goblin"}, {"Hotring Racer A"}, {"Hotring Racer B"}, {"Bloodring Banger"}, 
		{"Rancher"}, {"Super GT"}, {"Elegant"}, {"Journey"}, {"Bike"}, {"Mountain Bike"}, {"Beagle"}, {"Cropduster"}, {"Stuntplane"}, {"Tanker"}, {"Road Train"}, {"Nebula"}, {"Majestic"}, 
		{"Buccaneer"}, {"Shamal"}, {"Hydra"}, {"FCR-900"}, {"NRG-500"}, {"HPV-1000"}, {"Cement Truck"}, {"Tow Truck"}, {"Fortune"}, {"Cadrona"}, {"FBI Truck"}, {"Willard"}, {"Forklift"}, 
		{"Tractor"}, {"Combine"}, {"Feltzer"}, {"Remington"}, {"Slamvan"}, {"Blade"}, {"Freight"}, {"Streak"}, {"Vortex"}, {"Vincent"}, {"Bullet"}, {"Clover"}, {"Sadler"}, {"Firetruck"}, 
		{"Hustler"}, {"Intruder"}, {"Primo"}, {"Cargobob"}, {"Tampa"}, {"Sunrise"}, {"Merit"}, {"Utility"}, {"Nevada"}, {"Yosemite"}, {"Windsor"}, {"Monster A"}, {"Monster B"}, {"Uranus"},
		{"Jester"}, {"Sultan"}, {"Stratum"}, {"Elegy"}, {"Raindance"}, {"RC Tiger"}, {"Flash"}, {"Tahoma"}, {"Savanna"}, {"Bandito"}, {"Freight"}, {"Trailer"}, {"Kart"}, {"Mower"}, 
		{"Duneride"}, {"Sweeper"}, {"Broadway"}, {"Tornado"}, {"AT-400"}, {"DFT-30"}, {"Huntley"}, {"Stafford"}, {"BF-400"}, {"Newsvan"}, {"Tug"}, {"Trailer"}, {"Emperor"}, {"Wayfarer"}, 
		{"Euros"}, {"Hotdog"}, {"Club"}, {"Trailer"}, {"Trailer"}, {"Andromada"}, {"Dodo"}, {"RCCam"}, {"Launch"}, {"Police Car (LSPD)"}, {"Police Car (SFPD)"}, {"Police Car (LVPD)"}, 
		{"Police Ranger"}, {"Picador"}, {"S.W.A.T. Van"}, {"Alpha"}, {"Phoenix"}, {"Glendale"}, {"Sadler"}, {"Luggage Trailer A"}, {"Luggage Trailer B"}, {"Stair Trailer"}, {"Boxville"}, 
		{"Farm Plow"}, {"Utility Trailer"}
	}
;

#define GetVehicleName(%0) aVehicleNames[%0 - 400]

#define MAX_JOBS 1
#define MAX_BUSINESS 2
#define DEFAULT_SKIN 250

stock strmatch(const String1[], const String2[])
{
 	if((!strcmp(String1, String2, true, strlen(String2))) && (strlen(String2) == strlen(String1)))
 		return true;

 	return false;
}

stock GetVehicleSpeed(vehicleid)
{
	new
		Float: VelX,
		Float: VelY,
		Float: VelZ
	;

	GetVehicleVelocity(vehicleid, VelX, VelY, VelZ);

	return floatround(1.61 * floatsqroot(floatpower(floatabs(VelX), 2.0) + floatpower(floatabs(VelY), 2.0) + floatpower(floatabs(VelZ), 2.0)) * 99.38); 
}

stock FormatNumber(iNum, const szChar[] = ",")
{
	new
		szStr[25]
	;

	format(szStr, sizeof(szStr), "%d", iNum);

	for(new iLen = strlen(szStr) - 3; iLen > 0; iLen -= 3)
	{
		strins(szStr, szChar, iLen);
	}

	return szStr;
}

new
	VehicleType[sizeof(aVehicleNames)]
;

function LoadVehiclesType()
{
	new
		bikeVehicles[3] =
		{
			481, 509, 510
		},
		planeVehicles[23] =
		{
			417, 425, 447, 460, 464, 465, 469, 476, 487, 488, 497, 501, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593
		},
		boatVehicles[10] =
		{
			430, 446, 452, 453, 454, 472, 473, 484, 493, 595
		}
	;

	for(new i = 0; i < sizeof(bikeVehicles); i++)
	{
		VehicleType[bikeVehicles[i] - 400] = 1;
	}

	for(new i = 0; i < sizeof(planeVehicles); i++)
	{
		VehicleType[planeVehicles[i] - 400] = 2;
	}

	for(new i = 0; i < sizeof(boatVehicles); i++)
	{
		VehicleType[boatVehicles[i] - 400] = 3;
	}

	return true;
}

function bool: IsABike(vehicleid)
{
	if(VehicleType[GetVehicleModel(vehicleid) - 400] == 1)
	{
		return true;
	}

	return false;
}

function bool: IsAPlane(vehicleid)
{
	if(VehicleType[GetVehicleModel(vehicleid) - 400] == 2)
	{
		return true;
	}

	return false;
}

function bool: IsABoat(vehicleid)
{
	if(VehicleType[GetVehicleModel(vehicleid) - 400] == 3)
	{
		return true;
	}

	return false;
}

new
	Float: SpawnPos[4] =
	{
		1642.0894, -2241.6770, 13.4939, 174.2387
	}
;

main()
{

}

new
	MySQL: SQL,
	gString[256],
	Text: DateAndTimeTD,
	PlayerText: ServerPTD,
	PlayerText: SpeedometerPTD,
	PlayerText: InfoPTD
;

new BigInt:PlayerCash[MAX_PLAYERS];

enum PlayerEnum
{
	pSQLID,
	pUserName[MAX_PLAYER_NAME + 1],
	pPassword[32 + 1],
	bool: pLogat,
	pJob,
	pAdmin,
	pOwnedBusiness,
	bool: pFpsText,
	bool: pServerText,

	pSession,
	pAttemps,
	pArea,
	pDrunkLevelLast,
	pFPS,
	pDeelayPassword
}

new
	PlayerInfo[MAX_PLAYERS][PlayerEnum],
	CP[MAX_PLAYERS],
	InJobZone[MAX_PLAYERS],
	JobVehicle[MAX_PLAYERS],
	JobCP[MAX_PLAYERS],
	bool: VehicleEngine[MAX_VEHICLES],
	bool: VehicleLocked[MAX_VEHICLES],
	InBusinessZone[MAX_PLAYERS],
	RentVehicle[MAX_PLAYERS],
	LastVehicle[MAX_PLAYERS],
	Timer: StopWork[MAX_PLAYERS],
	Float: CheckPointX[MAX_PLAYERS],
	Float: CheckPointY[MAX_PLAYERS],
	Float: CheckPointZ[MAX_PLAYERS],
	bool: InSpawnZone[MAX_PLAYERS],
	bool: JobWorking[MAX_VEHICLES]
;

new
	Iterator: Nearby[MAX_PLAYERS]<MAX_PLAYERS>,
	Iterator: PlayersWithJob[MAX_JOBS + 1]<MAX_PLAYERS>,
	Iterator: LoggedPlayers<MAX_PLAYERS>,
	Iterator: PlayersWithState[10]<MAX_PLAYERS>,
	Iterator: Admins<MAX_PLAYERS>,
	Iterator: SpawnedVehicles<MAX_VEHICLES>,
	Iterator: FpsText<MAX_PLAYERS>
;

enum ServerEnum
{
	sHostName[128 + 1],
	sMode[16 + 1],
	sLanguage[16 + 1],
	sMapName[16 + 1],
	sWebUrl[32 + 1],
	bool: sMaintenance,
	sArea
}

new
	ServerInfo[ServerEnum]
;

enum AreaEnum
{
	aID, aType
}

new
	AreaInfo[250][AreaEnum],
	Areas = 0
;

stock CreateDynamicSphere2(type, id, Float:x, Float:y, Float:z, Float:size, worldid = -1, interiorid = -1, playerid = -1, priority = 0)
{
	new
		AreaID
	;

	AreaID = CreateDynamicSphere(x, y, z, size, worldid, interiorid, playerid, priority);
	AreaInfo[AreaID][aID] = id;
	AreaInfo[AreaID][aType] = type;

	Areas ++;

	return AreaID;
}

stock DestroyDynamicArea2(areaid)
{
	AreaInfo[areaid][aID] = 0;
	AreaInfo[areaid][aType] = 0;

	DestroyDynamicArea(areaid);

	Areas --;

	return true;
}

enum JobsEnum
{
	jName[32],
	Float: jX,
	Float: jY,
	Float: jZ
}

new
	JobsInfo[MAX_JOBS + 1][JobsEnum],
	JobsZones[MAX_JOBS + 1],
	JobsPickups[MAX_JOBS + 1],
	Text3D: JobsLabels[MAX_JOBS + 1],
	JobsIcons[MAX_JOBS + 1]
;

function LoadJobs()
{
	for(new JobID = 1; JobID <= cache_num_rows(); ++JobID)
	{
		new
			RowID = JobID - 1
		;

		cache_get_value_name(RowID, "Name", JobsInfo[JobID][jName]);
		cache_get_value_name_float(RowID, "X", JobsInfo[JobID][jX]);
		cache_get_value_name_float(RowID, "Y", JobsInfo[JobID][jY]);
		cache_get_value_name_float(RowID, "Z", JobsInfo[JobID][jZ]);

		new
			Float: X = JobsInfo[JobID][jX],
			Float: Y = JobsInfo[JobID][jY],
			Float: Z = JobsInfo[JobID][jZ]
		;

		JobsZones[JobID] = CreateDynamicSphere2(1, JobID, X, Y, Z, 1, 0, 0);
		JobsPickups[JobID] = CreateDynamicPickup(1210, 1, X, Y, Z);

		gString[0] = (EOS);
		format(gString, sizeof(gString), "Job: {ffffff}%s\nApasa "C_SERVER"Y{ffffff} pentru a-l lua.\nApasa "C_SERVER"N{ffffff} pentru a renunta la jobul actual.", JobsInfo[JobID][jName]);

		JobsLabels[JobID] = CreateDynamic3DTextLabel(gString, COLOR_SERVER, X, Y, Z, 20);
		JobsIcons[JobID] = CreateDynamicMapIcon(X, Y, Z, 37, 0);
	}

	printf("Au fost incarcate %d locuri de munca.", cache_num_rows());

	return true;
}

new
	Float: SweeperCPs[14][3] =
	{
		{1702.9667, -2251.3506, 13.3828},
		{1665.1061, -2251.5403, 13.3564},
		{1634.1821, -2251.7073, 13.3236},
		{1587.3904, -2251.9458, 13.3809},
		{1573.5681, -2270.2346, 13.3869},
		{1573.8702, -2311.4324, 13.3828},
		{1590.6062, -2322.2505, 13.3828},
		{1634.8295, -2321.9065, 13.3828},
		{1663.5283, -2321.6855, 13.3828},
		{1700.5293, -2321.8794, 13.3828},
		{1732.7638, -2322.0144, 13.3828},
		{1734.9193, -2296.4260, 13.3755},
		{1734.9965, -2270.9365, 13.3755},
		{1734.5887, -2254.1147, 13.3673}
	}
;

Dialog:ShowJobs(playerid, response, listitem, inputtext[])
{
	if(!response || listitem < 0)
		return true;

	new
		Job = listitem + 1,
		Float: X = JobsInfo[Job][jX],
		Float: Y = JobsInfo[Job][jY],
		Float: Z = JobsInfo[Job][jZ]
	;

	SetPlayerCheckpointEx(playerid, X, Y, Z, 3);
	CP[playerid] = 1;

	return true;
}

enum BusinessEnum
{
	bOwner[MAX_PLAYER_NAME + 1],
	Float: bX,
	Float: bY,
	Float: bZ,
	bType,
	bSafe,
	bPrice
}

new
	BusinessInfo[MAX_BUSINESS + 1][BusinessEnum],
	BusinessZones[MAX_BUSINESS + 1],
	BusinessPickups[MAX_BUSINESS + 1],
	Text3D: BusinessLabels[MAX_BUSINESS + 1],
	BusinessIcons[MAX_BUSINESS + 1],
	TotalBusiness,
	BusinessNames[3][15] = {"", "Rent Vehicle", "Repair Vehicle"},
	BusinessIndications[3][] = {"", "Apasa tasta "C_SERVER"Y", "Apasa tasta "C_SERVER"H"},
	BizOwnerGameID[MAX_BUSINESS + 1]
;

function UpdateBusiness(BusinessID)
{
	new
		Float: X = BusinessInfo[BusinessID][bX],
		Float: Y = BusinessInfo[BusinessID][bY],
		Float: Z = BusinessInfo[BusinessID][bZ],
		Owner[MAX_PLAYER_NAME + 1],
		BizType = BusinessInfo[BusinessID][bType],
		BizPrice = BusinessInfo[BusinessID][bPrice],

		MapIcons[3] = {0, 55, 63},
		AreaRanges[3] = {0, 1, 5},

		Type[16],
		MapIcon,
		AreaRange,
		Indication[32]
	;

	format(Owner, sizeof(Owner), BusinessInfo[BusinessID][bOwner]);

	format(Type, sizeof(Type), BusinessNames[BizType]);
	MapIcon = MapIcons[BizType];
	AreaRange = AreaRanges[BizType];

	format(Indication, sizeof(Indication), BusinessIndications[BizType]);

	DestroyDynamicArea2(BusinessZones[BusinessID]);
	BusinessZones[BusinessID] = CreateDynamicSphere2(2, BusinessID, X, Y, Z, AreaRange, 0, 0);

	DestroyDynamicPickup(BusinessPickups[BusinessID]);
	BusinessPickups[BusinessID] = CreateDynamicPickup(1274, 1, X, Y, Z);

	DestroyDynamic3DTextLabel(BusinessLabels[BusinessID]);

	gString[0] = (EOS);

	if(BizPrice < 1)
	{
		format(gString, sizeof(gString), "Afacerea: {ffffff}%d\n"C_SERVER"Detinator: {ffffff}%s\n"C_SERVER"Tip: {ffffff}%s\n%s",
			BusinessID, Owner, Type, Indication);
	}
	else
	{
		format(gString, sizeof(gString), "Afacerea: {ffffff}%d\n"C_SERVER"Detinator: {ffffff}%s\n"C_SERVER"Tip: {ffffff}%s\n%s\n"C_SERVER"Pret: {ffffff}$%s",
			BusinessID, Owner, Type, Indication, FormatNumber(BizPrice));
	}

	BusinessLabels[BusinessID] = CreateDynamic3DTextLabel(gString, COLOR_SERVER, X, Y, Z, 20);

	DestroyDynamicMapIcon(BusinessIcons[BusinessID]);
	BusinessIcons[BusinessID] = CreateDynamicMapIcon(X, Y, Z, MapIcon, 0);

	return true;
}

function LoadBusiness()
{
	for(new BusinessID = 1; BusinessID <= cache_num_rows(); ++BusinessID)
	{
		new
			RowID = BusinessID - 1
		;

		cache_get_value_name(RowID, "Owner", BusinessInfo[BusinessID][bOwner]);
		cache_get_value_name_float(RowID, "X", BusinessInfo[BusinessID][bX]);
		cache_get_value_name_float(RowID, "Y", BusinessInfo[BusinessID][bY]);
		cache_get_value_name_float(RowID, "Z", BusinessInfo[BusinessID][bZ]);
		cache_get_value_name_int(RowID, "Type", BusinessInfo[BusinessID][bType]);
		cache_get_value_name_int(RowID, "Safe", BusinessInfo[BusinessID][bSafe]);
		cache_get_value_name_int(RowID, "Price", BusinessInfo[BusinessID][bPrice]);

		UpdateBusiness(BusinessID);

		TotalBusiness ++;

		BizOwnerGameID[BusinessID] = INVALID_PLAYER_ID;
	}

	printf("Au fost incarcate %d afaceri.", cache_num_rows());

	return true;
}

stock SetRcon(const command[], const value[])
{
	return SendRconCommand(va_return("%s %s", command, value));
}


function SetInfo()
{
	SetRcon("hostname", ServerInfo[sHostName]);
	SetGameModeText(ServerInfo[sMode]);
	SetRcon("language", ServerInfo[sLanguage]);
	SetRcon("mapname", ServerInfo[sMapName]);
	SetRcon("weburl", ServerInfo[sWebUrl]);

	if(ServerInfo[sMaintenance])
	{
		SendRconCommand("password alksdnasqw");
	}

	return true;
}

function LoadServerInfo()
{
	if(!cache_num_rows())
		return true;

	cache_get_value_name(0, "HostName", ServerInfo[sHostName]);
	cache_get_value_name(0, "Mode", ServerInfo[sMode]);
	cache_get_value_name(0, "Language", ServerInfo[sLanguage]);
	cache_get_value_name(0, "MapName", ServerInfo[sMapName]);
	cache_get_value_name(0, "WebUrl", ServerInfo[sWebUrl]);
	cache_get_value_name_bool(0, "Maintenance", ServerInfo[sMaintenance]);

	SetInfo();

	return true;
}

function LoadTextdraws()
{
	DateAndTimeTD = TextDrawCreate(577.000000, 10.000000, "00:00:00~n~~w~~h~00/00/0000");
	TextDrawFont(DateAndTimeTD, 1);
	TextDrawLetterSize(DateAndTimeTD, 0.300000, 1.500000);
	TextDrawTextSize(DateAndTimeTD, 400.000000, 125.000000);
	TextDrawSetOutline(DateAndTimeTD, 1);
	TextDrawSetShadow(DateAndTimeTD, 0);
	TextDrawAlignment(DateAndTimeTD, 2);
	TextDrawColor(DateAndTimeTD, COLOR_SERVER);
	TextDrawBackgroundColor(DateAndTimeTD, 255);
	TextDrawBoxColor(DateAndTimeTD, 50);
	TextDrawUseBox(DateAndTimeTD, 0);
	TextDrawSetProportional(DateAndTimeTD, 1);
	TextDrawSetSelectable(DateAndTimeTD, 0);

	return true;
}

public OnGameModeInit()
{
	mysql_log();

	SQL = mysql_connect_file();

	if(mysql_errno(SQL))
	{
		format(ServerInfo[sHostName], 128, "Gamemode De La Zero - Mentenanta");
		format(ServerInfo[sMode], 16, "-");
		format(ServerInfo[sLanguage], 16, "-");
		format(ServerInfo[sMapName], 16, "-");
		format(ServerInfo[sWebUrl], 16, "-");
		ServerInfo[sMaintenance] = true;

		SetInfo();

		print("Conexiunea cu baza de date a esuat.");
	}

	else
	{
		gString[0] = (EOS);
		mysql_format(SQL, gString, sizeof(gString), "select * from variables");
		mysql_tquery(SQL, gString, "LoadServerInfo", "");

		DisableInteriorEnterExits();
		AllowInteriorWeapons(1);
		UsePlayerPedAnims();
		SetNameTagDrawDistance(30);
		EnableStuntBonusForAll(0);
		LimitPlayerMarkerRadius(5.0);
		ManualVehicleEngineAndLights();
		ShowPlayerMarkers(PLAYER_MARKERS_MODE_STREAMED);

		ServerInfo[sArea] = CreateDynamicSphere2(3, 0, SpawnPos[0], SpawnPos[1], SpawnPos[2], 100);

		print("Conexiunea cu baza de date s-a realizat cu succes.");
	}

	mysql_tquery(SQL, "select * from jobs", "LoadJobs", "");
	mysql_tquery(SQL, "select * from business", "LoadBusiness", "");

	LoadTextdraws();

	LoadServerObjects();

	for(new i = 0; i < 10; i++)
	{
		Iter_Clear(PlayersWithState[i]);
	}

	for(new i = 0; i <= MAX_JOBS; i++)
	{
		Iter_Clear(PlayersWithJob[i]);
	}

	Iter_Clear(Admins);

	Iter_Clear(SpawnedVehicles);

	Iter_Clear(FpsText);

	LoadVehiclesType();

	return true;
}

public OnGameModeExit()
{
	if(SQL)
	{
		mysql_close(SQL);
	}

	return true;
}

stock SetPlayerPosition(playerid, Float: X, Float: Y, Float: Z, Float: Angle = 0.0)
{
	SetPlayerPos(playerid, X, Y, Z);
	SetPlayerFacingAngle(playerid, Angle);
	SetCameraBehindPlayer(playerid);

	return true;
}

timer Spawn[50](playerid, session)
{
	if(GetSession(playerid) != session)
		return true;

	if(IsPlayerInAnyVehicle(playerid))
	{
		new
			Float: X,
			Float: Y,
			Float: Z
		;
		GetPlayerPos(playerid, X, Y, Z);
		SetPlayerPosition(playerid, X, Y, Z + 1);
	}

	SpawnPlayer(playerid);

	return true;
}

timer KickEx[200](playerid, session)
{
	if(GetSession(playerid) != session)
		return true;

	Kick(playerid);

	return true;
}

function ClearChat(playerid, rows)
{
	for(new i = 0; i < rows; i ++)
	{
		SendClientMessage(playerid, -1, " ");
	}

	return true;
}

stock SendMsg(playerid, color, const message[], va_args<>)
{
	if(!IsPlayerConnected(playerid))
		return false;

	new
		out[256]
	;

	va_format(out, sizeof out, message, va_start<3>);

	return SendSplitMessage(playerid, color, out);
}

stock WithoutAcces(playerid)
{
	return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}Nu ai acces la aceasta comanda.");
}

stock SendSplitMessage(playerid, color, const message[])
{
	if(!IsPlayerConnected(playerid))
		return false;

	new
		lin = strlen(message) / 128,
		line[128 + 5],
		index
	;

	if((strlen(message) % 128))
	{
		lin++;
	}

	while(index < lin)
	{
		if(index == 0)
		{
			strmid(line, message, (index * 128), (index * 128) + 128);
		}
		else
		{
			strmid(line, message, (index * 128), (index * 128) + 128);
		}

		if(lin > 1)
		{
			if(index == 0)
			{
				format(line, sizeof line, "%s ...", line);
			}
			else if(index > 0 && (index + 1) < lin)
			{
				format(line, sizeof line, "%s ...", line);
			}
			else
			{
				format(line, sizeof line, "... %s", line);
			}
		}

		SendClientMessage(playerid, color, line);

		index++;
	}

	return true;
}

function Query_Mysql(const text[], va_args<>)
{
	gString[0] = (EOS);

	va_format(gString, sizeof(gString), text, va_start<1>);

	mysql_tquery(SQL, gString);

	return true;	
}

timer KickLogin[60000](playerid, session)
{
	if(GetSession(playerid) != session || PlayerInfo[playerid][pLogat] == true)
		return true;

	SendMsg(playerid, COLOR_LIGHTRED, "Logare >> {ffffff}Ai fost dat afara deoarece nu te-ai logat in 60 de secunde.");

	defer KickEx(playerid, GetSession(playerid));

	return true;
}

function CheckAccount(playerid, session)
{
	if(GetSession(playerid) != session)
		return true;

	if(!cache_num_rows())
	{
		Dialog_Show(playerid, Register, DIALOG_STYLE_PASSWORD,
			""C_SERVER"Inregistrare", "Bine ai venit %s!\nDeoarece nu ai un cont inregistrat trebuie sa introduci parola pe care o vrei:", "Inainte", "Anulare", GetName(playerid));
	}

	else
	{
		cache_get_value_name(0, "Password", PlayerInfo[playerid][pPassword]);

		Dialog_Show(playerid, Login, DIALOG_STYLE_PASSWORD,
			""C_SERVER"Logare", "Bine ai revenit %s!\nTe rugam sa introduci parola contului:", "Logare", "Anulare", GetName(playerid));
	}

	defer KickLogin(playerid, GetSession(playerid));

	InterpolateCameraPos(playerid, 1337.892822, -2253.284667, 189.627777, 1604.068969, -2254.711181, 16.733802, 60000);
	InterpolateCameraLookAt(playerid, 1341.931274, -2253.350830, 186.680419, 1608.735473, -2252.978759, 16.262168, 60000);

	return true;
}

function LoadPlayersTextdraws(playerid)
{
	ServerPTD = CreatePlayerTextDraw(playerid, 638.732788, 434.866973, "qAlexGT3 / RPG.DeLaZero.Ro");
	PlayerTextDrawLetterSize(playerid, ServerPTD, 0.349999, 1.250000);
	PlayerTextDrawAlignment(playerid, ServerPTD, 3);
	PlayerTextDrawColor(playerid, ServerPTD, -1);
	PlayerTextDrawSetShadow(playerid, ServerPTD, 0);
	PlayerTextDrawSetOutline(playerid, ServerPTD, 1);
	PlayerTextDrawBackgroundColor(playerid, ServerPTD, 255);
	PlayerTextDrawFont(playerid, ServerPTD, 1);
	PlayerTextDrawSetProportional(playerid, ServerPTD, 1);
	PlayerTextDrawSetShadow(playerid, ServerPTD, 0);

	SpeedometerPTD = CreatePlayerTextDraw(playerid, 558.666015, 139.807479, "Viteza: ~g~197~w~ km/h~n~Combustibil: ~g~100~w~ %~n~Stare: ~g~Descuiat~w~");
	PlayerTextDrawLetterSize(playerid, SpeedometerPTD, 0.273333, 1.230814);
	PlayerTextDrawAlignment(playerid, SpeedometerPTD, 2);
	PlayerTextDrawColor(playerid, SpeedometerPTD, -1);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD, 0);
	PlayerTextDrawSetOutline(playerid, SpeedometerPTD, 1);
	PlayerTextDrawBackgroundColor(playerid, SpeedometerPTD, 255);
	PlayerTextDrawFont(playerid, SpeedometerPTD, 1);
	PlayerTextDrawSetProportional(playerid, SpeedometerPTD, 1);
	PlayerTextDrawSetShadow(playerid, SpeedometerPTD, 0);

	InfoPTD = CreatePlayerTextDraw(playerid, 2.000000, 435.000000, "FPS: ~g~102~w~, TickRate: ~r~197~w~, Queries: ~b~0~w~");
	PlayerTextDrawLetterSize(playerid, InfoPTD, 0.349999, 1.250000);
	PlayerTextDrawAlignment(playerid, InfoPTD, 1);
	PlayerTextDrawColor(playerid, InfoPTD, -1);
	PlayerTextDrawSetShadow(playerid, InfoPTD, 0);
	PlayerTextDrawSetOutline(playerid, InfoPTD, 1);
	PlayerTextDrawBackgroundColor(playerid, InfoPTD, 255);
	PlayerTextDrawFont(playerid, InfoPTD, 1);
	PlayerTextDrawSetProportional(playerid, InfoPTD, 1);
	PlayerTextDrawSetShadow(playerid, InfoPTD, 0);

	return true;
}

function RemoveBuildings(playerid)
{
	// Scoaterea usilor de la PNS / Tuning

	RemoveBuildingForPlayer(playerid, 5043, 1843.3672, -1856.3203, 13.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 5340, 2644.8594, -2039.2344, 14.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 5422, 2071.4766, -1831.4219, 14.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 5856, 1024.9844, -1029.3516, 33.1953, 0.25);
	RemoveBuildingForPlayer(playerid, 5779, 1041.3516, -1025.9297, 32.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 6400, 488.2813, -1734.6953, 12.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 10575, -2716.3516, 217.4766, 5.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 11313, -1935.8594, 239.5313, 35.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 11319, -1904.5313, 277.8984, 42.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 10182, -1786.8125, 1209.4219, 25.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 9625, -2425.7266, 1027.9922, 52.2813, 0.25);
	RemoveBuildingForPlayer(playerid, 9093, 2386.6563, 1043.6016, 11.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 8957, 2393.7656, 1483.6875, 12.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 7707, 2006.0000, 2317.6016, 11.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 7709, 2006.0000, 2303.7266, 11.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 7891, 1968.7422, 2162.4922, 12.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3294, -1420.5469, 2591.1563, 57.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 3294, -100.0000, 1111.4141, 21.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 13028, 720.0156, -462.5234, 16.8594, 0.25);

	return true;
}

function LoadServerObjects()
{
	// Blocarea PNS-urilor / Tuning-urilor

	CreateDynamicObject(971, 2644.55054, -2039.13464, 12.89975,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, 2071.58008, -1829.81091, 15.23893,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(971, 488.28699, -1735.55908, 11.63846,   0.00000, 0.00000, -9.12000);
	CreateDynamicObject(971, 1024.24243, -1029.38586, 32.36301,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, 1042.55286, -1026.02380, 32.65329,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, 1843.25757, -1855.40625, 11.99723,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(971, 720.14453, -462.55170, 16.98898,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, 2393.66211, 1483.26465, 12.30741,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, 2387.06421, 1043.53137, 9.81760,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, 1968.48047, 2162.39648, 12.54340,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(971, -99.49019, 1111.39429, 21.00288,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, -1420.76270, 2591.05469, 57.13466,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, -1786.70667, 1209.32141, 24.44315,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, -1936.56226, 238.51527, 33.79247,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, -1904.95825, 277.79831, 42.75303,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, 2005.38562, 2317.61084, 9.33942,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, 2005.14612, 2303.67261, 9.35197,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, -2425.88623, 1028.28540, 52.30915,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(971, -2716.04639, 217.72780, 3.80503,   0.00000, 0.00000, 90.00000);

	return true;
}

public OnPlayerConnect(playerid)
{	
	new
		gol[PlayerEnum]
	;

	PlayerInfo[playerid] = gol;

	PlayerInfo[playerid][pSession] = gettime();

	CP[playerid] = 0;
	InJobZone[playerid] = 0;
	InBusinessZone[playerid] = 0;
	RentVehicle[playerid] = 0;
	JobVehicle[playerid] = 0;
	LastVehicle[playerid] = 0;
	CheckPointX[playerid] = 0;
	CheckPointY[playerid] = 0;
	CheckPointZ[playerid] = 0;
	InSpawnZone[playerid] = false;
	JobWorking[playerid] = false;

	resetBigInt(PlayerCash[playerid]);

	InitFly(playerid);

	SetPlayerColor(playerid, COLOR_GREY);
	GetPlayerName(playerid, PlayerInfo[playerid][pUserName], MAX_PLAYER_NAME + 1);
	ClearChat(playerid, 20);
	TogglePlayerSpectating(playerid, true);

	RemoveBuildings(playerid);

	LoadPlayersTextdraws(playerid);

	if(strmatch(GetName(playerid), "Server"))
	{
		SendMsg(playerid, COLOR_LIGHTRED, "Server >> {ffffff}Nu poti avea acest nume");

		defer KickEx(playerid, GetSession(playerid));

		return true;
	}

	gString[0] = (EOS);
	mysql_format(SQL, gString, sizeof(gString), "select * from accounts where name = '%s'", GetName(playerid));
	mysql_tquery(SQL, gString, "CheckAccount", "id", playerid, GetSession(playerid));

	return true;
}

function SendAdmins(color, const string[], va_args<>)
{
	gString[0] = (EOS);

	va_format(gString, sizeof(gString), string, va_start<2>);

	foreach(new x : Admins)
	{
		SendMsg(x, color, gString);
	}

	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(Iter_Contains(FpsText, playerid))
	{
		Iter_Remove(FpsText, playerid);
	}

	if(PlayerInfo[playerid][pArea])
	{
		DestroyDynamicArea2(PlayerInfo[playerid][pArea]);
	}

	foreach(new x : Nearby[playerid])
	{		
		SendMsg(x, COLOR_SERVER, "Nearby >> {ffffff}%s s-a deconectat de pe server.", GetName(playerid));

		if(Iter_Contains(Nearby[x], playerid))
		{
			Iter_Remove(Nearby[x], playerid);
		}
	}

	Iter_Clear(Nearby[playerid]);

	for(new i = 0; i < 10; i++)
	{
		if(Iter_Contains(PlayersWithState[i], playerid))
		{
			Iter_Remove(PlayersWithState[i], playerid);
		}
	}

	if(Iter_Contains(Admins, playerid))
	{
		Iter_Remove(Admins, playerid);

		SendAdmins(COLOR_ORANGE, "Admin-ul %s s-a deconectat de pe server.", GetName(playerid));
	}

	if(PlayerInfo[playerid][pLogat] != false)
	{
		new
			Cash[32],
			Job = PlayerInfo[playerid][pJob],
			bool: FpsText = PlayerInfo[playerid][pFpsText],
			bool: ServerText = PlayerInfo[playerid][pServerText],
			ID = PlayerInfo[playerid][pSQLID]
		;

		format(Cash, sizeof(Cash), valueBigInt(PlayerCash[playerid]));

		gString[0] = (EOS);
		mysql_format(SQL, gString, sizeof(gString), "update accounts set Cash = '%s', Job = %d, FpsText = %d, ServerText = %d where id = %d", Cash, Job, FpsText, ServerText, ID);
		mysql_tquery(SQL, gString);

		Iter_Remove(LoggedPlayers, playerid);
	}

	if(PlayerInfo[playerid][pJob] != 0)
	{
		new
			Job = PlayerInfo[playerid][pJob]
		;

		Iter_Remove(PlayersWithJob[Job], playerid);
	}

	if(JobVehicle[playerid] != 0)
	{
		DestroyVehicle(JobVehicle[playerid]);
	}

	if(RentVehicle[playerid] != 0)
	{
		DestroyVehicle(RentVehicle[playerid]);
	}

	if(PlayerInfo[playerid][pOwnedBusiness] != 0)
	{
		new
			Biz = PlayerInfo[playerid][pOwnedBusiness]
		;

		BizOwnerGameID[Biz] = INVALID_PLAYER_ID;
	}

	SendNearbyMessage(playerid, COLOR_TEAL, "Nearby >> {ffffff}%s s-a deconectat de pe server.", GetName(playerid));

	return true;
}

Dialog:Register(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		defer KickEx(playerid, GetSession(playerid));
		return true;
	}

	if(strlen(inputtext) < 4 || strlen(inputtext) > 32)
		return SendMsg(playerid, COLOR_LIGHTRED, "Register >> {ffffff}Parola trebuie sa fie cuprinsa intre 4 si 128 de caractere.");

	format(PlayerInfo[playerid][pPassword], 32 + 1, MD5_Hash(inputtext));

	Dialog_Show(playerid, Register2, DIALOG_STYLE_INPUT, "Inregistrare", "Te rugam introdu-ti adresa de e-mail:", "Inainte", "Anuleaza");

	return true;
}

function InsertAccount(playerid, session)
{
	if(!IsPlayerConnected(playerid) || GetSession(playerid) != session)
		return true;

	OnPlayerLogin(playerid, PlayerInfo[playerid][pPassword]);

	return true;
}

Dialog:Register2(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		defer KickEx(playerid, GetSession(playerid));
		return true;
	}

	if(strlen(inputtext) < 16 || strlen(inputtext) > 64)
	{
		Dialog_Show(playerid, Register2, DIALOG_STYLE_INPUT, ""C_SERVER"Inregistrare", "Te rugam introdu-ti adresa de e-mail:", "Inainte", "Anuleaza");

		SendMsg(playerid, COLOR_SERVER, "Inregistrare >> {ffffff}Adresa de e-mail trebuie sa fie cuprinsa intre 16 si 64 de caractere.");

		return true;
	}

	new
		Name[MAX_PLAYER_NAME + 1],
		Password[128 + 1],
		Email[64 + 1]
	;

	format(Name, sizeof(Name), GetName(playerid));
	format(Password, sizeof(Password), PlayerInfo[playerid][pPassword]);
	format(Email, sizeof(Email), inputtext);

	gString[0] = (EOS);
	mysql_format(SQL, gString, sizeof(gString), "insert into accounts (Name, Password, Email) values ('%s', '%s', '%s')", Name, Password, Email);
	mysql_tquery(SQL, gString, "InsertAccount", "id", playerid, GetSession(playerid));

	return true;
}

function LoadPlayerBusiness(playerid, Session)
{
	if(GetSession(playerid) != Session)
		return true;

	if(cache_num_rows() < 1)
		return true;

	cache_get_value_name_int(0, "ID", PlayerInfo[playerid][pOwnedBusiness]);

	new
		Biz = PlayerInfo[playerid][pOwnedBusiness]
	;

	BizOwnerGameID[Biz] = playerid;

	return true;
}

function EnableFPS(playerid)
{
	Iter_Add(FpsText, playerid);
	PlayerTextDrawSetString(playerid, InfoPTD, "Se incarca...");
	PlayerTextDrawShow(playerid, InfoPTD);

	return true;
}

function LoadPlayerAccount(playerid, session)
{
	if(GetSession(playerid) != session)
		return true;

	cache_get_value_name_int(0, "ID", PlayerInfo[playerid][pSQLID]);
	cache_get_value_name_bigint(PlayerCash[playerid], 0, "Cash");
	cache_get_value_name_int(0, "Job", PlayerInfo[playerid][pJob]);
	cache_get_value_name_int(0, "Admin", PlayerInfo[playerid][pAdmin]);
	cache_get_value_name_bool(0, "FpsText", PlayerInfo[playerid][pFpsText]);

	if(PlayerInfo[playerid][pFpsText] == true)
	{
		EnableFPS(playerid);
	}

	cache_get_value_name_bool(0, "ServerText", PlayerInfo[playerid][pServerText]);

	gString[0] = (EOS);
	mysql_format(SQL, gString, sizeof(gString), "select * from business where owner = '%s'", GetName(playerid));
	mysql_tquery(SQL, gString, "LoadPlayerBusiness", "id", playerid, GetSession(playerid));

	ResetPlayerMoney(playerid);

	if(OPByte(PlayerCash[playerid], <=, #999_999_999))
	{
		GivePlayerMoney(playerid, bytes32(PlayerCash[playerid]));
	}
	else
	{
		GivePlayerMoney(playerid, 999_999_999);
	}

	SetPlayerColor(playerid, COLOR_WHITE);

	PlayerInfo[playerid][pLogat] = true;

	ClearChat(playerid, 20);

	if(PlayerInfo[playerid][pJob] != 0)
	{
		new
			Job = PlayerInfo[playerid][pJob]
		;

		Iter_Add(PlayersWithJob[Job], playerid);
	}

	if(PlayerInfo[playerid][pAdmin] != 0)
	{
		Iter_Add(Admins, playerid);

		SendAdmins(COLOR_ORANGE, "Admin-ul %s s-a conectat pe server.", GetName(playerid));
	}

	SendMsg(playerid, COLOR_SERVER, "Server >> {ffffff}Bine ai revenit, %s!", GetName(playerid));

	PlayerInfo[playerid][pArea] = CreateDynamicSphere2(4, playerid, 0, 0, 0, 30);
	AttachDynamicAreaToPlayer(PlayerInfo[playerid][pArea], playerid);

	Iter_Add(LoggedPlayers, playerid);

	new
		ServerString[128]
	;

	format(ServerString, sizeof(ServerString), "%s / RPG.DeLaZero.Ro", GetName(playerid));

	PlayerTextDrawSetString(playerid, ServerPTD, ServerString);
	PlayerTextDrawShow(playerid, ServerPTD);

	TextDrawShowForPlayer(playerid, DateAndTimeTD);

	LoadPlayerSpawn(playerid);

	TogglePlayerSpectating(playerid, false);

	return true;
}

function OnPlayerLogin(playerid, password[])
{	
	if(strcmp(password, PlayerInfo[playerid][pPassword], false, 32 + 1))
	{
		if(PlayerInfo[playerid][pAttemps] > 2)
		{
			SendMsg(playerid, COLOR_LIGHTRED, "Logare >> {ffffff}Ai fost dat afara de pe server deoarece ai gresit parola de prea multe ori.");
			defer KickEx(playerid, GetSession(playerid));
			return true;
		}

		SendMsg(playerid, COLOR_LIGHTRED, "Logare >> {ffffff}Ti-ai gresit parola, mai ai %d incercari.", 3 - PlayerInfo[playerid][pAttemps]);

		PlayerInfo[playerid][pAttemps] ++;

		Dialog_Show(playerid, Login, DIALOG_STYLE_PASSWORD,
			""C_SERVER"Logare", "Bine ai revenit %s!\nTe rugam sa introduci parola contului:", "Logare", "Anulare", GetName(playerid));
	}
	else
	{
		gString[0] = (EOS);
		mysql_format(SQL, gString, sizeof(gString), "select * from accounts where name = '%s' limit 1", GetName(playerid));
		mysql_tquery(SQL, gString, "LoadPlayerAccount", "id", playerid, GetSession(playerid));
	}

	return true;
}

Dialog:Login(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		defer KickEx(playerid, GetSession(playerid));
		return true;
	}

	OnPlayerLogin(playerid, MD5_Hash(inputtext));

	return true;
}

function LoadPlayerSpawn(playerid)
{
	SetSpawnInfo(playerid, NO_TEAM, DEFAULT_SKIN, SpawnPos[0], SpawnPos[1], SpawnPos[2], SpawnPos[3], 0, 0, 0, 0, 0, 0);

	SetCameraBehindPlayer(playerid);

	return true;
}

public OnPlayerSpawn(playerid)
{
	if(JobWorking[playerid] != false)
	{
		FailWork(playerid);

		SendMsg(playerid, COLOR_LIGHTRED, "Job >> {ffffff}Ai terminat munca deoarece ai murit.");
	}

	return true;
}

public OnPlayerRequestClass(playerid, classid)
{
	LoadPlayerSpawn(playerid);

	if(PlayerInfo[playerid][pLogat])
	{
		defer Spawn(playerid, GetSession(playerid));
	}

	return true;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	if(Dialog_Opened(playerid) || !PlayerInfo[playerid][pLogat])
		return false;

	return true;
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
	if(result == -1)
	{
		SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}Comanda [/%s] nu exista.", cmd);

		return false;
	}

	return true;
}

function ShowStats(id, playerid)
{
	new
		Name[MAX_PLAYER_NAME + 1],
		ID = PlayerInfo[playerid][pSQLID],
		Cash[32],
		JobName[32],
		Afacerea = PlayerInfo[playerid][pOwnedBusiness]
	;

	format(Name, sizeof(Name), GetName(playerid));
	format(Cash, sizeof(Cash), formatBytes(PlayerCash[playerid]));

	if(PlayerInfo[playerid][pJob])
	{
		format(JobName, sizeof(JobName), JobsInfo[PlayerInfo[playerid][pJob]][jName]);
	}
	else
	{
		format(JobName, sizeof(JobName), "-");
	}

	SendMsg(id, COLOR_SERVER, "Statistici >> {ffffff}Nume: %s[%d], Cash: $%s, Job: %s, Afacerea: %d", Name, ID, Cash, JobName, Afacerea);

	return true;
}

CMD:stats(playerid)
{
	ShowStats(playerid, playerid);

	return true;
}

CMD:changepass(playerid)
{
	if(PlayerInfo[playerid][pDeelayPassword] > gettime())
	{
		new
			Deelay = PlayerInfo[playerid][pDeelayPassword] - gettime()
		;

		SendMsg(playerid, COLOR_RED, "Schimbare parola >> {ffffff}Poti face asta in %d secunde.", Deelay);

		return true;
	}

	Dialog_Show(playerid, ChangePassword, DIALOG_STYLE_PASSWORD, "Schimbare parola", "Introdu mai jos noua parola:", "Inainte", "Anulare");

	return true;
}

Dialog:ChangePassword(playerid, response, listitem, inputtext[])
{
	if(!response)
		return true;

	format(PlayerInfo[playerid][pPassword], 32 + 1, MD5_Hash(inputtext));

	gString[0] = (EOS);
	mysql_format(SQL, gString, sizeof(gString), "update accounts set Password = '%s' where Name = '%s'", PlayerInfo[playerid][pPassword], GetName(playerid));
	mysql_tquery(SQL, gString, "", "");

	PlayerInfo[playerid][pDeelayPassword] = gettime() + 10;

	SendMsg(playerid, COLOR_SERVER, "Schimbare parola >> {ffffff}Ti-ai schimbat parola in %s.", inputtext);

	return true;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	new
		AreaID = AreaInfo[areaid][aID],
		AreaType = AreaInfo[areaid][aType]
	;

	switch(AreaType)
	{
		case 1:
		{
			InJobZone[playerid] = AreaID;

			//SendMsg(playerid, COLOR_SERVER, "Job >> {ffffff}Ai intrat in zona Job-ului %s.", JobsInfo[AreaID][jName]);
		}
		case 2:
		{
			InBusinessZone[playerid] = AreaID;

			//SendMsg(playerid, COLOR_SERVER, "Business >> {ffffff}Ai intrat in zona Business-ului %d.", AreaID);
		}
		case 3:
		{
			InSpawnZone[playerid] = true;

			//SendMsg(playerid, COLOR_SERVER, "Spawn >> {ffffff}Ai intrat in zona Spawn-ului.");
		}
		case 4:
		{
			if(AreaID != playerid && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(AreaID) && GetPlayerInterior(playerid) == GetPlayerInterior(AreaID))
			{
				if(!Iter_Contains(Nearby[AreaID], playerid))
				{
					Iter_Add(Nearby[AreaID], playerid);
				}

				if(!Iter_Contains(Nearby[playerid], AreaID))
				{
					Iter_Add(Nearby[playerid], AreaID);
				}
			}
		}
	}

	return true;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	new
		AreaID = AreaInfo[areaid][aID],
		AreaType = AreaInfo[areaid][aType]
	;

	switch(AreaType)
	{
		case 1:
		{
			InJobZone[playerid] = 0;

			//SendMsg(playerid, COLOR_SERVER, "Job >> {ffffff}Ai iesit din zona Job-ului %s.", JobsInfo[AreaID][jName]);
		}
		case 2:
		{
			InBusinessZone[playerid] = 0;

			//SendMsg(playerid, COLOR_SERVER, "Business >> {ffffff}Ai iesit din zona Business-ului %d.", AreaID);
		}
		case 3:
		{
			InSpawnZone[playerid] = false;

			//SendMsg(playerid, COLOR_SERVER, "Spawn >> {ffffff}Ai iesit din zona Spawn-ului.");
		}
		case 4:
		{
			if(AreaID != playerid)
			{
				if(Iter_Contains(Nearby[AreaID], playerid))
				{
					Iter_Remove(Nearby[AreaID], playerid);
				}

				if(Iter_Contains(Nearby[playerid], AreaID))
				{
					Iter_Remove(Nearby[playerid], AreaID);
				}
			}
		}
	}

	return true;
}

function SendNearbyMessage(playerid, color, const text[], va_args<>)
{
	gString[0] = (EOS);

	va_format(gString, sizeof(gString), text, va_start<3>);

	foreach(new x : Nearby[playerid])
	{
		SendMsg(x, color, gString);
	}

	SendMsg(playerid, color, gString);

	return true;
}

public OnPlayerText(playerid, text[])
{
	SetPlayerChatBubble(playerid, text, COLOR_GREY, 20.0, 5000);

	SendNearbyMessage(playerid, COLOR_WHITE, "%s: %s", GetName(playerid), text);

	return false;
}

CMD:getjob(playerid)
{
	if(InJobZone[playerid] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Get Job >> {ffffff}Nu esti in zona unui loc de munca.");

	new
		Job = InJobZone[playerid]
	;

	if(PlayerInfo[playerid][pJob] != 0)
		return SendMsg(playerid, COLOR_LIGHTRED, "Get Job >> {ffffff}Ai deja un loc de munca.");

	PlayerInfo[playerid][pJob] = Job;
	Iter_Add(PlayersWithJob[Job], playerid);

	SendMsg(playerid, COLOR_SERVER, "Job >> {ffffff}Te-ai angajat la jobul de %s.", JobsInfo[Job][jName]);

	return true;
}

CMD:quitjob(playerid)
{
	new
		Job = PlayerInfo[playerid][pJob]
	;

	if(Job == 0)
		return SendMsg(playerid, COLOR_LIGHTRED, "Job >> {ffffff}Nu ai un loc de munca.");

	if(JobVehicle[playerid] != 0)
	{
		switch(Job)
		{
			case 1:
			{
				FailWork(playerid);

				SendMsg(playerid, COLOR_LIGHTRED, "Job >> {ffffff}Ai terminat munca deoarece ti-ai parasit locul de munca.");
			}
		}
	}

	Iter_Remove(PlayersWithJob[Job], playerid);
	PlayerInfo[playerid][pJob] = 0;

	SendMsg(playerid, COLOR_SERVER, "Job >> {ffffff}Ti-ai parasit locul de munca.");

	return true;
}

CMD:work(playerid)
{
	new
		Job = InJobZone[playerid]
	;

	if(PlayerInfo[playerid][pJob] == Job)
	{
		StartWork(playerid);
	}

	return true;
}

function FailWork(playerid)
{
	if(CP[playerid] != 0)
	{	
		DisablePlayerCheckpointEx(playerid);
		CP[playerid] = 0;
	}

	if(JobCP[playerid] != 0)
	{
		JobCP[playerid] = 0;
	}

	if(JobVehicle[playerid] != 0)
	{	
		DestroyVehicle(JobVehicle[playerid]);
		JobVehicle[playerid] = 0;
	}

	if(StopWork[playerid])
	{
		stop StopWork[playerid];
		StopWork[playerid] = Timer: 0;
	}

	JobWorking[playerid] = false;

	return true;
}

CMD:stopwork(playerid)
{
	if(JobWorking[playerid] != true)
		return SendMsg(playerid, COLOR_LIGHTRED, "Stop Work >> {ffffff}Nu muncesti.");

	FailWork(playerid);

	SendMsg(playerid, COLOR_SERVER, "Stop Work >> {ffffff}Te-ai oprit din a munci.");

	return true;
}

CMD:killcp(playerid)
{
	if(JobVehicle[playerid] != 0)
	{
		switch(PlayerInfo[playerid][pJob])
		{
			case 1:
			{
				FailWork(playerid);

				SendMsg(playerid, COLOR_LIGHTRED, "Job >> {ffffff}Ai terminat munca deoarece ti-ai sters punctul rosu.");
			}
		}
	}

	DisablePlayerCheckpointEx(playerid);
	CP[playerid] = 0;

	SendMsg(playerid, COLOR_SERVER, "Punct rosu >> {ffffff}Ti-ai sters punctul rosu de pe harta.");

	return true;
}

Dialog:CancelCheckpoint(playerid, response, listitem, inputtext[])
{
	if(!response)
		return true;

	PC_EmulateCommand(playerid, "/killcp");

	return true;
}

CMD:jobs(playerid)
{
	if(AreCheckPoint(playerid))
		return Dialog_Show(playerid, CancelCheckpoint, DIALOG_STYLE_MSGBOX, "Anularea punctului rosu", "Ai deja un punct rosu, doresti sa-l anulezi?", "Da", "Nu");

	gString[0] = (EOS);

	for(new Job = 1; Job <= MAX_JOBS; Job++)
	{
		new
			Float: X = JobsInfo[Job][jX],
			Float: Y = JobsInfo[Job][jY],
			Float: Z = JobsInfo[Job][jZ],
			Float: Distance = GetPlayerDistanceFromPoint(playerid, X, Y, Z)
		;

		format(gString, sizeof(gString), "%s%s - %0.2fm\n", gString, JobsInfo[Job][jName], Distance);
	}

	Dialog_Show(playerid, ShowJobs, DIALOG_STYLE_LIST, "Locuri de munca", gString, "Alege", "Anuleaza");

	return true;
}

function GivePlayerCash(playerid, cash)
{
	addBytes32(PlayerCash[playerid], cash);

	if(OPByte(PlayerCash[playerid], <=, #999_999_999))
	{
		GivePlayerMoney(playerid, cash);
	}

	return true;
}

#define GetPlayerCash(%0) bytes32(PlayerCash[%0])

public OnPlayerEnterCheckpoint(playerid)
{
	CheckPointX[playerid] = 0;
	CheckPointY[playerid] = 0;
	CheckPointZ[playerid] = 0;

	switch(CP[playerid])
	{
		case 1:
		{
			SendMsg(playerid, COLOR_SERVER, "Locatii >> {ffffff}Ai ajuns la locatia aleasa.");

			DisablePlayerCheckpointEx(playerid);
			CP[playerid] = 0;
		}
		case 2:
		{
			if(IsPlayerInVehicle(playerid, JobVehicle[playerid]))
			{
				if(JobCP[playerid] >= sizeof(SweeperCPs) - 1)
				{
					new
						Rand = 500 + random(500)
					;

					GivePlayerCash(playerid, Rand);

					SendMsg(playerid, COLOR_SERVER, "Job >> {ffffff}Ai primit $%s pentru munca prestata.", FormatNumber(Rand));

					JobCP[playerid] = 0;

					new
						Float: CPX = SweeperCPs[JobCP[playerid]][0],
						Float: CPY = SweeperCPs[JobCP[playerid]][1],
						Float: CPZ = SweeperCPs[JobCP[playerid]][2]
					;

					SetPlayerCheckpointEx(playerid, CPX, CPY, CPZ, 3);
				}
				else
				{			
					JobCP[playerid] ++;

					new
						Float: CPX = SweeperCPs[JobCP[playerid]][0],
						Float: CPY = SweeperCPs[JobCP[playerid]][1],
						Float: CPZ = SweeperCPs[JobCP[playerid]][2]
					;

					SetPlayerCheckpointEx(playerid, CPX, CPY, CPZ, 3);
				}
			}
		}
	}
	return true;
}

stock CheckPlayerDistanceToVehicle(Float:radi, playerid, vehicleid)
{
	if(!IsValidVehicle(vehicleid))
		return false;

	new
		Float: PlayerX,
		Float: PlayerY,
		Float: PlayerZ,
		Float: VehicleX,
		Float: VehicleY,
		Float: VehicleZ
	;

	GetPlayerPos(playerid,  PlayerX, PlayerY,  PlayerZ);
	GetVehiclePos(vehicleid, VehicleX, VehicleY, VehicleZ);

	new
		Float: Distance = (VehicleX -  PlayerX) * (VehicleX -  PlayerX) + (VehicleY - PlayerY) * (VehicleY - PlayerY) + (VehicleZ -  PlayerZ) * (VehicleZ -  PlayerZ)
	;

	if(Distance <= radi * radi)
		return true;

	return false;
}

stock CreateVehicleEx(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, bool: addsiren = false, bool: lock = false)
{
	new
		vehicleid
	;

	vehicleid = CreateVehicle(vehicletype, x, y, z, rotation, color1, color2, respawn_delay, addsiren);

	if(IsABike(vehicleid))
	{
		VehicleEngine[vehicleid] = true;
	}

	else
	{
		VehicleEngine[vehicleid] = false;
	}

	SetVehicleParamsEx(vehicleid, VehicleEngine[vehicleid], 0, 0, lock, 0, 0, 0);
	VehicleLocked[vehicleid] = lock;

	return vehicleid;
}

stock PutPlayerInVehicleEx(playerid, vehicleid, seatid)
{
	LastVehicle[playerid] = vehicleid;

	return PutPlayerInVehicle(playerid, vehicleid, seatid);
}

stock SetPlayerCheckpointEx(playerid, Float:x, Float:y, Float:z, Float:size)
{
	CheckPointX[playerid] = x;
	CheckPointY[playerid] = y;
	CheckPointZ[playerid] = z;

	return SetPlayerCheckpoint(playerid, Float:x, Float:y, Float:z, Float:size);
}

function DisablePlayerCheckpointEx(playerid)
{
	CheckPointX[playerid] = 0;
	CheckPointY[playerid] = 0;
	CheckPointZ[playerid] = 0;

	return DisablePlayerCheckpoint(playerid);
}

function DestroyVehicleEx(vehicleid)
{
	if(IsValidVehicle(vehicleid))
	{
		foreach(new i : Player)
		{
			if(LastVehicle[i] == vehicleid)
			{
				LastVehicle[i] = 0;
			}
		}

		DestroyVehicle(vehicleid);
	}

	return true;
}

function AreCheckPoint(playerid)
{
	if(CP[playerid] != 0)
		return true;

	return false;
}

function StartWork(playerid)
{
	if(CP[playerid] != 0)
		return SendMsg(playerid, COLOR_LIGHTRED, "Work >> {ffffff}Nu poti incepe munca deoarece ai un punct rosu activ.");

	if(IsPlayerInAnyVehicle(playerid))
		return SendMsg(playerid, COLOR_LIGHTRED, "Work >> {ffffff}Nu poti incepe munca dintr-un vehicul.");

	if(GetPlayerVirtualWorld(playerid) != 0)
		return SendMsg(playerid, COLOR_LIGHTRED, "Work >> {ffffff}Nu poti incepe munca dintr-o lume virtuala.");

	if(GetPlayerInterior(playerid) != 0)
		return SendMsg(playerid, COLOR_LIGHTRED, "Work >> {ffffff}Nu poti incepe munca dintr-un interior.");

	new
		Job = PlayerInfo[playerid][pJob]
	;

	switch(Job)
	{
		case 1:
		{
			JobVehicle[playerid] = CreateVehicleEx(574, 1725.08, -2251.16, 13.3782, 90.6012, 1, 1, -1, false, true);
			PutPlayerInVehicleEx(playerid, JobVehicle[playerid], 0);

			JobCP[playerid] = 0;

			new
				Float: CPX = SweeperCPs[0][0],
				Float: CPY = SweeperCPs[0][1],
				Float: CPZ = SweeperCPs[0][2]
			;

			SetPlayerCheckpointEx(playerid, CPX, CPY, CPZ, 3);
			CP[playerid] = 2;

			SendMsg(playerid, COLOR_SERVER, "Job >> {ffffff}Urmeaza punctele rosii pentru a fi platit.");
		}
	}

	JobWorking[playerid] = true;

	return true;
}

timer BackToPns[5000](playerid, Float: X, Float: Y, Float: Z, Float: A, Vw, session)
{
	if(GetSession(playerid) != session)
		return true;

	new
		vehicleid = GetPlayerVehicleID(playerid)
	;

	SetVehiclePos(vehicleid, X, Y, Z);
	SetVehicleZAngle(vehicleid, A);
	SetVehicleVirtualWorld(vehicleid, Vw);
	SetPlayerVirtualWorld(playerid, Vw);

	TogglePlayerControllable(playerid, 1);

	return true;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	switch(newkeys)
	{
		case KEY_YES:
		{
			if(InJobZone[playerid] != 0)
			{
				if(PlayerInfo[playerid][pJob] != InJobZone[playerid])
				{
					PC_EmulateCommand(playerid, "/getjob");	
				}
				else
				{
					StartWork(playerid);
				}
			}
			else if(InBusinessZone[playerid] != 0)
			{
				switch(BusinessInfo[InBusinessZone[playerid]][bType])
				{
					case 1:
					{
						PC_EmulateCommand(playerid, "/rentveh");
					}
				}
			}
		}
		case KEY_NO:
		{
			if(InJobZone[playerid] != 0)
			{
				PC_EmulateCommand(playerid, "/quitjob");
			}
			else
			{
				PC_EmulateCommand(playerid, "/lock");
			}
		}
		case KEY_LOOK_BEHIND:
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new
					vehicleid = GetPlayerVehicleID(playerid)
				;

				if(!IsABike(vehicleid))
				{
					new
						engine,
						lights,
						alarm,
						doors,
						bonnet,
						boot,
						objective,
						statestring[8]
					;

					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, !engine, lights, alarm, doors, bonnet, boot, objective);
					VehicleEngine[vehicleid] = !VehicleEngine[vehicleid];
					format(statestring, 8, "%s", (VehicleEngine[vehicleid]) ? ("pornit") : ("oprit"));
					SendMsg(playerid, COLOR_SERVER, "Engine >> {ffffff}Ai %s motorul unui %s.", statestring, GetVehicleName(GetVehicleModel(vehicleid)));
				}
			}
		}
		case KEY_ACTION:
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new
					vehicleid = GetPlayerVehicleID(playerid),
					engine,
					lights,
					alarm,
					doors,
					bonnet,
					boot,
					objective
				;

				GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehicleid, engine, !lights, alarm, doors, bonnet, boot, objective);
			}
		}
		case KEY_SECONDARY_ATTACK:
		{
			if(StopFly(playerid) != false)
			{
				SetPlayerHealth(playerid, 100);
				SetPlayerArmour(playerid, 0);
			}
		}
		case KEY_CROUCH:
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				if(InBusinessZone[playerid] != 0)
				{
					new
						Business = InBusinessZone[playerid],
						Type = BusinessInfo[Business][bType]
					;

					switch(Type)
					{
						case 2:
						{
							if(GetPlayerCash(playerid) < 100)
								return SendMsg(playerid, COLOR_LIGHTRED, "Repair Vehicle >> {ffffff}Ai nevoie de $100 pentru a-ti repara vehiculul.");

							new
								Float: PnsInterios[11][4] =
								{	
									{2065.2141, -1831.6058, 13.2739},
									{487.9566, -1740.7080, 10.8720},
									{1024.6099, -1024.4561, 31.8289},
									{719.7646, -458.1036, 16.0637},
									{2393.6670, 1489.1577, 10.5526},
									{1974.1426, 2162.6785, 10.7974},
									{-100.6313, 1117.8337, 19.4688},
									{-1420.5349, 2585.6631, 55.5706},
									{-1936.0715, 243.6312, 34.1866},
									{-1904.7494, 283.6280, 40.7743},
									{-2425.5066, 1022.5943, 50.1250}
								},
								ClosestInterior = 0
							;

							for(new i = 0; i < sizeof(PnsInterios); i++)
							{
								new
									Float: X = PnsInterios[i][0],
									Float: Y = PnsInterios[i][1],
									Float: Z = PnsInterios[i][2],
									Float: LastX = PnsInterios[ClosestInterior][0],
									Float: LastY = PnsInterios[ClosestInterior][1],
									Float: LastZ = PnsInterios[ClosestInterior][2]
								;

								if(GetPlayerDistanceFromPoint(playerid, X, Y, Z) < GetPlayerDistanceFromPoint(playerid, LastX, LastY, LastZ))
								{
									ClosestInterior = i;
								}
							}

							new
								Float: FinalX = PnsInterios[ClosestInterior][0],
								Float: FinalY = PnsInterios[ClosestInterior][1],
								Float: FinalZ = PnsInterios[ClosestInterior][2],
								Float: FinalA = PnsInterios[ClosestInterior][3],
								vehicleid = GetPlayerVehicleID(playerid),
								Float: X,
								Float: Y,
								Float: Z,
								Float: A,
								Vw = GetPlayerVirtualWorld(playerid)
							;

							GetVehiclePos(vehicleid, X, Y, Z);
							GetVehicleZAngle(vehicleid, A);

							SetVehicleVirtualWorld(vehicleid, playerid + 1);
							SetPlayerVirtualWorld(playerid, playerid + 1);
							SetVehiclePos(vehicleid, FinalX, FinalY, FinalZ);
							SetVehicleZAngle(vehicleid, FinalA);

							GivePlayerCash(playerid, - 100);

							BusinessInfo[Business][bSafe] += 100;
							gString[0] = (EOS);
							mysql_format(SQL, gString, sizeof(gString), "update business set safe = %d where id = %d", BusinessInfo[Business][bSafe], Business);
							mysql_tquery(SQL, gString);

							TogglePlayerControllable(playerid, 0);
							defer BackToPns(playerid, X, Y, Z, A, Vw, GetSession(playerid));
						}
					}
				}
			}
		}
	}
	return true;
}

timer StopWork2[120000](playerid, session)
{
	if(GetSession(playerid) != session)
		return true;

	FailWork(playerid);

	SendMsg(playerid, COLOR_LIGHTRED, "Job >> {ffffff}Ai terminat munca deoarece ai parasit vehiculul de Job.");

	return true;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(Iter_Contains(PlayersWithState[oldstate], playerid))
	{
		Iter_Remove(PlayersWithState[oldstate], playerid);
	}

	Iter_Add(PlayersWithState[newstate], playerid);

	switch(newstate)
	{
		case PLAYER_STATE_ONFOOT:
		{
			new
				vehicleid = LastVehicle[playerid]
			;

			if(IsValidVehicle(vehicleid))
			{
				if(vehicleid == RentVehicle[playerid] || vehicleid == JobVehicle[playerid])
				{
					SetVehicleParamsForPlayer(vehicleid, playerid, 0, 0);
				}

				if(vehicleid == JobVehicle[playerid] && PlayerInfo[playerid][pJob] == 1)
				{
					switch(PlayerInfo[playerid][pJob])
					{
						case 1:
						{
							StopWork[playerid] = defer StopWork2(playerid, GetSession(playerid));

							SendMsg(playerid, COLOR_LIGHTRED, "Job >> {ffffff}Ai 120 secunde pentru a te intoarce la vehiculul de Job.");
						}
					}
				}
			}

			LastVehicle[playerid] = 0;
		}
		case PLAYER_STATE_DRIVER:
		{
			if(StopWork[playerid] && JobVehicle[playerid] == GetPlayerVehicleID(playerid))
			{
				stop StopWork[playerid];

				SendMsg(playerid, COLOR_LIGHTRED, "Job >> {ffffff}Te-ai reintors la vehiculul Job-ului.");
			}

			new
				vehicleid = GetPlayerVehicleID(playerid)
			;

			LastVehicle[playerid] = vehicleid;
			PlayerTextDrawSetString(playerid, SpeedometerPTD, "Se incarca...");
			PlayerTextDrawShow(playerid, SpeedometerPTD);
		}
		case PLAYER_STATE_PASSENGER:
		{
			new
				vehicleid = GetPlayerVehicleID(playerid)
			;

			LastVehicle[playerid] = vehicleid;
		}
	}
	switch(oldstate)
	{
		case PLAYER_STATE_DRIVER:
		{
			PlayerTextDrawHide(playerid, SpeedometerPTD);
		}
	}
	return true;
}

CMD:jobchat(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Job Chat >> {ffffff}Nu poti folosi acest chat deoarece nu ai un loc de munca.");

	new
		message[128]
	;

	if(sscanf(params, "s[128]", message))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/jobchat [mesaj]");

	new
		Job = PlayerInfo[playerid][pJob]
	;

	foreach(new x : PlayersWithJob[Job])
	{
		SendMsg(x, COLOR_SERVER, "Job Chat >> {ffffff}%s: %s", GetName(playerid), message);
	}

	return true;
}

alias:jobchat("jc");

CMD:lock(playerid)
{
	new
		vehicleid,
		engine,
		lights,
		alarm,
		doors,
		bonnet,
		boot,
		objective
	;

	if(CheckPlayerDistanceToVehicle(5, playerid, JobVehicle[playerid]))
	{
		vehicleid = JobVehicle[playerid];
	}
	else if(CheckPlayerDistanceToVehicle(5, playerid, RentVehicle[playerid]))
	{
		vehicleid = RentVehicle[playerid];
	}

	if(vehicleid == 0)
		return true;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, !doors, bonnet, boot, objective);

	VehicleLocked[vehicleid] = !VehicleLocked[vehicleid];

	if(!doors == true)
	{
		SetVehicleParamsForPlayer(vehicleid, playerid, objective, doors);
	}

	va_GameTextForPlayer(playerid, "%s~n~%s", 5000, 4, GetVehicleName(GetVehicleModel(vehicleid)), (VehicleLocked[vehicleid]) ? ("~r~Incuiat") : ("~g~Descuiat"));

	return true;
}

new
	RentVehicles[4][2] =
	{
		{481, 100},
		{509, 150},
		{510, 200},
		{400, 250}
	}
;

Dialog:RentVehicles(playerid, response, listitem, inputtext[])
{
	if(!response) return true;

	new
		Model = RentVehicles[listitem][0],
		Cash = RentVehicles[listitem][1],
		Business = InBusinessZone[playerid],
		Float: X = BusinessInfo[Business][bX],
		Float: Y = BusinessInfo[Business][bY],
		Float: Z = BusinessInfo[Business][bZ]
	;

	if(GetPlayerCash(playerid) < Cash)
		return SendMsg(playerid, COLOR_LIGHTRED, "Rent Vehicle >> {ffffff}Ai nevoie de $%s pentru a inchiria un %s.", FormatNumber(Cash), GetVehicleName(Model));

	RentVehicle[playerid] = CreateVehicleEx(Model, X, Y, Z, 90, 1, 1, -1, false, true);
	PutPlayerInVehicleEx(playerid, RentVehicle[playerid], 0);

	GivePlayerCash(playerid, - Cash);

	BusinessInfo[Business][bSafe] += Cash;

	gString[0] = (EOS);
	mysql_format(SQL, gString, sizeof(gString), "update business set safe = %d where id = %d", BusinessInfo[Business][bSafe], Business);
	mysql_tquery(SQL, gString);

	SendMsg(playerid, COLOR_SERVER, "Rent Vehicle >> {ffffff}Ai inchiriat un %s pentru $%s.", GetVehicleName(Model), FormatNumber(Cash));

	return true;
}

CMD:rentveh(playerid)
{
	if(InBusinessZone[playerid] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Rent Vehicle >> {ffffff}Nu esti langa o afacere.");

	if(BusinessInfo[InBusinessZone[playerid]][bType] != 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Rent Vehicle >> {ffffff}Nu esti langa o afacere de tip Rent Vehicle.");

	if(RentVehicle[playerid] != 0)
		return SendMsg(playerid, COLOR_LIGHTRED, "Rent Vehicle >> {ffffff}Ai deja un vehicul inchiriat.");

	if(IsPlayerInAnyVehicle(playerid))
		return SendMsg(playerid, COLOR_LIGHTRED, "Rent Vehicle >> {ffffff}Trebuie sa cobori din vehicul.");

	gString[0] = (EOS);

	for(new i = 0; i < sizeof(RentVehicles); i++)
	{
		new
			Model = RentVehicles[i][0],
			Money = RentVehicles[i][1]
		;
		format(gString, sizeof(gString), "%s%s - $%s\n", gString, GetVehicleName(Model), FormatNumber(Money));
	}

	Dialog_Show(playerid, RentVehicles, DIALOG_STYLE_LIST, "Rent Vehicles", gString, "Alege", "Anuleaza");

	return true;
}

CMD:unrentveh(playerid)
{
	if(RentVehicle[playerid] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Rent Vehicle >> {ffffff}Nu ai un vehicul inchiriat.");

	DestroyVehicle(RentVehicle[playerid]);
	RentVehicle[playerid] = 0;

	SendMsg(playerid, COLOR_SERVER, "Rent Vehicle >> {ffffff}Ai renuntat la vehiculul inchiriat.");

	return true;
}

CMD:findrentveh(playerid)
{
	if(RentVehicle[playerid] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Rent Vehicle >> {ffffff}Nu ai un vehicul inchiriat.");

	new
		Float: X,
		Float: Y,
		Float: Z
	;

	GetVehiclePos(RentVehicle[playerid], X, Y, Z);
	SetPlayerCheckpointEx(playerid, X, Y, Z, 3);
	CP[playerid] = 1;

	SendMsg(playerid, COLOR_SERVER, "Rent Vehicle >> {ffffff}Urmeaza punctul rosu pentru a-ti gasi vehiculul inchiriat.");

	return true;
}

public OnVehicleDeath(vehicleid, killerid)
{
	foreach(new x : Player)
	{
		if(JobVehicle[x] == vehicleid)
		{
			switch(PlayerInfo[x][pJob])
			{
				case 1:
				{
					JobCP[x] = 0;

					JobVehicle[x] = 0;

					SendMsg(x, COLOR_RED, "Job >> {ffffff}Ai terminat munca deoarece ai distrus vehiculul.");
				}
			}
		}

		if(RentVehicle[x] == vehicleid)
		{
			RentVehicle[x] = 0;

			SendMsg(x, COLOR_RED, "Rent Vehicle >> {ffffff}Vehiculul inchiriat a fost distrus.");
		}

		if(LastVehicle[x] == vehicleid)
		{
			LastVehicle[x] = 0;
		}
	}

	if(Iter_Contains(SpawnedVehicles, vehicleid))
	{
		Iter_Remove(SpawnedVehicles, vehicleid);
	}

	DestroyVehicle(vehicleid);

	return true;
}

CMD:set(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6 && !IsPlayerAdmin(playerid))
		return WithoutAcces(playerid);

	new
		id,
		item[16],
		amount
	;

	if(sscanf(params, "us[32]i", id, item, amount))
	{
		SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/set [player] [item] [amount]");
		SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}Optiuni: Admin, Cash, Job");

		return true;
	}

	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !PlayerInfo[id][pLogat])
		return SendMsg(playerid, COLOR_LIGHTRED, "Set >> {ffffff}Jucatorul este invalid.");

	switch(YHash(item))
	{
		case _H<admin>:
		{
			if(amount < 0 || amount > 6)
				return SendMsg(playerid, COLOR_LIGHTRED, "Set >> {ffffff}Numarul este invalid(0 - 6).");

			PlayerInfo[id][pAdmin] = amount;

			gString[0] = (EOS);
			mysql_format(SQL, gString, sizeof(gString), "update accounts set admin = %d where id = %d", amount, PlayerInfo[id][pSQLID]);
			mysql_tquery(SQL, gString);
		}

		case _H<cash>:
		{
			if(amount < 0 || amount > 999_999_999)
				return SendMsg(playerid, COLOR_LIGHTRED, "Set >> {ffffff}Numarul este invalid(0 - $999,999,999).");

			resetBigInt(PlayerCash[id]);

			GivePlayerCash(id, amount);
		}

		case _H<job>:
		{
			if(amount < 0 || amount > MAX_JOBS)
				return SendMsg(playerid, COLOR_LIGHTRED, "Set >> {ffffff}Numarul este invalid(0 - %d).", MAX_JOBS);

			PlayerInfo[id][pJob] = amount;
		}

		default:
		{
			return SendMsg(playerid, COLOR_LIGHTRED, "Set >> {ffffff}Parametrul [%s] nu este valid.", item);
		}
	}

	SendMsg(playerid, COLOR_RED, "Set >> {ffffff}I-ai setat lui %s %s pe %d.", GetName(id), item, amount);
	SendMsg(id, COLOR_RED, "Set >> {ffffff}%s ti-a setat %s pe %d.", GetName(playerid), item, amount);

	return true;
}

function InsertBusiness(playerid, Float: X, Float: Y, Float: Z, Type, Session)
{
	if(GetSession(playerid) != Session)
		return true;

	new
		id = cache_insert_id()
	;

	BusinessInfo[id][bX] = X;
	BusinessInfo[id][bY] = Y;
	BusinessInfo[id][bZ] = Z;
	BusinessInfo[id][bType] = Type;
	format(BusinessInfo[id][bOwner], MAX_PLAYER_NAME + 1, "Server");

	UpdateBusiness(id);

	TotalBusiness ++;

	return true;
}

CMD:createbusiness(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6)
		return WithoutAcces(playerid);

	new
		Type
	;

	if(sscanf(params, "i", Type))
	{
		SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/createbusiness [tip]");
		SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}Tipuri de afaceri: 1 - Rent Vehicle, 2 - Repair Vehicle");
		return true;
	}

	if(TotalBusiness + 1 > MAX_BUSINESS)
		return SendMsg(playerid, COLOR_LIGHTRED, "Create Business >> {ffffff}Serverul a ajuns la maximul de afaceri.");

	if(Type < 1 || Type > 2)
		return SendMsg(playerid, COLOR_LIGHTRED, "Create Business >> {ffffff}Tip de afacere invalid.");

	new
		Float: X,
		Float: Y,
		Float: Z
	;

	GetPlayerPos(playerid, X, Y, Z);

	gString[0] = (EOS);
	mysql_format(SQL, gString, sizeof(gString), "insert into business (X, Y, Z, Type) values ('%0.2f', '%0.2f', '%0.2f', '%d')", X, Y, Z, Type);
	mysql_tquery(SQL, gString, "InsertBusiness", "ifffii", playerid, X, Y, Z, Type, GetSession(playerid));

	return true;
}

CMD:fly(playerid)
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return WithoutAcces(playerid);

	if(IsPlayerInAnyVehicle(playerid))
	{
		new
			vehicleid = GetPlayerVehicleID(playerid),
			Float: VelX,
			Float: VelY,
			Float: VelZ
		;
		GetVehicleVelocity(vehicleid, VelX, VelY, VelZ);
		SetVehicleVelocity(vehicleid, VelX, VelY, VelZ + 0.5);
		return true;
	}

	if(StartFly(playerid) == true)
	{
		SetPlayerHealth(playerid, 100000);
		SetPlayerArmour(playerid, 100000);
	}

	else
	{
		StopFly(playerid);
		SetPlayerHealth(playerid, 100);
		SetPlayerArmour(playerid, 0);
	}

	return true;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if(PlayerInfo[playerid][pAdmin] != 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			new
				vehicleid = GetPlayerVehicleID(playerid)
			;

			SetVehiclePos(vehicleid, fX, fY, fZ);
		}

		else
		{
			SetPlayerPosition(playerid, fX, fY, fZ);
		}
	}

	return true;
}

CMD:gotoxyz(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return WithoutAcces(playerid);

	new
		Float: X,
		Float: Y,
		Float: Z,
		VirtualWorld,
		Interior
	;

	if(sscanf(params, "fffii", X, Y, Z, VirtualWorld, Interior))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/gotoxyz [x] [y] [z] [virtualworld] [interior]");

	if(IsPlayerInAnyVehicle(playerid))
	{
		new
			vehicleid = GetPlayerVehicleID(playerid)
		;

		SetVehiclePos(vehicleid, X, Y, Z);
		SetVehicleVirtualWorld(vehicleid, VirtualWorld);
		LinkVehicleToInterior(vehicleid, Interior);
	}

	else
	{
		SetPlayerPosition(playerid, X, Y, Z);
	}

	SetPlayerVirtualWorld(playerid, VirtualWorld);
	SetPlayerInterior(playerid, Interior);

	return true;
}

CMD:fixveh(playerid)
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return WithoutAcces(playerid);

	if(!IsPlayerInAnyVehicle(playerid))
		return SendMsg(playerid, COLOR_LIGHTRED, "Fix Veh >> {ffffff}Nu te afli intr-un vehicul.");

	new
		vehicleid = GetPlayerVehicleID(playerid)
	;

	RepairVehicle(vehicleid);

	SendMsg(playerid, COLOR_SERVER, "Fix Veh >> {ffffff}Ai reparat vehiculul cu id %d.", vehicleid);

	return true;
}

alias:fixveh("fv", "arepair", "fixvehicle");

CMD:flip(playerid)
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return WithoutAcces(playerid);

	if(!IsPlayerInAnyVehicle(playerid))
		return SendMsg(playerid, COLOR_LIGHTRED, "Flip >> {ffffff}Nu te afli intr-un vehicul.");

	new
		vehicleid = GetPlayerVehicleID(playerid),
		Float: Angle
	;

	GetVehicleZAngle(vehicleid, Angle);
	SetVehicleZAngle(vehicleid, Angle);

	SendMsg(playerid, COLOR_SERVER, "Flip >> {ffffff}Ai intors vehiculul cu id %d.", vehicleid);

	return true;
}

CMD:a(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return WithoutAcces(playerid);

	new
		message[128]
	;

	if(sscanf(params, "s[128]", message))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/a [message]");

	SendAdmins(COLOR_ORANGE, "Admin Chat >> {ffffff}%s: %s", GetName(playerid), message);

	return true;
}

function AssignPlayerFPS(playerid)
{
    new
    	Drunk = GetPlayerDrunkLevel(playerid)
    ;

    if(Drunk < 100)
    {
        SetPlayerDrunkLevel(playerid, 2000);
    }

    else
    {
        if(PlayerInfo[playerid][pDrunkLevelLast] != Drunk) {

            new
            	FPS = PlayerInfo[playerid][pDrunkLevelLast] - Drunk
            ;

            if(FPS > 0 && FPS < 400)
            {
	            PlayerInfo[playerid][pFPS] = FPS;
            }

            PlayerInfo[playerid][pDrunkLevelLast] = Drunk;
        }
    }

    return true;
}


task OneSecondTimer[1000]()
{
	new
		hour,
		minute,
		second,
		year,
		month,
		day
	;

	gettime(hour, minute, second);
	getdate(year, month, day);

	va_TextDrawSetString(DateAndTimeTD, "%02d:%02d:%02d~n~~w~~h~%02d/%02d/%02d", hour, minute, second, day, month, year);

	foreach(new x : LoggedPlayers)
	{
		if(GetPlayerMoney(x) != bytes32(PlayerCash[x]))
		{
			new
				RealMoney = bytes32(PlayerCash[x])
			;

			ResetPlayerMoney(x);
			GivePlayerMoney(x, RealMoney);
		}

		AssignPlayerFPS(x);
	}

	foreach(new x : PlayersWithState[2])
	{
		new
			vehicleid = GetPlayerVehicleID(x),
			speed = GetVehicleSpeed(vehicleid),
			bool: locked = VehicleLocked[vehicleid],
			statetext[2][16] = {"~g~Descuiat", "~r~Incuiat"}
		;

		va_PlayerTextDrawSetString(x, SpeedometerPTD, "Viteza: ~g~%d~w~~h~ km/h~n~Stare: %s", speed, statetext[locked]);
	}

	foreach(new x : FpsText)
	{
		new
			FPS = GetFPS(x)
		;

		if(PlayerInfo[x][pServerText] == true)
		{
			new
				TickRate = GetServerTickRate(),
				Queries = mysql_unprocessed_queries()
			;

			va_PlayerTextDrawSetString(x, InfoPTD, "FPS: ~g~%d~w~~h~, TickRate: ~r~%d~w~~h~, Queries: ~b~%d", FPS, TickRate, Queries);
		}

		else
		{
			va_PlayerTextDrawSetString(x, InfoPTD, "FPS: ~g~%d", FPS);
		}
	}

	return true;
}

CMD:spawnvehicle(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}Nu ai acces aceasta comanda.");

	new
		Model
	;

	if(sscanf(params, "i", Model))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/spawnvehicle [model]");

	if(Model < 400 || Model > 611)
		return SendMsg(playerid, COLOR_LIGHTRED, "Spawn Vehicle >> {ffffff}Vehiculul este invalid(400 - 611).");

	new
		vehicleid,
		Float: X,
		Float: Y,
		Float: Z,
		Float: Rotation,
		VirtualWorld,
		Interior
	;

	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, Rotation);

	vehicleid = CreateVehicleEx(Model, X, Y, Z, Rotation, random(256), random(256), -1, false, false);
	SetVehicleVirtualWorld(vehicleid, VirtualWorld);
	LinkVehicleToInterior(vehicleid, Interior);

	PutPlayerInVehicleEx(playerid, vehicleid, 0);

	Iter_Add(SpawnedVehicles, vehicleid);

	SendAdmins(COLOR_ORANGE, "Admin-ul %s a creat un vehicul de tip %s, %d vehicule create in total.", GetName(playerid), GetVehicleName(Model), Iter_Count(SpawnedVehicles));

	return true;
}

alias:spawnvehicle("spawncar", "spawnveh", "veh", "vspawn", "ecar");

CMD:despawnvehicles(playerid)
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}Nu ai acces aceasta comanda.");

	if(Iter_Count(SpawnedVehicles) < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Despawn vehicles >> {ffffff}Nu exista vehicule spawnate.");

	foreach(new x : SpawnedVehicles)
	{
		DestroyVehicle(x);
	}

	Iter_Clear(SpawnedVehicles);

	SendAdmins(COLOR_ORANGE, "Admin-ul %s a distrus toate vehiculele create.", GetName(playerid));

	return true;
}

alias:despawnvehicles("dav", "destroyvehicles", "despawncars");

CMD:kick(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}Nu ai acces aceasta comanda.");

	new
		id,
		reason[32]
	;

	if(sscanf(params, "us[32]", id, reason))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/kick [player] [reason]");

	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !PlayerInfo[id][pLogat])
		return SendMsg(playerid, COLOR_LIGHTRED, "Kick >> {ffffff}Jucatorul este invalid.");

	if(PlayerInfo[id][pAdmin] >= PlayerInfo[playerid][pAdmin] && !IsPlayerAdmin(playerid))
		return SendMsg(playerid, COLOR_LIGHTRED, "Kick >> {ffffff}Nu poti da afara acel jucator.");

	va_SendClientMessageToAll(COLOR_TEAL, "Kick >> {ffffff}%s a fost dat afara de %s, motiv: %s", GetName(id), GetName(playerid), reason);

	defer KickEx(id, PlayerInfo[id][pSession]);

	return true;
}

CMD:gotocheckpoint(playerid)
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return WithoutAcces(playerid);

	if(CheckPointX[playerid] == 0 && CheckPointY[playerid] == 0 && CheckPointZ[playerid] == 0)
		return SendMsg(playerid, COLOR_LIGHTRED, "Goto Checkpoint >> {ffffff}Nu ai un punct rosu activ.");

	new
		Float: x = CheckPointX[playerid],
		Float: y = CheckPointY[playerid],
		Float: z = CheckPointZ[playerid]
	;

	if(IsPlayerInAnyVehicle(playerid))
	{
		new
			vehicleid = GetPlayerVehicleID(playerid)
		;

		SetVehiclePos(vehicleid, x, y, z);
	}

	else
	{
		SetPlayerPosition(playerid, x, y, z);
	}

	SendMsg(playerid, COLOR_SERVER, "Goto Checkpoint >> {ffffff}Ai fost teleportat la locatia punctului rosu.");

	return true;
}

alias:gotocheckpoint("gotocp", "gcp");

Dialog:BusinessMenu(playerid, response, listitem, inputtext[])
{
	if(!response || listitem < 0)
		return true;

	switch(listitem)
	{
		case 0:
		{
			new
				Business = PlayerInfo[playerid][pOwnedBusiness],
				Safe = BusinessInfo[Business][bSafe]
			;

			if(Business < 1)
				return SendMsg(playerid, COLOR_LIGHTRED, "Afacere >> {ffffff}Nu ai o afacere.");

			Dialog_Show(playerid, BusinessWithdraw, DIALOG_STYLE_INPUT, "Seiful Afacerii", "$%s in seif\nIntrodu suma pe care vrei sa o scoti:", "Inainte", "Iesi", FormatNumber(Safe));
		}
		case 1:
		{
			new
				Business = PlayerInfo[playerid][pOwnedBusiness],
				Price = BusinessInfo[Business][bPrice]
			;

			Dialog_Show(playerid, BusinessSell, DIALOG_STYLE_INPUT, "Vinde Afacerea", "Introdu noul pret:\nPret actual: $%s", "Inainte", "Iesi", FormatNumber(Price));
		}
		case 2:
		{
			Dialog_Show(playerid, BusinessSellToState, DIALOG_STYLE_MSGBOX, "Vinde Afacerea la Stat", "Vrei sa vinzi afacerea la stat?\nNu vei primi nimic.", "Inainte", "Iesi");
		}
	}

	return true;
}

Dialog:BusinessWithdraw(playerid, response, listitem, inputtext[])
{
	if(!response)
		return true;

	new
		Business = PlayerInfo[playerid][pOwnedBusiness],
		Safe = BusinessInfo[Business][bSafe],
		Money = strval(inputtext)
	;

	if(Business < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Afacere >> {ffffff}Nu ai o afacere.");

	if(Money < 1 || Money > Safe)
		return SendMsg(playerid, COLOR_LIGHTRED, "Afacere >> {ffffff}Suma introdusa este invalida($1 - $%s)", FormatNumber(Safe));

	GivePlayerCash(playerid, Money);

	BusinessInfo[Business][bSafe] -= Money;

	Query_Mysql("update business set safe = %d where id = %d", Safe - Money, Business);

	SendMsg(playerid, COLOR_SERVER, "Afacere >> {ffffff}Ai scos $%s din seiful afacerii si au mai ramas $%s.", FormatNumber(Money), FormatNumber(Safe - Money));

	return true;
}

Dialog:BusinessSell(playerid, response, listitem, inputtext[])
{
	if(!response)
		return true;

	new
		Business = PlayerInfo[playerid][pOwnedBusiness],
		Money = strval(inputtext)
	;

	if(Business < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Afacere >> {ffffff}Nu ai o afacere.");

	if(Money < 1 || Money > 999_999_999)
		return SendMsg(playerid, COLOR_LIGHTRED, "Afacere >> {ffffff}Suma introdusa este invalida($1 - $999,999,999)");

	BusinessInfo[Business][bPrice] = Money;

	Query_Mysql("update business set Price = %d where id = %d", Money, Business);

	UpdateBusiness(Business);

	SendMsg(playerid, COLOR_SERVER, "Afacere >> {ffffff}Ai setat pretul afacerii la $%s.", FormatNumber(Money));

	return true;
}

Dialog:BusinessSellToState(playerid, response)
{
	if(!response)
		return true;

	new
		Business = PlayerInfo[playerid][pOwnedBusiness]
	;

	if(Business < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Afacere >> {ffffff}Nu ai o afacere.");

	PlayerInfo[playerid][pOwnedBusiness] = 0;

	BusinessInfo[Business][bPrice] = 0;
	format(BusinessInfo[Business][bOwner], 7, "Server");

	Query_Mysql("update business set Price = %d, Owner = '%s' where id = %d", BusinessInfo[Business][bPrice], BusinessInfo[Business][bOwner], Business);

	UpdateBusiness(Business);

	SendMsg(playerid, COLOR_SERVER, "Afacere >> {ffffff}Ai vandut la stat Afacerea %d.", Business);

	return true;
}

CMD:businessmenu(playerid)
{
	if(PlayerInfo[playerid][pOwnedBusiness] < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}Nu poti folosi aceasta comanda deoarece nu ai o Afacere.");

	Dialog_Show(playerid, BusinessMenu, DIALOG_STYLE_LIST, "Meniul Afacerii", "Seif\nVinde\nVinde la Stat", "Inainte", "Iesi");

	return true;
}

alias:businessmenu("bmenu", "bizmenu");

Dialog:Hud(playerid, response, listitem, inputtext[])
{
	if(!response || listitem < 0)
		return true;

	switch(listitem)
	{
		case 0:
		{
			if(PlayerInfo[playerid][pFpsText] == false)
			{
				EnableFPS(playerid);
			}

			else
			{
				Iter_Remove(FpsText, playerid);
				PlayerTextDrawHide(playerid, InfoPTD);
				PlayerInfo[playerid][pServerText] = false;
			}

			PlayerInfo[playerid][pFpsText] = !PlayerInfo[playerid][pFpsText];
		}

		case 1:
		{
			if(PlayerInfo[playerid][pAdmin] < 1)
				return SendMsg(playerid, COLOR_LIGHTRED, "Hud >> {ffffff}Nu ai acces la aceasta optiune.");

			if(PlayerInfo[playerid][pFpsText] == false)
				return SendMsg(playerid, COLOR_LIGHTRED, "Hud >> {ffffff}Trebuie sa activezi 'Informatii FPS' pentru a face asta.");

			PlayerInfo[playerid][pServerText] = !PlayerInfo[playerid][pServerText];
		}
	}

	SendMsg(playerid, COLOR_SERVER, "Hud >> {ffffff}Optiunile tale au fost actualizate.");

	return true;
}

CMD:hud(playerid)
{
	Dialog_Show(playerid, Hud, DIALOG_STYLE_LIST, "Hud", "Informatii FPS\nInformatii Server", "Alege", "Iesi");

	return true;
}

CMD:respawn(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return WithoutAcces(playerid);

	new
		id
	;

	if(sscanf(params, "u", id))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/respawn [player]");

	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !PlayerInfo[id][pLogat])
		return SendMsg(playerid, COLOR_LIGHTRED, "Respawn >> {ffffff}Jucatorul este invalid.");

	defer Spawn(id, PlayerInfo[id][pSession]);

	SendMsg(playerid, COLOR_RED, "Respawn >> {ffffff}I-ai dat respawn lui %s.", GetName(id));
	SendMsg(playerid, COLOR_RED, "Respawn >> {ffffff}Ai primit respawn de la %s.", GetName(playerid));

	return true;
}

alias:respawn("spawn");

CMD:clearmychat(playerid)
{
	ClearChat(playerid, 20);

	return true;
}

alias:clearmychat("cmc");

CMD:givemoney(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6)
		return WithoutAcces(playerid);

	new
		id, money
	;

	if(sscanf(params, "ui", id, money))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/givemoney [id] [money]");

	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !PlayerInfo[id][pLogat])
		return SendMsg(playerid, COLOR_LIGHTRED, "Give Money >> {ffffff}Jucatorul este invalid.");

	if(money < -999_999_999 || money > 999_999_999)
		return SendMsg(playerid, COLOR_LIGHTRED, "Give Money >> {ffffff}Suma este invalida(-$999,999,999 - $999,999,999).");

	GivePlayerCash(id, money);

	SendMsg(playerid, COLOR_RED, "Give Money >> {ffffff}I-ai dat $%s lui %s.", FormatNumber(money), GetName(id));
	SendMsg(id, COLOR_RED, "Give Money >> {ffffff}Ai primit $%s de la %s.", FormatNumber(money), GetName(playerid));

	return true;
}

CMD:check(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1)
		return WithoutAcces(playerid);

	new
		id
	;

	if(sscanf(params, "u", id))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/check [id]");

	if(id == INVALID_PLAYER_ID || !IsPlayerConnected(id) || !PlayerInfo[id][pLogat])
		return SendMsg(playerid, COLOR_LIGHTRED, "Check >> {ffffff}Jucatorul este invalid.");

	ShowStats(playerid, id);

	return true;
}

CMD:help(playerid)
{
	Dialog_Show(playerid, HelpCategories, DIALOG_STYLE_LIST, "Help", "General\nJoburi\nVehicule Inchiriate\nAfaceri\nAdmin", "Alege", "Anuleaza");

	return true;
}

Dialog:HelpCategories(playerid, response, listitem, inputtext[])
{
	if(!response || listitem < 0)
		return true;

	new
		Title[20]
	;

	gString[0] = (EOS);

	switch(listitem)
	{
		case 0:
		{
			format(Title, sizeof(Title), "General");

			format(gString, sizeof(gString), "/stats, /changepass, /killcp, /lock, /hud, /clearmychat, /gps");
		}
		case 1:
		{
			format(Title, sizeof(Title), "Joburi");

			format(gString, sizeof(gString), "/jobs, /getjob, /quitjob, /work, /stopwork, /jobchat");
		}
		case 2:
		{
			format(Title, sizeof(Title), "Vehicule Inchiriate");

			format(gString, sizeof(gString), "/rentveh, /unrentveh, /findrentveh");
		}
		case 3:
		{
			format(Title, sizeof(Title), "Afaceri");

			format(gString, sizeof(gString), "/buybusiness, /businessmenu");

		}
		case 4:
		{
			if(PlayerInfo[playerid][pAdmin] < 1)
				return SendMsg(playerid, COLOR_LIGHTRED, "Help >> {ffffff}Nu ai acces la aceasta categorie.");

			format(Title, sizeof(Title), "Admin");

			format(gString, sizeof(gString), "/set, /createbusiness, /fly, /gotoxyz, /fixveh, /flip, /a, /spawnvehicle, /despawnvehicles \n\
				/kick, /gotocheckpoint, /respawn, /givemoney, /check, /editbusiness");
		}
		default:
		{
			return SendMsg(playerid, COLOR_LIGHTRED, "Help >> {ffffff}Optiunea este invalida.");
		}
	}

	Dialog_Show(playerid, Empty, DIALOG_STYLE_MSGBOX, Title, gString, "Iesi", "");

	return true;
}

CMD:editbusiness(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6)
		return WithoutAcces(playerid);

	new
		id,
		item[8],
		value
	;

	if(sscanf(params, "is[8]i", id, item, value) && !strmatch(item, "move"))
		return SendMsg(playerid, COLOR_LIGHTRED, "Comenzi >> {ffffff}/editbusiness [id] [item: price, move, type] [value]");

	if(id < 1 || id > TotalBusiness)
		return SendMsg(playerid, COLOR_LIGHTRED, "Edit Business >> {ffffff}Id-ul afacerii este invalid.");

	switch(YHash(item))
	{
		case _H<price>:
		{
			if(value < 0 || value > 999_999_999)
				return SendMsg(playerid, COLOR_LIGHTRED, "Edit Business >> {ffffff}Pret invalid($0 - $999,999,999).");

			BusinessInfo[id][bPrice] = value;

			Query_Mysql("update business set Price = %d where id = %d", value, id);

			SendAdmins(COLOR_LIGHTRED, "Admin-ul %s a setat pretul afacerii %d la $%s.", GetName(playerid), id, FormatNumber(value));

		}
		case _H<move>:
		{
			if(GetPlayerVirtualWorld(playerid) != 0)
				return SendMsg(playerid, COLOR_LIGHTRED, "Edit Business >> {ffffff}Nu poti muta afacerea intr-un virtual world.");

			if(GetPlayerInterior(playerid) != 0)
				return SendMsg(playerid, COLOR_LIGHTRED, "Edit Business >> {ffffff}Nu poti muta afacerea intr-un interior.");

			new
				Float: x,
				Float: y,
				Float: z
			;

			GetPlayerPos(playerid, x, y, z);

			BusinessInfo[id][bX] = x;
			BusinessInfo[id][bY] = y;
			BusinessInfo[id][bZ] = z;

			gString[0] = (EOS);
			mysql_format(SQL, gString, sizeof(gString), "update business set x = %0.2f, y = %0.2f, z = %0.2f where id = %d", x, y, z, id);
			mysql_tquery(SQL, gString, "", "");

			SendAdmins(COLOR_LIGHTRED, "Admin-ul %s a mutat afacerea %d la %0.2f, %0.2f, %0.2f.", GetName(playerid), id, x, y, z);
		}
		case _H<type>:
		{
			if(value < 1 || value > 2)
				return SendMsg(playerid, COLOR_LIGHTRED, "Edit Business >> {ffffff}Tip de afacere invalid.");

			BusinessInfo[id][bType] = value;

			Query_Mysql("update business set Type = %d where id = %d", value, id);

			SendAdmins(COLOR_LIGHTRED, "Admin-ul %s a setat afacerea %d ca '%s'", GetName(playerid), id, BusinessNames[value]);
		}
		default:
		{
			return SendMsg(playerid, COLOR_LIGHTRED, "Edit Business >> {ffffff}Parametrul [%s] nu este valid.", item);
		}
	}

	UpdateBusiness(id);

	return true;
}

CMD:buybusiness(playerid)
{
	if(InBusinessZone[playerid] == 0)
		return SendMsg(playerid, COLOR_LIGHTRED, "Buy Business >> {ffffff}Nu esti langa o Afacere.");

	new
		Biz = InBusinessZone[playerid],
		Price = BusinessInfo[Biz][bPrice],
		Owner[MAX_PLAYER_NAME + 1]
	;

	format(Owner, sizeof(Owner), BusinessInfo[Biz][bOwner]);

	if(Price < 1)
		return SendMsg(playerid, COLOR_LIGHTRED, "Buy Business >> {ffffff}Afacerea nu este de vanzare.");

	if(GetPlayerCash(playerid) < Price)
		return SendMsg(playerid, COLOR_LIGHTRED, "Buy Business >> {ffffff}Nu ai $%s.", FormatNumber(Price));
	
	GivePlayerCash(playerid, - Price);

	if(!strmatch(Owner, "Server"))
	{
		new
			OwnerID = BizOwnerGameID[Biz]
		;

		if(OwnerID != INVALID_PLAYER_ID)
		{
			PlayerInfo[OwnerID][pOwnedBusiness] = 0;

			GivePlayerCash(OwnerID, Price);

			SendMsg(OwnerID, COLOR_SERVER, "Business >> {ffffff}%s ti-a cumparat Afacerea %d pentru $%s.", GetName(playerid), Biz, FormatNumber(Price));
		}
		else
		{
			Query_Mysql("update accounts set Cash = Cash + %d where Name = '%s'", Price, Owner);
		}
	}

	BizOwnerGameID[Biz] = playerid;

	BusinessInfo[Biz][bPrice] = 0;

	format(BusinessInfo[Biz][bOwner], strlen(GetName(playerid)) + 1, GetName(playerid));
	Query_Mysql("update business set Owner = '%s', Price = %d where id = %d", BusinessInfo[Biz][bOwner], BusinessInfo[Biz][bPrice], Biz);

	UpdateBusiness(Biz);

	PlayerInfo[playerid][pOwnedBusiness] = Biz;

	SendMsg(playerid, COLOR_SERVER, "Buy Business >> {ffffff}Ai cumparat Afacerea %d de tip '%s' pentru $%s.",
		Biz, BusinessNames[BusinessInfo[Biz][bType]], FormatNumber(Price));

	return true;
}

CMD:gps(playerid)
{
	if(AreCheckPoint(playerid))
		return Dialog_Show(playerid, CancelCheckpoint, DIALOG_STYLE_MSGBOX, "Anularea punctului rosu", "Ai deja un punct rosu, doresti sa-l anulezi?", "Da", "Nu");

	Dialog_Show(playerid, Locations, DIALOG_STYLE_LIST, "Locatiile Serverului", "Afaceri", "Alege", "Anuleaza");

	return true;
}

alias:gps("locations");

Dialog:Locations(playerid, response, listitem, inputtext[])
{
	if(!response)
		return true;

	switch(listitem)
	{
		case 0:
		{
			gString[0] = (EOS);

			for(new i = 1; i <= TotalBusiness; i++)
			{
				new
					TypeId = BusinessInfo[i][bType],
					Type[16],
					Float: X = BusinessInfo[i][bX],
					Float: Y = BusinessInfo[i][bY],
					Float: Z = BusinessInfo[i][bZ],
					Float: Distance = GetPlayerDistanceFromPoint(playerid, X, Y, Z)
				;

				format(Type, sizeof(Type), BusinessNames[TypeId]);

				format(gString, sizeof(gString), "%s\n%d. %s - %0.2fm", gString, i, Type, Distance);
			}

			Dialog_Show(playerid, LocationsBusiness, DIALOG_STYLE_LIST, "Afacerile Serverului", gString, "Alege", "Anuleaza");
		}
	}

	return true;
}

Dialog:LocationsBusiness(playerid, response, listitem, inputtext[])
{
	if(!response)
		return true;

	new
		Biz = listitem + 1,
		TypeId = BusinessInfo[Biz][bType],
		Type[16],
		Float: X = BusinessInfo[Biz][bX],
		Float: Y = BusinessInfo[Biz][bY],
		Float: Z = BusinessInfo[Biz][bZ]
	;

	format(Type, sizeof(Type), BusinessNames[TypeId]);

	SetPlayerCheckpointEx(playerid, X, Y, Z, 3);
	CP[playerid] = 1;

	SendMsg(playerid, COLOR_SERVER, "Locatii >> {ffffff}Urmeaza punctul rosu pentru a ajunge la Afacerea %d de tip '%s'.", Biz, Type);

	return true;
}