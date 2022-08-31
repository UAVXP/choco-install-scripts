@echo off

choco install -y visualstudio2022community
choco install -y visualstudio2022-workload-nativedesktop --package-parameters "--add Microsoft.VisualStudio.Component.VC.ATLMFC --remove Component.Microsoft.VisualStudio.LiveShare.2022;Microsoft.VisualStudio.Component.VC.TestAdapterForBoostTest;Microsoft.VisualStudio.Component.VC.TestAdapterForGoogleTest;Microsoft.VisualStudio.Component.IntelliCode"
choco install -y visualstudio2022-workload-manageddesktop --package-parameters "--remove Microsoft.VisualStudio.Component.DotNetModelBuilder"

pause
