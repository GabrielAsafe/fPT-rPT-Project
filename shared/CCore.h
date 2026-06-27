#pragma once

#include "CCommon.h"

class CApplication;


extern CApplication		* pcApplication;
extern BOOL				  g_bRunning;

#define APPLICATION		(pcApplication)

#define SYSTEM			(APPLICATION->GetSystem())
#define PROCESS			(APPLICATION->GetProcess())
#define WINDOW			(APPLICATION->GetWindow())

#define RUNNING			g_bRunning