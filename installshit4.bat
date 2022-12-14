@echo off

rem Work and development packages

rem Office 2019
choco install -y office2019proplus --params "/Language:ru-RU"

rem Visual Studio C++/C# stuff
choco install -y visualstudio2022community
choco install -y visualstudio2022-workload-nativedesktop --package-parameters "--add Microsoft.VisualStudio.Component.VC.ATLMFC --remove Component.Microsoft.VisualStudio.LiveShare.2022;Microsoft.VisualStudio.Component.VC.TestAdapterForBoostTest;Microsoft.VisualStudio.Component.VC.TestAdapterForGoogleTest;Microsoft.VisualStudio.Component.IntelliCode"
choco install -y visualstudio2022-workload-manageddesktop --package-parameters "--remove Microsoft.VisualStudio.Component.DotNetModelBuilder"

rem Python
choco install -y python PyCharm-community

rem node.js stuff
choco install -y visualstudio2019-workload-vctools nodejs-lts

rem Git stuff
choco install -y git --params "/GitAndUnixToolsOnPath /NoAutoCrlf /NoShellIntegration /WindowsTerminalProfile /DefaultBranchName:master /Editor:Notepad++"
choco install -y github-desktop tortoisegit

pause
exit
