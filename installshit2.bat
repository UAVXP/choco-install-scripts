@echo off

rem Important things

choco install -y^
 vcredist-all^
 dotnet3.5^
 dotnet^
 googlechrome^
 directx^
 notepadplusplus^
 7zip^
 irfanview^
 irfanviewplugins^
 k-litecodecpack-standard^
 qbittorrent^
 paint.net^
 javaruntime^
 winmerge^
 putty.install^
 winscp^
 wiztree^
 telegram^
 warp^
 ChocolateyGUI

choco install -y openvpn --package-parameters="/AddToDesktop /Gui /GuiOnLogon /EasyRsa /DcoDriver /TapDriver /WintunDriver /OpenSSL"

pause
exit
