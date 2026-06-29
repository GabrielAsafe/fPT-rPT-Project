@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%%~dp0"

echo === GAME VCXPROJ ===
dir /s /b game\game\game.vcxproj

echo === GAME OUTPUT / DLL / DEF / POSTBUILD ===
findstr /n /i "ConfigurationType TargetName TargetExt OutDir IntDir PostBuildEvent xcopy copy export.def .dll" game\game\game.vcxproj game\game\*.props game\game\*.def

echo === CAMINHOS ABSOLUTOS ANTIGOS ===
findstr /s /n /i "D:\\ C:\\RPT C:\\FPT" game\game\game.vcxproj game\game\*.props

echo === INCLUDES DO GAME ===
findstr /n /i "IncludePath SourcePath AdditionalIncludeDirectories LibraryPath AdditionalLibraryDirectories" game\game\game.vcxproj game\game\*.props

echo === WINDOWS.H / WINSOCK ===
findstr /s /n /i "#include.*Windows.h #include.*WinSock2.h #include.*winsock.h" game\game\*.h game\game\*.cpp shared\*.h shared\*.cpp > scan_game_includes.txt
type scan_game_includes.txt

echo === C++17 SUSPEITO ===
findstr /s /n /i "std::filesystem std::scoped_lock if ( auto if ( int namespace .*::" game\game\*.h game\game\*.cpp shared\*.h shared\*.cpp > scan_game_cpp17.txt
type scan_game_cpp17.txt

echo === NAKED / JMP / CALLT / ENDERECOS FIXOS ===
findstr /s /n /i "NAKED JMP( CALLT( 0x004 0x005 0x006 0x007 0x073" game\game\*.h game\game\*.cpp shared\*.h shared\*.cpp > scan_game_hooks.txt
type scan_game_hooks.txt

echo === MIN/MAX ===
findstr /s /n /i "#define min #define max min( max(" game\game\*.h game\game\*.cpp shared\*.h shared\*.cpp > scan_game_minmax.txt
type scan_game_minmax.txt

echo === RESUMO ===
echo scan_game_includes.txt
echo scan_game_cpp17.txt
echo scan_game_hooks.txt
echo scan_game_minmax.txt

pause
