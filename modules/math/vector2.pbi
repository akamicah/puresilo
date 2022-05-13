; --------------------------------------------------------------------------------
; Math Vector2 Library
;
; Revision: 13 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule Vector2

  Structure sVector2f Align #PB_Structure_AlignC
    x.f
    y.f
  EndStructure

  Declare InitVector2f(*Vector.sVector2f, X.f = 0.0, Y.f = 0.0)

EndDeclareModule

Module Vector2

  Procedure InitVector2f(*Vector.sVector2f, X.f = 0.0, Y.f = 0.0)
    With *vector
      \x = x
      \y = y
    EndWith
  EndProcedure

EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; Folding = -
; EnableXP
