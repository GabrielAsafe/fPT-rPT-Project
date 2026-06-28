@echo off

cd /d C:\Users\gaymer\Desktop\fPT-rPT-Project

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86

set VCTargetsPath=C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V140\

"C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin\MSBuild.exe" server\server\server.vcxproj /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v140 /p:WindowsTargetPlatformVersion=10.0.19041.0

pause