; --------------------------------------------------------------------------------
; Versatile Logging Library
;
; Revision: 12 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

; Log Formatting
;
; %yyyy - 4 digit year
; %yy - 2 digit year
; %mm - 2 digit month
; %dd - 2 digit day
; %hh - 2 digit hour
; %ii - 2 digit minute
; %ss - 2 digit seconds
;
; %msg - The log message
; %type - Log message type in lowercase
; %Type - Log message type as Capitalised case
; %TYPE - Log message type in UPPERCASE
; %module - Origin module in lowercase
; %Module - Origin module in Capitalised case
; %MODULE - Origin module in UPPERCASE
; %proc - Origin procedure in lowercase
; %Proc - Origin procedure in Capitalised case
; %PROC - Origin procedure in UPPERCASE
;
; Example: [%hh:%ii:%ss] [%Module::%Proc] %TYPE: %msg

DeclareModule Log
  
  Enumeration Level
    #Log_All
    #Log_Trace
    #Log_Info
    #Log_Success
    #Log_Warning
    #Log_Error
    #Log_Fatal
    #Log_None
  EndEnumeration
  
  Prototype pLogOutput(Level, Message.s)
  
  Declare AttachLogOutput(*Output.pLogOutput) ; Add a log output/target. Procedure must match pLogOutput signature.
  Declare RemoveLogOutput(*Output.pLogOutput) ; Remove a log output/target.
  Declare SetLogLevel(LogLevel = #Log_Info) ; Set Log Level (#Log_All to #Log_None)
  Declare SetLogFormat(LogFormat.s = "[%hh:%ii:%ss] %Type: %msg") ; See Above
  Declare LogToConsole(State = #True) ; Enable/disable printing to console
  
  Declare LogMessage(Message.s, LogLevel = #Log_Info, ModuleName.s = "", ProcedureName.s = "") ; Log message (use helpers below)
  
  Macro Trace(Message)
    Log::LogMessage(Message, Log::#Log_Trace, #PB_Compiler_Module, #PB_Compiler_Procedure)
  EndMacro
  
  Macro Info(Message)
    Log::LogMessage(Message, Log::#Log_Info, #PB_Compiler_Module, #PB_Compiler_Procedure)
  EndMacro
  
  Macro Success(Message)
    Log::LogMessage(Message, Log::#Log_Success, #PB_Compiler_Module, #PB_Compiler_Procedure)
  EndMacro
  
  Macro Warning(Message)
    Log::LogMessage(Message, Log::#Log_Warning, #PB_Compiler_Module, #PB_Compiler_Procedure)
  EndMacro
  
  Macro Error(Message)
    Log::LogMessage(Message, Log::#Log_Error, #PB_Compiler_Module, #PB_Compiler_Procedure)
  EndMacro
  
  Macro Fatal(Message)
    Log::LogMessage(Message, Log::#Log_Fatal, #PB_Compiler_Module, #PB_Compiler_Procedure)
  EndMacro
  
EndDeclareModule

Module Log
  
  Structure sLogger
    *mutex
    logLevel.i
    logFormat.s
    toConsole.a
    List *output()
  EndStructure
  
  Global gLogger.sLogger
  With gLogger
    \mutex = CreateMutex()
    \logFormat = "[%hh:%ii:%ss] %Type: %msg"
  EndWith
  
  Procedure ConsoleLogOutput(Level, Message.s)
    Select Level
      Case Log::#Log_Trace
        ConsoleColor(3, 0)
      Case Log::#Log_Info
        ConsoleColor(7, 0)
      Case Log::#Log_Success
        ConsoleColor(10, 0)
      Case Log::#Log_Warning
        ConsoleColor(14, 0)
      Case Log::#Log_Error
        ConsoleColor(12, 0)  
      Case Log::#Log_Fatal
        ConsoleColor(0, 12)
    EndSelect
    PrintN(Message)
    ConsoleColor(7, 0) ; Revert to Default
  EndProcedure
  
  Procedure AttachLogOutput(*Output.pLogOutput)
    Protected exists.a = #False
    With gLogger
      LockMutex(\mutex)
      ForEach \output()
        If \output() = *Output
          exists = #True
          Break
        EndIf
      Next
      If exists = #False
        AddElement(\output())
        \output() = *Output
      EndIf
      UnlockMutex(\mutex)
    EndWith
  EndProcedure
  
  Procedure RemoveLogOutput(*Output.pLogOutput)
    With gLogger
      LockMutex(\mutex)
      ForEach \output()
        If \output() = *Output
          DeleteElement(\output())
          ProcedureReturn
        EndIf
      Next
      UnlockMutex(\mutex)
    EndWith
  EndProcedure
  
  Procedure LogToConsole(State = #True)
    gLogger\toConsole = State
  EndProcedure
  
  Procedure SetLogLevel(LogLevel = #Log_Info)
    gLogger\logLevel = LogLevel
  EndProcedure
  
  Procedure SetLogFormat(LogFormat.s = "[%hh:%ii:%ss] %Type: %msg")
    LogFormat = Trim(LogFormat)
    If LogFormat = ""
      LogFormat = "%msg"
    EndIf
    gLogger\logFormat = LogFormat
  EndProcedure
  
  Procedure LogMessage(Message.s, LogLevel = #Log_Info, ModuleName.s = "", ProcedureName.s = "")
    Protected type.s, output.s, *handler.pLogOutput
    
    LockMutex(gLogger\mutex)
    
    If LogLevel < gLogger\logLevel
      ProcedureReturn
    EndIf
    
    Select LogLevel
      Case #Log_Trace
        type = "Trace"
      Case #Log_Info
        type = "Info"
      Case #Log_Success
        type = "Success"
      Case #Log_Warning
        type = "Warning"
      Case #Log_Error
        type = "Error"
      Case #Log_Fatal
        type = "Fatal"
    EndSelect
    
    output = FormatDate(gLogger\logFormat, Date())
    output = ReplaceString(output, "%type", LCase(type), #PB_String_CaseSensitive)
    output = ReplaceString(output, "%Type", type, #PB_String_CaseSensitive)
    output = ReplaceString(output, "%TYPE", UCase(type), #PB_String_CaseSensitive)
    output = ReplaceString(output, "%msg", Message, #PB_String_NoCase)
    output = ReplaceString(output, "%module", LCase(ModuleName), #PB_String_CaseSensitive)
    output = ReplaceString(output, "%Module", ModuleName, #PB_String_CaseSensitive)
    output = ReplaceString(output, "%MODULE", UCase(ModuleName), #PB_String_CaseSensitive)
    output = ReplaceString(output, "%proc", LCase(ProcedureName), #PB_String_CaseSensitive)
    output = ReplaceString(output, "%Proc", ProcedureName, #PB_String_CaseSensitive)
    output = ReplaceString(output, "%PROC", UCase(ProcedureName), #PB_String_CaseSensitive)
    
    Debug output
    
    If gLogger\toConsole
      ConsoleLogOutput(LogLevel, output)
    EndIf
    ForEach gLogger\output()
      *handler = gLogger\output()
      *handler(LogLevel, output)
    Next
    UnlockMutex(gLogger\mutex)
    
  EndProcedure
  
EndModule

;- Example Start
CompilerIf #PB_Compiler_IsMainFile
  
  DeclareModule LoggerTest
    Declare RunTest()
  EndDeclareModule
  
  Module LoggerTest
    Procedure RunTest()
      Log::Trace("Message!")
      Log::Info("Message!")
      Log::Success("Message!")
      Log::Warning("Message!")
      Log::Error("Message!")
      Log::Fatal("Message!")
    EndProcedure
  EndModule
  
  OpenConsole("Logger Example")
  EnableGraphicalConsole(#True)
  
  Log::LogToConsole(#True)
  Log::SetLogLevel(Log::#Log_All)
  Log::SetLogFormat("[%hh:%ii:%ss] [%Module::%Proc] %TYPE: %msg")
  
  LoggerTest::RunTest()
  
  PrintN("Example ended. Hit return to quit")
  Input()
  End  
  
CompilerEndIf
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 231
; FirstLine = 204
; Folding = ----
; EnableXP