; --------------------------------------------------------------------------------
; Math Vector3 Library
;
; Revision: 13 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------


DeclareModule Vector3

  Structure sVector3f Align #PB_Structure_AlignC
    x.f
    y.f
    z.f
  EndStructure

  Declare InitVector3f(*Vector.sVector3f, X.f = 0.0, Y.f = 0.0, Z.f = 0.0)

EndDeclareModule

Module Vector3

  Procedure InitVector3f(*Vector.sVector3f, X.f = 0.0, Y.f = 0.0, Z.f = 0.0)
    With *Vector
      \x = X
      \y = Y
      \z = Z
    EndWith
  EndProcedure

EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 1
; Folding = -
; EnableXP