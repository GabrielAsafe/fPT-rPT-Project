
#pragma once

#include <sstream>
#include <ctime>
#include <filesystem>

#include<strsafe.h>
#include <Windows.h>
#include <cstdint>
#include <string>
#include <vector>
#include <memory>

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


#include "achievement.h"
#include "sound.h"
#include "quest.h"

using namespace std;