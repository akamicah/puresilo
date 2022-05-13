; --------------------------------------------------------------------------------
; Math Rectangle Library
;
; Revision: 13 May 2022
; Author: akamicah (https://github.com/akamicah)
; Licence: MIT
; --------------------------------------------------------------------------------

DeclareModule Rectangle

  Structure sRectanglef Align #PB_Structure_AlignC
    x.f
    y.f
    width.f
    height.f
  EndStructure

  Declare InitRectanglef(*Rectangle.sRectanglef, X.f = 0.0, Y = 0.0, Width.f = 0.0, Height.f = 0.0)

EndDeclareModule

Module Rectangle

  Procedure InitRectanglef(*Rectangle.sRectanglef, X.f = 0.0, Y = 0.0, Width.f = 0.0, Height.f = 0.0)
    With *Rectangle
      \x = X
      \y = Y
      \width = Width
      \height = Height
    EndWith
  EndProcedure

EndModule
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 10
; Folding = -
; EnableXP
