@echo off
setlocal EnableExtensions EnableDelayedExpansion

cd /d "%~dp0"

echo === ROOT SUSPEITO ===
if not exist _suspect_root mkdir _suspect_root

for /f "delims=" %%F in ('dir /b /a-d') do (
    if /i not "%%F"=="scan_server.cmd" ^
    if /i not "%%F"=="build.log" ^
    if /i not "%%~xF"==".sln" ^
    if /i not "%%~xF"==".vcxproj" ^
    if /i not "%%~xF"==".filters" ^
    if /i not "%%~xF"==".props" ^
    if /i not "%%~xF"==".txt" (
        echo SUSPEITO NA RAIZ: %%F
    )
)

echo.
echo === PROCURANDO PCH/STDAFX DO SERVER ===
dir /s /b server\stdafx.h server\Pch.h 2>nul

echo.
echo === WINDOWS.H ANTES DE WINSOCK2.H ===
findstr /s /n /i "#include.*Windows.h #include.*WinSock2.h #include.*winsock.h" server\*.h server\*.cpp shared\*.h shared\*.cpp > scan_includes.txt
type scan_includes.txt

echo.
echo === POSSIVEIS INCLUDES FALTANDO / TIPOS PROBLEMATICOS ===
findstr /s /n /i "CMutex WRITEDBG ShellExecuteA CaravanBase XmasTreeBase MountUserListData lua_State NumberIPToStringIPV4" server\*.h server\*.cpp shared\*.h shared\*.cpp > scan_known_patterns.txt
type scan_known_patterns.txt

echo.
echo === NAKED / JMP / CALLT / ENDERECOS FIXOS ===
findstr /s /n /i "NAKED JMP( CALLT( 0x004 0x005 0x006 0x007 0x073" server\*.h server\*.cpp shared\*.h shared\*.cpp > scan_hooks.txt
type scan_hooks.txt

echo.
echo === POSSIVEIS MACROS MIN/MAX ===
findstr /s /n /i "#define min #define max min( max(" server\*.h server\*.cpp shared\*.h shared\*.cpp > scan_minmax.txt
type scan_minmax.txt

echo.
echo === FORWARD DECLARATIONS COM VECTOR ===
findstr /s /n /i "struct .*; std::vector< class .*; std::vector<" server\*.h shared\*.h > scan_forward_vector.txt
type scan_forward_vector.txt

echo.
echo === RESUMO GERADO ===
echo scan_includes.txt
echo scan_known_patterns.txt
echo scan_hooks.txt
echo scan_minmax.txt
echo scan_forward_vector.txt

echo.
echo Agora compila o server e salva o erro assim:
echo msbuild server\server.sln /p:Configuration=Debug /p:Platform=Win32 /m /fl /flp:logfile=server_build.log;verbosity=normal

pause