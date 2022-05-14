XIncludeFile "../modules/log.pbi"

UseModule Log

DeclareModule LoggerTest
  Declare RunTest()
EndDeclareModule

Module LoggerTest
  
  UseModule Log
  
  Procedure RunTest()
    Trace("Message!")
    Info("Message!")
    Success("Message!")
    Warning("Message!")
    Error("Message!")
    Fatal("Message!")
  EndProcedure

EndModule

OpenConsole("Logger Example")
EnableGraphicalConsole(#True)

LogToConsole(#True)
SetLogLevel(Log::#Log_All)
SetLogFormat("[%hh:%ii:%ss] [%Module::%Proc] %TYPE: %msg")

LoggerTest::RunTest()

Success("Example ended. Hit return to quit")
Input()
End 0
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 34
; Folding = -
; EnableXP