
#pragma once

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX

#include <WinSock2.h>
#include <MSWSock.h>
#include <WS2tcpip.h>
#include <Windows.h>

#include <sstream>
#include <ctime>
#include <filesystem>
#include <strsafe.h>
#include <cstdint>
#include <string>
#include <vector>
#include <memory>
#include <map>
#include <mutex>

#include "strings.h"
#include "common.h"
#include "point.h"
#include "packets.h"
#include "chat.h"
class EXEModel;
class EXEMesh;
class PTModel;
class PTMesh;

#ifndef PTModel_ptr
#define PTModel_ptr EXEModel*
#endif

#ifndef WM_UPDATE
#define WM_UPDATE (WM_USER + 1)
#endif

#ifndef MAX_UNITS
#define MAX_UNITS 4096
#endif

#ifndef IDI_ICON2
#define IDI_ICON2 107
#endif

#include "achievement.h"
#include "sound.h"
#include "quest.h"

using namespace std;