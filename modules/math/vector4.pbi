; --------------------------------------------------------------------------------
; Math Vector4 Library
;
; Revision: 13 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------


DeclareModule Vector4

  Structure sVector4f Align #PB_Structure_AlignC
    x.f
    y.f
    z.f
    w.f
  EndStructure

  Declare InitVector4f(*Vector.sVector4f, X.f = 0.0, Y.f = 0.0, Z.f = 0.0, W.f = 0.0)

EndDeclareModule

Module Vector4

  Procedure InitVector4f(*Vector.sVector4f, X.f = 0.0, Y.f = 0.0, Z.f = 0.0, W.f = 0.0)
    With *Vector
      \x = X
      \y = Y
      \z = Z
      \w = W
    EndWith
  EndProcedure

EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 1
; Folding = -
; EnableXP