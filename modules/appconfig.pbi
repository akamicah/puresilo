; --------------------------------------------------------------------------------
; Application Configuration Module
; Keep configuration in one place accessible throughout application.
; Supports environmental variables too (if enabled) with $EnvVar
;
; Revision: 15 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

XIncludeFile "string.pbi"

DeclareModule AppConfig

  #AppConfig_Separator = "."

  Declare ClearAppConfig()
  Declare LoadAppConfigPrefs(PrefsFile.s, AppendConfig = #True)
  Declare.s GetAppConfig(Key.s, DefaultValue.s = "")
  Declare SetAppConfig(Key.s, Value.s)
  Declare AppConfigUseEnvVars(State = #True)
  Declare GetAppConfigKeys(List Result.s())

EndDeclareModule

Module AppConfig

  Structure sAppConfig
    *mutex
    useEnvVars.b
    Map values.s()
  EndStructure

  Global gAppConfig.sAppConfig
  gAppConfig\mutex = CreateMutex()

  Procedure ClearAppConfig()
    With gAppConfig
      LockMutex(\mutex)
      ClearMap(\values())
      UnlockMutex(\mutex)
    EndWith
  EndProcedure

  Procedure LoadAppConfigPrefs(PrefsFile.s, AppendConfig = #True)
    With gAppConfig
      LockMutex(\mutex)

      If FileSize(PrefsFile) < 1
        ProcedureReturn #False
      EndIf

      If OpenPreferences(PrefsFile) = 0
        ProcedureReturn #False
      EndIf

      If AppendConfig = #False
        ClearAppConfig()
      EndIf

      Define.s path

      ; Ingest root keys
      ExaminePreferenceKeys()
      While NextPreferenceKey()
        SetAppConfig(PreferenceKeyName(), PreferenceKeyValue())
      Wend

      ; Examine and ingest groups
      ExaminePreferenceGroups()
      While NextPreferenceGroup()
        PreferenceGroup(PreferenceGroupName())
        path = PreferenceGroupName() + #AppConfig_Separator
        ExaminePreferenceKeys()
        While NextPreferenceKey()
          SetAppConfig(path + PreferenceKeyName(), PreferenceKeyValue())
        Wend
      Wend

      ClosePreferences()
      UnlockMutex(\mutex)
    EndWith
  EndProcedure

  Procedure.s GetAppConfig(Key.s, DefaultValue.s = "")
    Protected value.s = DefaultValue
    With gAppConfig
      LockMutex(\mutex)
      If FindMapElement(\values(), Key)
        value = \values(Key)
        If \useEnvVars And FindString(value, "$")
          ExamineEnvironmentVariables()
          While NextEnvironmentVariable()
            value = ReplaceString(value, "$" + EnvironmentVariableName(), EnvironmentVariableValue(), #PB_String_NoCase)
          Wend
        EndIf
      EndIf
      UnlockMutex(\mutex)
      ProcedureReturn value
    EndWith
  EndProcedure

  Procedure SetAppConfig(Key.s, Value.s)
    With gAppConfig
      String::RemoveIfLeft(Key, #AppConfig_Separator)
      LockMutex(\mutex)
      \values(Key) = Value
      UnlockMutex(\mutex)
    EndWith
  EndProcedure

  Procedure AppConfigUseEnvVars(State = #True)
    With gAppConfig
      LockMutex(\mutex)
      \useEnvVars = State
      UnlockMutex(\mutex)
    EndWith
  EndProcedure

  Procedure GetAppConfigKeys(List Result.s())
    With gAppConfig
      ClearList(Result())
      LockMutex(\mutex)
      ForEach \values()
        AddElement(Result())
        Result() = MapKey(\values())
      Next
      UnlockMutex(\mutex)
    EndWith
  EndProcedure

EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 3
; Folding = --
; EnableXP