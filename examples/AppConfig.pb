XIncludeFile "../modules/log.pbi"
XIncludeFile "../modules/appconfig.pbi"

UseModule Log
UseModule AppConfig

OpenConsole("AppConfig Example")
EnableGraphicalConsole(#True)

LogToConsole(#True)
SetLogFormat("%msg")

LoadAppConfigPrefs("./appConfig.prefs")
AppConfigUseEnvVars(#True)

NewList Keys.s()
GetAppConfigKeys(Keys())

ForEach Keys()
  Info(Keys() + ": " + GetAppConfig(Keys(), "Unknown!"))
Next

Success("Example ended. Hit return to quit")
Input()
End 0
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 24
; EnableXP