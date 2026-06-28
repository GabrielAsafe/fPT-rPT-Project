#include "stdafx.h"
#include "CWorld.h"
#include "CIocpUtils.h"

CWorld::CWorld(EWorldID _iWorldID, string _strName, unsigned long _lIP, USHORT _uPort, string _strGameName, string _strShortGameName, string _strWebsite, unsigned long _lIP2, unsigned long _lIP3)
{
	iWorldID = _iWorldID;
	strName = _strName;
	lIP = _lIP;
	uPort = _uPort;

	strGameName = _strGameName;
	strShortGameName = _strShortGameName;
	strWebsite = _strWebsite;

	lIP2 = _lIP2;
	lIP3 = _lIP3;

	strIP = IOCP::CIocpUtils::NumberIPToStringIPV4(lIP);
	strIP2 = IOCP::CIocpUtils::NumberIPToStringIPV4(lIP2);
	strIP3 = IOCP::CIocpUtils::NumberIPToStringIPV4(lIP3);
}

CWorld::~CWorld()
{
}

void CWorld::SetIP(unsigned long _lIP)
{
	lIP = _lIP;
	strIP = IOCP::CIocpUtils::NumberIPToStringIPV4(lIP);
}