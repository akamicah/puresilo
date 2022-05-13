; --------------------------------------------------------------------------------
; Extended String Functions Library
;
; Revision: 13 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule String

  Declare IsLeft(String.s, ToCheck.s, CaseSensitive = #False)
  Declare IsRight(String.s, ToCheck.s, CaseSensitive = #False)
  Declare.s RemoveIfLeft(String.s, ToCheck.s, CaseSensitive = #False)
  Declare.s RemoveIfRight(String.s, ToCheck.s, CaseSensitive = #False)

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

EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 35
; FirstLine = 15
; Folding = --
; EnableXP