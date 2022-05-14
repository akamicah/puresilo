; --------------------------------------------------------------------------------
; Math Additional Library
;
; Revision: 14 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule Math
  
  Declare.d RSqr(Number.d) ; Reciprocal Square Root
  
EndDeclareModule

Module Math
  
  Procedure.d RSqr(Number.d)
    ProcedureReturn 1.0 / Number
  EndProcedure  
  
EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 18
; Folding = -
; EnableXP
