XIncludeFile "../modules/log.pbi"
XIncludeFile "../modules/uuid.pbi"

UseModule Log
UseModule UUID

OpenConsole("UUID Example")
EnableGraphicalConsole(#True)

LogToConsole(#True)
SetLogFormat("%msg")

Define uuid.sUUID

UUID::MakeNilUUID(@uuid)
Info("Nill: " + UUID::UUIDToString(@uuid))

UUID::MakeV3UUID(@uuid, "test", #Null)
Info("Version 3: " + UUID::UUIDToString(@uuid))

UUID::MakeV4UUID(@uuid)
Info("Version 4: " + UUID::UUIDToString(@uuid))

UUID::MakeV5UUID(@uuid, "test", #Null)
Info("Version 5: " + UUID::UUIDToString(@uuid))

Info("")

; Finish Example
Success("Example finished. Hit return to quit.")
Input()
CloseConsole()
End 0
; IDE Options = PureBasic 6.03 beta 4 LTS (Linux - x64)
; CursorPosition = 16
; EnableXP
; DPIAware