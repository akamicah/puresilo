; --------------------------------------------------------------------------------
; Extended String Functions Library
;
; Revision: 15 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule String
  
  Enumeration
    #StringCase_Lower
    #StringCase_Capitalised
    #StringCase_Upper
  EndEnumeration
  
  Declare IsLeft(String.s, ToCheck.s, CaseSensitive = #False)
  Declare IsRight(String.s, ToCheck.s, CaseSensitive = #False)
  Declare.s RemoveIfLeft(String.s, ToCheck.s, CaseSensitive = #False)
  Declare.s RemoveIfRight(String.s, ToCheck.s, CaseSensitive = #False)
  Declare.b StringToBool(String.s)
  Declare.s BoolToString(Value.b, StringCase = #StringCase_Capitalised)
  
EndDeclareModule

Module String
  
  Procedure IsLeft(String.s, ToCheck.s, CaseSensitive = #False)
    If CaseSensitive = #False
      String = LCase(String)
      ToCheck = LCase(ToCheck)
    EndIf
    If Left(String, Len(ToCheck)) = ToCheck
      ProcedureReturn #True
    EndIf
    ProcedureReturn #False
  EndProcedure
  
  Procedure IsRight(String.s, ToCheck.s, CaseSensitive = #False)
    If CaseSensitive = #False
      String = LCase(String)
      ToCheck = LCase(ToCheck)
    EndIf
    If Right(String, Len(ToCheck)) = ToCheck
      ProcedureReturn #True
    EndIf
    ProcedureReturn #False
  EndProcedure
  
  Procedure.s RemoveIfLeft(String.s, ToCheck.s, CaseSensitive = #False)
    If IsLeft(String, ToCheck, CaseSensitive)
      String = Right(String, Len(String) - Len(ToCheck))
    EndIf
    ProcedureReturn String
  EndProcedure
  
  Procedure.s RemoveIfRight(String.s, ToCheck.s, CaseSensitive = #False)
    If IsRight(String, ToCheck, CaseSensitive)
      String = Left(String, Len(String) - Len(ToCheck))
    EndIf
    ProcedureReturn String
  EndProcedure
  
  Procedure.b StringToBool(String.s)
    Select LCase(String)
      Case "true", "1", "yes"
        ProcedureReturn #True
    EndSelect
    ProcedureReturn #False
  EndProcedure
  
  Procedure.s BoolToString(Value.b, StringCase = #StringCase_Capitalised)
    Select StringCase
      Case #StringCase_Capitalised
        If Value 
          ProcedureReturn "True"
        Else
          ProcedureReturn "False"
        EndIf
      Case #StringCase_Upper
        If Value 
          ProcedureReturn "TRUE"
        Else
          ProcedureReturn "FALSE"
        EndIf        
      Default
        If Value 
          ProcedureReturn "true"
        Else
          ProcedureReturn "false"
        EndIf
    EndSelect    
  EndProcedure
  
EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 3
; Folding = --
; EnableXP